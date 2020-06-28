//
//  NavigationLink+SystemItem.swift
//  NDKit
//
//  Created by Nicolas Degen on 23.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

extension NavigationLink where Label == Image {
  public init(systemName: String, destination: Destination) {
    self.init(destination: destination) {
      Image(systemName: systemName)
    }
  }
}
