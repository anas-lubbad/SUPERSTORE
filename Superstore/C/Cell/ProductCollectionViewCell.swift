//
//  ProductCollectionViewCell.swift
//  Superstore
//
//  Created by anas on 12/12/2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var nameCategory: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var VIE: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
    
}
