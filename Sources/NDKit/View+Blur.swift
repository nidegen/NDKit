//
//  View+Blur.swift
//  NDKit
//
//  Created by Nicolas Degen on 29.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public extension View {
    
    /**
     Applies a `UIBlurEffect.Style` to the view.
     
     The blur is applied by adding a `BlurView` overlay over
     the view.
     */
    func blur(_ style: UIBlurEffect.Style) -> some View {
        overlay(BlurView(style: style))
    }
}
#endif
