//
//  DetailsProductViewController.swift
//  Superstore
//
//  Created by anas on 13/12/2021.
//

import UIKit
import JGProgressHUD
import SDWebImage

class DetailsProductViewController: UIViewController {
    
    var item: Int?
    var prod: String?
    var list: [Product] = []
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetails()
    }
    
    
    
    private func loadDetails() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        guard let item = item else {return}
        //MARK: - getDetails
        Operations.getDetailsProduct(Item: item) { responce, error in
            self.title = self.prod
            if error == nil {
                guard let responce = responce else {return}
                hud.dismiss(afterDelay: 0)
                self.nameProduct.text = responce.category
                self.details.text = responce.description
                self.imgView.sd_setImage(with: URL(string: responce.image))
                
            }else {
                hud.textLabel.text = error?.localizedDescription
                hud.dismiss(afterDelay: 3.0)
            }
        }
        
        //MARK: - getProduct
        Operations.getProduct { responce, error in
            if error == nil {
                guard let res = responce else {return}
                self.list.append(contentsOf: res)
                self.tableView.reloadData()
                print(res)
            }else {
                print("error in res")
            }
        }
        
    }
    
}

//MARK: - tabelView DataSourse & Delegate
extension DetailsProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.name.text = list[indexPath.row].title
        cell.details.text = list[indexPath.row].category
        cell.imgView.sd_setImage(with: URL(string: list[indexPath.row].image))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
