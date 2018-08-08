//
//  CellView.swift
//  DBO WIKI
//
//  Created by Kacper Kuźniak on 28/07/2017.
//  Copyright © 2017 Kacper Kuźniak. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {
    
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(cellModel: CellModel) {
        cellImg.image = UIImage(named: cellModel.img)
        cellTitle.text = cellModel.title
        cellTitle.textColor = UIColor.white
    }
    
}
