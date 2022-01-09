import Foundation
import UIKit

func cropImage(imageToCrop: UIImage, toRect rect: CGRect) -> UIImage {
    let imageRef: CGImage = imageToCrop.cgImage!.cropping(to: rect)!
    let cropped = UIImage(cgImage: imageRef)
    return cropped
}
