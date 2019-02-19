//
//  NDWelcomeViewController.swift
//  NDKit
//
//  Created by Nicolas Degen on 15.02.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import UIKit

public class NDWelcomeViewController: UIViewController {
  var mainColor = UIColor.blue
  var backgroundColor: UIColor {
    set {
      view.backgroundColor = newValue
    }
    get {
      return view.backgroundColor ?? .white
    }
  }
  
  var textColor = UIColor.black
  
  public var details = [UIImage: (String, String)]()
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override public func loadView() {
    super.loadView()
    view.backgroundColor = backgroundColor
    
    let safeArea = view.safeAreaLayoutGuide
    
    let mainLayoutGuide = UILayoutGuide()
    view.addLayoutGuide(mainLayoutGuide)
    mainLayoutGuide.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8).isActive = true
    mainLayoutGuide.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.9).isActive = true
    mainLayoutGuide.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
    mainLayoutGuide.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    
    let titleLayoutGuide = UILayoutGuide()
    view.addLayoutGuide(titleLayoutGuide)
    titleLayoutGuide.heightAnchor.constraint(equalToConstant: 100).isActive = true
    titleLayoutGuide.widthAnchor.constraint(equalTo: mainLayoutGuide.widthAnchor).isActive = true
    titleLayoutGuide.topAnchor.constraint(equalTo: mainLayoutGuide.topAnchor).isActive = true
    titleLayoutGuide.centerXAnchor.constraint(equalTo: mainLayoutGuide.centerXAnchor).isActive = true
    
    let welcomeLabel = UILabel(frame: .zero)
    welcomeLabel.text = "Welcome to"
    welcomeLabel.font = UIFont.systemFont(ofSize: 44, weight: .black)
    welcomeLabel.textColor = textColor
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(welcomeLabel)
    welcomeLabel.leftAnchor.constraint(equalTo: titleLayoutGuide.leftAnchor).isActive = true
    welcomeLabel.topAnchor.constraint(equalTo: titleLayoutGuide.topAnchor).isActive = true
    
    let nameLabel = UILabel(frame: .zero)
    nameLabel.text = Bundle.main.name!
    nameLabel.font = UIFont.systemFont(ofSize: 44, weight: .black)
    nameLabel.textColor = mainColor
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameLabel)
    nameLabel.leftAnchor.constraint(equalTo: titleLayoutGuide.leftAnchor).isActive = true
    nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: titleLayoutGuide.bottomAnchor).isActive = true
    
    let continueButton = UIButton(frame: .zero)
    
    continueButton.setTitle("Continue", for: .normal)
    continueButton.backgroundColor = mainColor
    continueButton.layer.cornerRadius = 10

    view.addSubview(continueButton)
    
    continueButton.translatesAutoresizingMaskIntoConstraints = false
    continueButton.centerXAnchor.constraint(equalTo: mainLayoutGuide.centerXAnchor).isActive = true
    continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    continueButton.widthAnchor.constraint(equalTo: mainLayoutGuide.widthAnchor).isActive = true
    continueButton.bottomAnchor.constraint(equalTo: mainLayoutGuide.bottomAnchor).isActive = true
    continueButton.addTarget(self, action: #selector(dismissAnimated), for: .touchDown)
    
    var topAnchor = titleLayoutGuide.bottomAnchor
    var generalHeightAnchor: NSLayoutDimension?
    
    for (image, (title, text)) in details {
      let detailView = UIView()
      detailView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(detailView)
      detailView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
      if let heightAnchor = generalHeightAnchor {
        detailView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
      } else {
        generalHeightAnchor = detailView.heightAnchor
      }
      detailView.widthAnchor.constraint(equalTo: mainLayoutGuide.widthAnchor).isActive = true
      detailView.centerXAnchor.constraint(equalTo: mainLayoutGuide.centerXAnchor).isActive = true
      topAnchor = detailView.bottomAnchor
      
      let imageView = UIImageView(image: image)
      detailView.addSubview(imageView)
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 10).isActive = true
      imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
      imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
      imageView.topAnchor.constraint(equalTo: detailView.topAnchor).isActive = true
      imageView.contentMode = .scaleAspectFit
      
      let titleLabel = UILabel(frame: .zero)
      detailView.addSubview(titleLabel)
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      titleLabel.topAnchor.constraint(equalTo: detailView.topAnchor).isActive = true
      titleLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor).isActive = true
      titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
      titleLabel.text = title
      titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      titleLabel.textColor = textColor
      
      let detailsLabel = UILabel(frame: .zero)
      detailView.addSubview(detailsLabel)
      detailsLabel.translatesAutoresizingMaskIntoConstraints = false
      detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
      detailsLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor).isActive = true
      detailsLabel.rightAnchor.constraint(equalTo: detailView.rightAnchor).isActive = true
      detailsLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
      detailsLabel.text = text
      detailsLabel.font = UIFont.systemFont(ofSize: 14)
      detailsLabel.textColor = textColor
      detailsLabel.lineBreakMode = .byWordWrapping
      detailsLabel.numberOfLines = 6
    }
  }
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UserDefaults.standard.set(true, forKey: "WelomeScreenShown")
  }
  
  public func presentIfNotSeen() {
    if !UserDefaults.standard.bool(forKey: "WelomeScreenShown") {
      let topWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
      topWindow.rootViewController = UIViewController()
      topWindow.windowLevel = UIWindow.Level.alert + 1
      topWindow.makeKeyAndVisible()
      topWindow.rootViewController?.present(self, animated: true, completion: nil)
    }
  }
}
