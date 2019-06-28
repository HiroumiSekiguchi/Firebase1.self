//
//  ViewController2.swift
//  Firebase1.self
//
//  Created by 関口大海 on 2019/06/28.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit
import Firebase

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 投稿の配列を格納
    var posts = [Post]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートメソッドの有効化
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    // ☆☆☆以下、TableViewの設定☆☆☆ //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // ここにセルの内容を構築
        
        return cell
        
    }
    
    
}
