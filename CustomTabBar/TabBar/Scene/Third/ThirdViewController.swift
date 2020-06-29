//
//  ThirdViewController.swift
//  CustomTabBar
//
//  Created by William on 29/06/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
    self.view.backgroundColor = .green
  }
}
