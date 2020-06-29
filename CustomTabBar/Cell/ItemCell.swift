//
//  ItemCell.swift
//  CustomTabBar
//
//  Created by William on 29/06/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!

  static func reuseIdentifier() -> String {
    return String(describing: self)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
