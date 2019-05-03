//
//  AppStoreReviewManager.swift
//  NDKit
//
//  Created by Nicolas Degen on 03.05.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import StoreKit

// This file follow the tutorial from raywenderlich.com
public enum AppStoreReviewManager {
  public static var minimumReviewWorthyActionCount = 3
  
  public static func requestReviewIfAppropriate() {
    let defaults = UserDefaults.standard
    
    var actionCount = defaults.integer(forKey: .reviewWorthyActionCount)
    
    actionCount += 1
    
    defaults.set(actionCount, forKey: .reviewWorthyActionCount)
    
    guard actionCount >= minimumReviewWorthyActionCount else {
      return
    }
    
    let currentVersion = Bundle.main.releaseVersion
    let lastVersion = defaults.string(forKey: .lastReviewRequestAppVersion)
    
    guard lastVersion == nil || lastVersion != currentVersion else {
      return
    }
    
    SKStoreReviewController.requestReview()
    
    defaults.set(0, forKey: .reviewWorthyActionCount)
    defaults.set(currentVersion, forKey: .lastReviewRequestAppVersion)
  }
  
  public static func requstReviewIfLiked() {
    
  }
  
  public static func askToWriteReview(forAppId appId: String) {
    var components = URLComponents(url: URL(string : "https://itunes.apple.com/app/\(appId)")!, resolvingAgainstBaseURL: false)

    components?.queryItems = [
      URLQueryItem(name: "action", value: "write-review")
    ]
    
    guard let writeReviewURL = components?.url else {
      return
    }
    
    UIApplication.shared.open(writeReviewURL)
  }
}
