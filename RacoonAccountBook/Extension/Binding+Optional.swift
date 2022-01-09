import SwiftUI

// https://stackoverflow.com/a/61002589/14298786
// 解决了TextField不能传Binding的问题

func ?? <T>(lhs: Binding<T?>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
