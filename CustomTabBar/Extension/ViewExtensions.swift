//
//  ViewExtensions.swift
//  CustomTabBar
//
//  Created by William on 29/06/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

extension UIViewController {
  func add(_ child: UIViewController, frame: CGRect? = nil) {
    addChild(child)

    if let frame = frame {
      child.view.frame = frame
    }

    view.addSubview(child.view)
    child.didMove(toParent: self)
  }

  func remove() {
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
}
