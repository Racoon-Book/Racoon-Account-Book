import Foundation
import UIKit

func PutKeyboardBack() {
    UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
}
