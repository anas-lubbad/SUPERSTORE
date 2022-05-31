//
//  CustomShoppingTableViewCell.swift
//  Superstore
//
//  Created by anas on 14/12/2021.
//

import UIKit

class CustomShoppingTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var Quantity: UILabel!
    var viewController: ShoppingCartViewController!
    
    
    @IBAction func submitDelete(_ sender: UIButton) {
        
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//            self.viewController.list.remove(at: sender.tag)
//            self.viewController.tableView.deleteRows(at: [IndexPath(row: sender.tag, section: 0)], with: UITableView.RowAnimation.automatic)
//            self.viewController.tableView.reloadData()
//        }
        
    }
    
}
