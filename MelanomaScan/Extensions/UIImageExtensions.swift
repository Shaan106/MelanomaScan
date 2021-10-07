//
//  UIImageExtensions.swift
//  MelanomaScan
//
//  Created by Yadav, Aasmaan (SPH) on 02/10/2021.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizeTo(size: CGSize) -> UIImage? { //resizes an image to the specified size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // configures the drawing environment for rendering into a bitmap
        self.draw(in: CGRect(origin: CGPoint.zero, size: size)) //redraws the image, scaling it to fit the specified size
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()! //returns the image from the bitmap context
        UIGraphicsEndImageContext() //clears the rendering work stack
        return resizedImage //returns resized image
    }
    
    func toBuffer() -> CVPixelBuffer? { //returns the CVPixelBuffer format of an image. Converting a UIImage to a CVPixelbuffer
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        //finish and also check line 24 kCVPixel format type
        
        let context = CGContext(data:pixelData, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        return pixelBuffer
    }
}
