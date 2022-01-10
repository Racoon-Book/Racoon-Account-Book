import Foundation

extension String {
    // 按照下标方式读取String中的字符
    subscript(_ i: Int) -> Character { self[index(startIndex, offsetBy: i)] }
}
