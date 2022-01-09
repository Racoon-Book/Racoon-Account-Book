// ScreenshotImportSheet.swift

import SwiftDate
import SwiftUI
import UIKit
import Vision
import XCLog

struct ScreenshotImportSheet: View {
    @Environment(\.managedObjectContext) private var context

    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    /// 在导入界面上显示的图片
    @State private var displayImage: Image? = nil

    /// 是否正在显示系统的照片选择器
    @State private var showingImagePicker = false

    /// original system screenshot from Photos
    @State private var systemScreenshot: UIImage?

    /// 从截图中读取出来的条目
    @State var weChatBills: [WeChatBillInfo] = []

    var body: some View {
        NavigationView {
            VStack {
                if displayImage != nil {
                    HStack {
                        displayImage!
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                        // TODO: 在添加支付宝导入之后添加微信图标

                        // TODO: 添加多张图片的导入
//                        Button(action: {
//                            XCLog("clicked 添加新账单")
//                        }) {
//                                Label("添加新账单", systemImage: "photo")
//                        }
                    }
//                    .padding() // 图片与sheet上边别接触
                }

                if weChatBills.count != 0 {
                    VStack(alignment: .leading) {
                        ScrollView {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(defaultColorSet.cardBackground)

                                VStack {
                                    HStack {
                                        Text("识别出\(weChatBills.count)条花销")
                                        Text("共\(String(format: "%.1f", weChatBills.sum()))元")
                                    }
                                    .padding()

                                    // TODO: change to List
                                    ForEach(Array(weChatBills.enumerated()), id: \.element) { i, weChatBill in

                                        // weChatBillView
                                        // TODO: 添加点击修改
                                        HStack {
                                            Image(systemName:
                                                weChatBill.isSelected ? "checkmark.circle" : "circle")
                                                .foregroundColor(.accentColor)

                                            VStack(alignment: .leading) {
                                                Text(weChatBill.name)
                                                    .font(.title3)
                                                    .foregroundColor(.primary)
                                                Text(DisplayDate(weChatBill.spentAtDate))
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }

                                            Spacer()

                                            Text(String(format: "%.1f", weChatBill.amount))
                                                .font(.title)
                                        }
                                        .padding(3) // 不同账单之间的
                                        .onTapGesture {
                                            weChatBills[i].isSelected.toggle()
                                        }
                                    }
                                }
                                .padding(3) // 给白框外围加padding
                            }
                            .padding() // 白色框和手机边框
                        }
                    }

                    LargeButton(title: "导入所选账目",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                        // 导入数据库 清除状态 收回sheet
                        AddSelectedWeChatBills()
                        RacoonSheetConfig.shared.showingScreenshotImportSheet = false
                        ClearImportSheetState()
                    }
                    .padding() // 离下面远一点
                } else {
                    // WeChatBills.count == 0
                    Spacer()
                    VStack {
                        Text("还没有选择截图哦")
                            .padding()
                        Text("「微信」我的 -> 支付 -> 钱包 -> 交易")
                        Text("截图后回到此页面从相册中导入即可")
                        // TODO: 截图去重
                    }.padding()
                    Spacer()
                    LargeButton(title: "选择微信账单截图",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                        showingImagePicker = true
                    }
                    .padding()
                }
            }
            .background(defaultColorSet.alertBackground)

            .navigationBarTitle("截图导入")
            .navigationBarTitleDisplayMode(.inline)

            // [Sheet左右两侧的按钮]
            .navigationBarItems(
                // 左边有两个按钮
                leading:
                HStack {
                    Button(action: {
                        ClearImportSheetState() // 清空正在输入的 ExpenseInfo

                        RacoonSheetConfig.shared.showingScreenshotImportSheet = false // 收回sheet
                    }) { Text("取消").bold() }

                    if weChatBills.count != 0 {
                        Button(action: {
                            withAnimation {
                                ClearImportSheetState()
                            }
                        }) { Text("清除").bold() }
                    } else {
                        EmptyView()
                    }
                },
                // 右边有一个按钮
                trailing:
                HStack {
                    if weChatBills.count != 0 {
                        Button(action: {
                            // FIXME:
                            // 导入数据库 清除状态 收回sheet
                            AddSelectedWeChatBills()
                            RacoonSheetConfig.shared.showingScreenshotImportSheet = false
                            ClearImportSheetState()
                        }) { Text("导入").bold() }
                    } else {
                        EmptyView()
                    }
                }
            )

            .sheet(isPresented: $showingImagePicker,
                   onDismiss: textExtractFromScreenshot) {
                ImagePicker(image: self.$systemScreenshot)
            }
        }
    }

    private func ClearImportSheetState() {
        displayImage = nil
        showingImagePicker = false
        systemScreenshot = nil
        weChatBills = []
    }

    private func AddSelectedWeChatBills() {
        // FIXME:
        for wechatBill in weChatBills {
            if wechatBill.isSelected == true {
                Expense.create(expenseInfo: wechatBill.toExpenseInfo(), context: context)
            }
        }

        // TODO: 添加成功显示提示 添加了几条
//            RacoonSheetConfig.shared.showingSuccessfullyAlert = true // 注意不能直接在这里用这个，因为alert的内容没有指定为多条
    }

    private func textExtractFromScreenshot() {
        // 清空WeChatBills
        weChatBills = []

        XCLog(.trace, "loadImage()")
        if let screenshot = systemScreenshot {
            XCLog(.trace, "inputImage not nil")

            displayImage = Image(uiImage: screenshot) // 显示的还是原始截图

            // MARK: Crop Image

            let w = screenshot.size.width
            let h = screenshot.size.height
            let x_start = CGFloat(51.0 / 325.0)
            let y_start = CGFloat(125.0 / 708.0)
            let croppedScreenshot: UIImage = cropImage(imageToCrop: screenshot, toRect:
                CGRect(x: w * x_start, y: h * y_start, width: w * (1 - x_start), height: h * (1 - y_start)))

            // MARK: recognition

            // Get the CGImage on which to perform requests.
            guard let cgImage = croppedScreenshot.cgImage else { return }

            // Create a new image-request handler.
            let requestHandler = VNImageRequestHandler(cgImage: cgImage)

            // Create a new request to recognize text.
            let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)
            request.recognitionLanguages = ["zh-Hans"]

            do {
                XCLog(.trace, "Recognizing...")

                // Perform the text-recognition request.
                try requestHandler.perform([request])
            } catch {
                XCLog(.error, "Unable to perform the requests: \(error).")
            }
        }
    }

    private func recognizeTextHandler(request: VNRequest, error _: Error?) {
        guard let observations =
            request.results as? [VNRecognizedTextObservation]
        else {
            return
        }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            observation.topCandidates(1).first?.string
        }

        XCLog(.trace, "[RecognizeText START]")
        XCLog(.info, recognizedStrings.description)
        // Process the recognized strings.

        var i: Int = 0
        while i < recognizedStrings.count - 2 {
            let string1: String = recognizedStrings[i]
            let string2: String = recognizedStrings[i + 1]
            let string3: String = recognizedStrings[i + 2]

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M月d日 hh:mm"

            if let amount = Float(string2),
               var spentAt = dateFormatter.date(from: string3)
            {
                spentAt = spentAt.dateBySet([.year: Date().year])! // 直接取，可能会崩
                let name = string1

                let wechatBill = WeChatBillInfo(
                    name: name, amount: 0 - amount, spentAtDate: spentAt,
                    isDuplicated: false
                ) // TODO: 添加duplicated判断

                // 支出的情况
                if wechatBill.amount > 0 {
                    weChatBills.append(wechatBill)
                } else {
                    // TODO: 收入的情况 暂未考虑
                }

                i += 3
            } else {
                i += 1
            }
        }

        // TODO: add operations on WeChatBills

        XCLog(.info, "共获取到\(weChatBills.count)条WeChatBill")
        XCLog(.info, weChatBills.description)
        XCLog(.trace, "[RecognizeText END]")
    }
}
