//
//  WebService.swift
//  FullStackSocial_ios_lbta
//
//  Created by MCT on 12.04.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

class Service{
    
    static let shared = Service()
    
    func fetchPosts(comletion: @escaping ([Post]?) -> ()){
        guard let url = URL(string: "http://localhost:1337/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                comletion(nil)
            }else if let data = data {
                
                let postList = try? JSONDecoder().decode([Post].self, from: data)
                
                if let postList = postList{
                    comletion(postList)
                }
            }
        }.resume()
    }
    
    
    func createPost(title:String , body:String, completion: @escaping (Error?) -> ()){
        
        guard let url = URL(string: "http://localhost:1337/post") else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let param = ["title" : title, "postBody": body]
        
        do{
            let data = try JSONSerialization.data(withJSONObject: param, options: .init())
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    completion(nil)
                }
                guard let data = data else {return}
                print(String(data: data, encoding: .utf8))
                completion(nil)
            }.resume()
            
        }catch{
            completion(nil)
        }
    }
    
    func deletePost(postId: Int , completion: @escaping (Error?) -> ()){
        guard let url = URL(string: "http://localhost:1337/post/\(postId)") else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(error)
                    return
                }
                completion(nil)
            }
        }.resume()
    }
    
    
    
}

