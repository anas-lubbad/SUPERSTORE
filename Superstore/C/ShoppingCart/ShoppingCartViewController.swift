//
//  ShoppingCartViewController.swift
//  Superstore
//
//  Created by anas on 14/12/2021.
//

import UIKit
import JGProgressHUD

class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItemCart()
        tableView.reloadData()
    }
    
    private func loadItemCart() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        Operations.getProduct { responce, error in
            if error == nil {
                guard let res = responce else {return}
                self.list.append(contentsOf: res)
                self.tableView.reloadData()
                hud.dismiss(afterDelay: 0)
            }else {
                hud.textLabel.text = error?.localizedDescription
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }
    
}

extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomShoppingTableViewCell
        cell.title.text = list[indexPath.row].title
        cell.Category.text = list[indexPath.row].category
        cell.imgView.sd_setImage(with: URL(string: list[indexPath.row].image))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            Operations.deleteMethod(item: indexPath.row)
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
}
