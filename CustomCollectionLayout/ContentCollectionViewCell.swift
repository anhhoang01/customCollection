//
//  ContentCollectionViewCell.swift
//  CustomCollectionLayout
//
//  Created by JOSE MARTINEZ on 09/01/2015.
//  Copyright (c) 2015 brightec. All rights reserved.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    var time = ""
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var boderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.cornerRadius = 0
        self.layer.borderColor = UIColor.darkGray.cgColor
    }

}
