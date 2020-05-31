//
//  DistributionConfiguration.swift
//  NDKit
//
//  Created by Nicolas Degen on 17.05.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import Foundation

public enum AppConfiguration {
  case Debug
  case TestFlight
  case AppStore
}

public struct Config {
  // This is private because the use of 'appConfiguration' is preferred.
  private static let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
  
  // This can be used to add debug statements.
  public static var isDebug: Bool {
    #if DEBUG
    return true
    #else
    return false
    #endif
  }
  
  public static var appConfiguration: AppConfiguration {
    if isDebug {
      return .Debug
    } else if isTestFlight {
      return .TestFlight
    } else {
      return .AppStore
    }
  }
}
