// Acknowledgement.swift

import SwiftUI

struct SideMenu_About: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // MARK: 团队

                    VStack {
                        Text("浣熊财记团队").font(.title)
                            .padding()
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

                    VStack {
                        Text("协助").font(.title)
                            .padding()
                        VStack(alignment: .leading) {
                            HStack {
                                Link("李连达", destination: URL(string: "https://www.zcool.com.cn/u/22338505")!).font(.title3)
                                Text("中国传媒大学 数媒网络").font(.caption)
                            }
                            Link("THU iOS Club", destination: URL(string: "https://github.com/THU-iOS")!).font(.title3)
                        }
                    }

                    Divider()

                    // MARK: 开源项目使用

                    VStack {
                        Text("开源项目使用").font(.title)
                            .padding()
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
                                projectName: "SwiftUICharts",
                                repositoryURL: "https://github.com/mecid/SwiftUICharts",
                                licenseURL: "https://github.com/mecid/SwiftUICharts/blob/main/LICENSE")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("关于")
            .navigationBarTitleDisplayMode(.inline)
        }
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
