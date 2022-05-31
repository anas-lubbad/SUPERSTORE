//
//  Operations.swift
//  Superstore
//
//  Created by anas on 12/12/2021.
//

import Foundation
import Alamofire

class Operations {
    
    static func getProduct(handler: @escaping ([Product]? , Error?) -> Void) {
        AF.request(Constanc.API.baseURL + "/products").responseJSON { responce in
            if let data = responce.data {
                do {
                    let res = try JSONDecoder().decode([Product].self, from: data)
                    handler(res,nil)
                }catch{
                    handler(nil,error)
                    print(error)
                }
            }
        }
    }
    
    
    static func getDetailsProduct(Item: Int,  handler: @escaping (Product? , Error?) -> Void) {
        AF.request(Constanc.API.baseURL + "/products/\(Item)").responseJSON { responce in
            if let data = responce.data {
                do {
                    let res = try JSONDecoder().decode(Product.self, from: data)
                    handler(res,nil)
                }catch{
                    handler(nil,error)
                    print("Error + \(error)")
                }
            }
        }
    }
    
    
    static func getAllUser(handler: @escaping ([User]? , Error?) -> Void) {
        let parameters: Parameters = [
            "id": 1,
            "username": "johnd",
            "password": "m38rmF$"
        ]
        AF.request(Constanc.API.baseURL + "/users", method: .post, parameters: parameters).responseJSON { responce in
            if let data = responce.data {
                do {
                    let res = try JSONDecoder().decode([User].self, from: data)
                    handler(res,nil)
                }catch{
                    handler(nil,error)
                    print("Error + \(error)")
                }
            }
        }
    }
    
    
    static func getAllCart(handler: @escaping ([Cart]? , Error?) -> Void) {
        AF.request(Constanc.API.baseURL + "/carts").responseJSON { responce in
            if let data = responce.data {
                do {
                    let res = try JSONDecoder().decode([Cart].self, from: data)
                    handler(res,nil)
                }catch{
                    handler(nil,error)
                    print("Error + \(error)")
                }
            }
        }
    }
    
    
    
    static func deleteItemCart(item: Int, handler: @escaping ([Cart]? , Error?) -> Void) {
        AF.request(Constanc.API.baseURL + "/carts/\(item)", method: .delete).responseJSON { responce in
            if let data = responce.data {
                do {
                    let res = try JSONDecoder().decode([Cart].self, from: data)
                    handler(res,nil)
                }catch{
                    handler(nil,error)
                    print("Error + \(error)")
                }
            }
        }
    }
    
    
    //POST
    static func getPostUser(){
        if let url = URL(string: "https://fakestoreapi.com/users"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, responce, error in
                if let error = error{
                    print(error)
                }else{
                    if let data = data{
                        let get = try? JSONDecoder().decode([User].self, from: data)
                        print(get ?? "000000")
                    }else{
                        print("not found responce...")
                    }
                }
            }
            task.resume()
        }else{
            print("Invalid APi")
        }
    }
    
    
    
    //DELETE
    static func deleteMethod(item: Int) {
            guard let url = URL(string: "https://fakestoreapi.com/products/\(item)") else {
                print("Error: cannot create URL")
                return
            }
            // Create the request
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error: error calling DELETE")
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                    print("Error: HTTP request failed")
                    return
                }
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }
                    
                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
                
                //print("DELETE: -->: \(response)")
            }.resume()
        }
    
}

