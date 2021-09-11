import SwiftUI

struct SideMenu: View {
    let onSideMenuClose: () -> Void
    let sideMenuOffsetX: Float
    let menuWidth: Float = 270

    var body: some View {
        HStack {
            MenuContent()
                .background(Color.white)
                .frame(width: CGFloat(menuWidth))
                .offset(x: -CGFloat(menuWidth * sideMenuOffsetX))
                .animation(.default)

            // 使Spacer()可以接受TapGesture
            ZStack {
                Color.black.opacity(0.001)
                Spacer()
            }
            .onTapGesture {
                withAnimation { onSideMenuClose() }
                print(Log().debug + "点击")
            }
        }
    }
}

struct MenuContent: View {
    var body: some View {
        List {
            Text("My Profile").onTapGesture {
                print("My Profile")
            }
            Text("Posts").onTapGesture {
                print("Posts")
            }
            Text("Logout").onTapGesture {
                print("Logout")
            }
        }
    }
}
