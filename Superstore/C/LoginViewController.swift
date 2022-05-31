//
//  LoginViewController.swift
//  Superstore
//
//  Created by anas on 13/12/2021.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Operations.getPostUser()
    }
    
    @IBAction func submit(_ sender: Any) {
        loadUser()
    }
    
    var list: [User] = []
    private func loadUser() {
        //if userName.text != nil || password.text != nil{
        //guard let username = userName.text else {return}
        //guard let password = password.text else {return}
        
       // let user = User(username: username, password: password)
        
//        Operations.getAllUser { responce, error in
//                if error == nil {
//                    guard let res = responce else {return}
//                   // self.list.append(contentsOf: res)
//                    print(res)
//                }else {
//                    print("EX")
//                }
//            }
    //    }
        
        
    }

}
