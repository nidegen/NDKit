//
//  UIImage+NDKitIcons.swift
//  NDKit
//
//  Created by Nicolas Degen on 15.03.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation

extension UIImage {
  
  public static var switchCameraIcon: UIImage {
    let bundle = Bundle(for: NDWelcomeViewController.self)
    let imagePath = bundle.path(forResource: "SwitchCameraIcon", ofType: "")
    return UIImage(contentsOfFile: imagePath!)!
  }
}
