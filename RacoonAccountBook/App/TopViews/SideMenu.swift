import SwiftUI

struct SideMenu: View {
    let onSideMenuClose: () -> Void
    let sideMenuOffsetX: Float
    let menuWidth: Float = 270

    var body: some View {
        HStack {
            MenuContent(onSideMenuClosd: onSideMenuClose)
                .background(Color.white)
                .frame(width: CGFloat(menuWidth))
                .offset(x: -CGFloat(menuWidth * sideMenuOffsetX))
                .animation(.default)

            if sideMenuOffsetX == 0 {
                // 菜单完全打开时，使用右侧Spacer接收Tap，以关闭菜单
                ZStack {
                    // 使Spacer()可以接受TapGesture
                    Color.black.opacity(0.001)
                    Spacer()
                }
                .onTapGesture {
                    withAnimation { onSideMenuClose() }
                    print(Log().debug + "点击")
                }
            } else {
                // 菜单未完全打开时，不使用右侧Spacer接收Tap
                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    let onSideMenuClosd: () -> Void

    var body: some View {
        List {
            NavigationLink(destination: Settings()) { Text("设置") }
        }
    }
}
