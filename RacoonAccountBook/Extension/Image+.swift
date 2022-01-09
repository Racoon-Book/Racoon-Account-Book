// Image+.swift

import Foundation
import UIKit

func cropImage(imageToCrop: UIImage, toRect rect: CGRect) -> UIImage {
    let imageRef: CGImage = imageToCrop.cgImage!.cropping(to: rect)!
    let cropped = UIImage(cgImage: imageRef)
    return cropped
}

func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}
