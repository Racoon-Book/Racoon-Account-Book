//
//  PutKeyBoardBack.swift
//  RacoonAccountBook
//
//  Created by 杨希杰 on 2021/7/15.
//

import Foundation
import UIKit

func PutKeyboardBack() {
    UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
}
