//
//  ViewController.swift
//  FullStackSocial_ios_lbta
//
//  Created by MCT on 11.04.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var posts = [Post]()
    
    private var  postListViewModel : PostListModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.dataSource=self
        tableView.delegate=self
        
        fethcPost()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Posts"
        navigationItem.rightBarButtonItem = .init(title: "Create Post", style: .done, target: self, action: #selector(handleCreatePost))
    }
    
    func fethcPost(){
        Service.shared.fetchPosts { (listOfPost) in
            if let listOfPost = listOfPost{
                self.postListViewModel = PostListModel(postList: listOfPost)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @objc fileprivate func handleCreatePost(){
        Service.shared.createPost(title: "sa", body: "as") { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            print("ok!")
            DispatchQueue.main.async {
                self.fethcPost()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let post = self.postListViewModel.postAtIndex(indexPath.row)
            Service.shared.deletePost(postId: post.id) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.postListViewModel.remove(indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .top)
                print("succes")
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let postViewModel = self.postListViewModel.postAtIndex(indexPath.row)
        cell.textLabel?.text = postViewModel.title
        cell.detailTextLabel?.text = postViewModel.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel == nil ? 0 :
            self.postListViewModel.numberOfRowsInSection()
    }
    
    
}

