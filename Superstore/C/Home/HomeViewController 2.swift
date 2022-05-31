//
//  HomeViewController.swift
//  Superstore
//
//  Created by anas on 11/12/2021.
//

import UIKit
import JGProgressHUD

class HomeViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }

    private var items: [Product] = []
    private func loadRequest() {
        
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        Operations.getProduct { response, error in
            if error == nil {
                guard let data = response else {return}
                self.items.append(contentsOf: data)
                self.collectionView.reloadData()
                hud.dismiss(afterDelay: 0)
            }else {
                hud.textLabel.text = error?.localizedDescription
                hud.dismiss(afterDelay: 3.0)
            }
        }
    }
}


//MARK: - DataSource & DelegateFlowLayout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ProductCollectionViewCell
        cell?.nameCategory.text = items[indexPath.row].category
        //cell?.nameProduct.text = items[indexPath.row].title
        // cell?.price = items[indexPath.row].price
        cell?.imgView.sd_setImage(with: URL(string: items[indexPath.row].image))

        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2)-37, height: 281)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsProductViewController") as! DetailsProductViewController
        controller.item = items[indexPath.row].id
        controller.prod = items[indexPath.row].category
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

//UICollectionViewDelegate
//UICollectionViewDelegateFlowLayout
// الفرق بينهم في flowLayout يوجد ميثود زياده خاصه بالتحكم في layout تاع السيل
