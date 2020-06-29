//
//  BlurView.swift
//  NDKit
//
//  Created by Nicolas Degen on 29.06.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public struct BlurView: UIViewRepresentable {
  
  public init(style: UIBlurEffect.Style) {
    self.style = style
  }
  
  private let style: UIBlurEffect.Style
  
  public typealias Context = UIViewRepresentableContext<BlurView>
  
  public func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: .zero)
    let blurView = createBlurView()
    add(blurView, to: view)
    return view
  }
  
  public func updateUIView(_ uiView: UIView, context: Context) {}
}

private extension BlurView {
  func add(_ blurView: UIVisualEffectView, to view: UIView) {
    view.backgroundColor = .clear
    view.insertSubview(blurView, at: 0)
    NSLayoutConstraint.activate([
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }
  
  func createBlurView() -> UIVisualEffectView {
    let effect = UIBlurEffect(style: style)
    let view = UIVisualEffectView(effect: effect)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
}
#endif
