//
//  UIImageExtensions.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 02/10/2021.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizeTo(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // configures the drawing environment for rendering into a bitmap
        self.draw(in: CGRect(origin: CGPoint.zero, size: size)) //redraws the image, scaling it to fit the specified size
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()! //returns the image from the bitmap context
        UIGraphicsEndImageContext() //clears the rendering work stack
        return resizedImage //returns resized image
    }
    
    func toBuffer() -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_128RGBAFloat, attrs, &pixelBuffer)
        
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        //finish and also check line 26 kCVPixel format type
    }
}
