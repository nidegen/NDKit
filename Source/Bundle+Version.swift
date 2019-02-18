//
//  Bundle+Version.swift
//  NDKit
//
//  Created by Nicolas Degen on 17.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import Foundation

extension Bundle {
  var releaseVersion: String? {
    return infoDictionary?["CFBundleShortVersionString"] as? String
  }
  
  var buildVersion: String? {
    return infoDictionary?["CFBundleVersion"] as? String
  }
  
  var name: String? {
    return infoDictionary?[kCFBundleNameKey as String] as? String
  }
}
