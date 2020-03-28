//
//  UIImage+CVPixelBuffer.swift
//  NDKit
//
//  Created by Nicolas Degen on 01.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit.UIImage
import VideoToolbox

extension UIImage {
  public convenience init?(pixelBuffer: CVPixelBuffer) {
    var cgImage: CGImage?
    VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)
    
    if let cgImage = cgImage {
      self.init(cgImage: cgImage)
    } else {
      return nil
    }
  }
}
