// ScreenshotImportSheet.swift

import SwiftUI
import UIKit
import Vision

struct ScreenshotImportSheet: View {
    @Environment(\.managedObjectContext) private var context

    @EnvironmentObject var RacoonSheetConfig: SheetConfigModel

    /// 在导入界面上显示的图片
    @State private var displayImage: Image?

    /// 是否正在显示系统的照片选择器
    @State private var showingImagePicker = false

    /// original system screenshot from Photos
    @State private var systemScreenshot: UIImage?

    /// 从截图中读取出来的条目
    @State var weChatBills: [WeChatBillInfo] = []

    var body: some View {
        VStack {
            if displayImage != nil {
                HStack {
                    displayImage!
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    // TODO: 添加微信图标

                    Button(action: {
                        print("clicked 添加新账单")
                    }) {
                        Label("添加新账单", systemImage: "photo")
                    }
                }
            }

            if weChatBills.count != 0 {
                Text("识别出\(weChatBills.count)条账目")

                // TODO: 添加识别出的账单显示

                VStack(alignment: .leading) {
                    Text("总支出\(weChatBills.sum())")

                    ForEach(Array(weChatBills.enumerated()), id: \.element) { i, weChatBill in
                        HStack {
                            // weChatBillView
                            Image(systemName:
                                weChatBill.isSelected ? "checkmark.circle" : "circle")
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(weChatBill.name)
                                    Spacer()
                                    Text("\(0 - weChatBill.amount)") // TODO: 两位小数
                                }
                                Text(DisplayDate(weChatBill.spentAt))
                            }
                        }
                        .onTapGesture {
                            weChatBills[i].isSelected.toggle()
                            print(Log().string + "tapped")
                        }
                    }
                }

                LargeButton(title: "导入所选账目",
                            backgroundColor: Color.blue,
                            foregroundColor: Color.white) {
                    print(Log().string + "按钮点击")
                    // TODO: 将选中的条目添加到数据库并清除现场
                }
            } else {
                // WeChatBills.count == 0
                Text("还没有选择截图哦")
                LargeButton(title: "选择微信账单截图",
                            backgroundColor: Color.blue,
                            foregroundColor: Color.white) {
                    showingImagePicker = true
                }
            }
        }
        .sheet(isPresented: $showingImagePicker,
               onDismiss: textExtractFromScreenshot) {
            ImagePicker(image: self.$systemScreenshot)
        }
    }

    func textExtractFromScreenshot() {
        // 清空WeChatBills
        weChatBills = []

        print("loadImage()")
        if let screenshot = systemScreenshot {
            print("inputImage not nil")
            displayImage = Image(uiImage: screenshot) // 显示的还是原始截图

            // MARK: Crop Image

            let w = screenshot.size.width
            let h = screenshot.size.height
            let x_start = CGFloat(51.0 / 325.0)
            let y_start = CGFloat(125.0 / 708.0)
            let croppedScreenshot: UIImage = cropImage(imageToCrop: screenshot, toRect: CGRectMake(
                w * x_start, h * y_start,
                w * (1 - x_start), h * (1 - y_start)))

            // MARK: recognition

            // Get the CGImage on which to perform requests.
            guard let cgImage = croppedScreenshot.cgImage else { return }

            // Create a new image-request handler.
            let requestHandler = VNImageRequestHandler(cgImage: cgImage)

            // Create a new request to recognize text.
            let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)
            request.recognitionLanguages = ["zh-Hans"]

            do {
                print("Recognizing...")
                // Perform the text-recognition request.
                try requestHandler.perform([request])
            } catch {
                print("Unable to perform the requests: \(error).")
            }
        }
    }

    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations =
            request.results as? [VNRecognizedTextObservation]
        else {
            return
        }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            observation.topCandidates(1).first?.string
        }

        print("[RecognizeText START]")
        print(recognizedStrings)
        // Process the recognized strings.

        var i: Int = 0
        while i < recognizedStrings.count - 2 {
            let string1: String = recognizedStrings[i]
            let string2: String = recognizedStrings[i + 1]
            let string3: String = recognizedStrings[i + 2]

            if let amount = Float(string2),
               let spentAt = string3.toDate("M月d日 hh:mm", region: regionChina) {
                let name = string1

                let wechatBill = WeChatBillInfo(
                    name: name, amount: amount, spentAt: spentAt,
                    isDuplicated: false) // TODO: 添加duplicated判断
                print(wechatBill)
                weChatBills.append(wechatBill)

                i += 3
            } else {
                i += 1
            }
        }

        // TODO: add operations on WeChatBills
        print("共获取到\(weChatBills.count)条WeChatBill")
        print("[RecognizeText END]")
    }
}
