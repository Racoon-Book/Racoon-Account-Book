// Acknowledgement.swift

import SwiftUI

let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String

struct SideMenu_About: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: 用户协议、更新日志、问题反馈

                    VStack {
                        Image("浣熊财记 艺术字")

                        Text("v\(appVersionString) (\(buildNumber))")
                            .font(.system(.headline, design: .rounded))

                        Divider()
                    }

                    VStack {
                        HStack {
                            Link("用户协议", destination: URL(string: "https://racoon-book.github.io/About/Agreements.html")!).font(.title)
                                .padding([.trailing])
                            Link("更新日志", destination: URL(string: "https://racoon-book.github.io/About/UpdateHistory.html")!).font(.title)
                        }
                        .padding([.vertical])

                        HStack {
                            Link("问题反馈", destination: URL(string: "https://github.com/Racoon-Book/About/issues")!).font(.title).padding([.trailing])
                            Link("功能讨论", destination: URL(string: "https://github.com/Racoon-Book/About/discussions")!).font(.title)
                        }
                        .padding([.vertical])

                        Divider()
                    }

                    // MARK: 团队

                    VStack(alignment: .leading) {
                        Text("团队").font(.title)
                            .padding([.vertical])
                        VStack(alignment: .leading) {
                            HStack {
                                Link("杨希杰", destination: URL(string: "https://github.com/Yang-Xijie")!).font(.title3)
                                Text("队长 功能开发 清华大学 电子工程系").font(.caption)
                            }
                            HStack {
                                Link("林李挚", destination: URL(string: "https://github.com/Shomvel")!).font(.title3)
                                Text("UI/UX设计 清华大学 软件学院").font(.caption)
                            }
                            HStack {
                                Link("陈嘉钰", destination: URL(string: "https://github.com/c0per")!).font(.title3)
                                Text("功能开发 清华大学 电气工程及其自动化").font(.caption)
                            }
                            HStack {
                                Link("王继良老师", destination: URL(string: "http://tns.thss.tsinghua.edu.cn/~jiliang/")!).font(.title3)
                                Text("指导教师 清华大学 软件学院 副教授").font(.caption)
                            }
                        }
                    }

                    Divider()

                    // MARK: 协助

                    VStack(alignment: .leading) {
                        Text("协助").font(.title)
                            .padding([.vertical])
                        VStack(alignment: .leading) {
                            Link("THU iOS Club", destination: URL(string: "https://github.com/THU-iOS")!).font(.title3)
                            HStack {
                                Link("李林达", destination: URL(string: "https://www.zcool.com.cn/u/22338505")!).font(.title3)
                                Text("中国传媒大学 数媒网络").font(.caption)
                            }
                        }
                    }

                    Divider()

                    // MARK: 开源项目使用

                    VStack(alignment: .leading) {
                        Text("开源项目使用").font(.title)
                            .padding([.vertical])
                        VStack(alignment: .leading) {
                            OpenSourceProjectView(
                                projectName: "SwiftDate",
                                repositoryURL: "https://github.com/malcommac/SwiftDate",
                                licenseURL: "https://github.com/malcommac/SwiftDate/blob/master/LICENSE")
                            OpenSourceProjectView(
                                projectName: "SwiftSpeech",
                                repositoryURL: "https://github.com/Cay-Zhang/SwiftSpeech",
                                licenseURL: "https://github.com/Cay-Zhang/SwiftSpeech/blob/master/LICENSE")
                            OpenSourceProjectView(
                                projectName: "SwiftPieChart",
                                repositoryURL: "https://github.com/ilamanov/SwiftPieChart",
                                licenseURL: "https://github.com/ilamanov/SwiftPieChart/blob/main/LICENSE")
                        }
                    }

                    Image("浣熊 开屏")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 100)
                }
                .padding()
            }
        }
        .navigationTitle("关于")
        .navigationBarTitleDisplayMode(.inline)
    }

    struct OpenSourceProjectView: View {
        var projectName: String = ""
        var repositoryURL: String = ""
        var licenseURL: String = ""

        var body: some View {
            HStack {
                Link(projectName,
                     destination: URL(string: repositoryURL)!)
                Link("LICENSE",
                     destination: URL(string: licenseURL)!)
                    .font(.caption)
            }
        }
    }
}
