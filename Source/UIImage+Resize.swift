//
//  UIImage+Resize.swift
//  NDKit
//
//  Created by Nicolas Degen on 02.09.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

extension UIImage {
  public func resized(withPercentage percentage: CGFloat) -> UIImage? {
    let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
    return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
      _ in draw(in: CGRect(origin: .zero, size: canvas))
    }
  }
  public func resized(toWidth width: CGFloat) -> UIImage? {
    let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
    return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
      _ in draw(in: CGRect(origin: .zero, size: canvas))
    }
  }
}
