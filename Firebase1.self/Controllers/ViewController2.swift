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
    
    // UI部品
    @IBOutlet weak var tableView: UITableView!
    
    // データを受け取るための変数を宣言
    var userName = String()
    var postItem = String()
    
    // Postクラスのインスタンス（ここで初期化）
    var posty = Post()
    
    // Postクラスがのインスタンス（posty）が入る配列
    var posts = [Post]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートメソッドの有効化
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    // ☆☆☆ViewWillAppear☆☆☆ //
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // データを取得する
        fetchPost()
        
        // TableViewのセルを新しくする
        tableView.reloadData()
        
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
        let userNameLabel = cell.viewWithTag(1) as! UILabel
        let postItemLabel = cell.viewWithTag(2) as! UILabel
        
        // セル上のラベルを定義し、そこに貼り付け
        userNameLabel.text = posts[indexPath.row].userName
        postItemLabel.text = posts[indexPath.row].postItem
        
        return cell
        
    }
    
    // セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    // ☆☆☆以下でオリジナルのメソッドを宣言☆☆☆ //
    func fetchPost() {
        
        // 先ずはPostクラスが入る配列を初期化（セルが更新されるタイミングで配列の数とセルの数が合わなくなるとエラーとなるため。）
        self.posts = [Post]()
        
        // Firebaseからデータを取得
        let ref = Database.database().reference()
        ref.child("post").observeSingleEvent(of: .value) { (snap, error) in
            
            // データはすべて「snap」の中に入っている
            let postSnap = snap.value as? [String: NSDictionary]
            
            // postの中身が空だったら処理を終了
            if postSnap == nil {
                return
            }
            
            // Postクラスが入る配列をここで初期化
            self.posts = [Post]()
            
            // for文で回して中身を取ってくる
            for (_, post) in postSnap! {
                
                // Postクラスのインスタンスをここで初期化
                self.posty = Post()
                
                // Firebase内の「post」の子要素に「userName」と「comment」があったならば
                if let userName = post["userName"] as? String, let postItem = post["postItem"] as? String {
                    
                    // Firebase内の「userName」と「postItem」をインスタンスである「posty」のプロパティに入れる
                    self.posty.userName = userName
                    self.posty.postItem = postItem
                    
                }
                
                // インスタンスである「posty」を配列に追加して格納
                self.posts.append(self.posty)
                
            }
            
            self.tableView.reloadData()
            
        }
        
        
    }
    
    
    
    
    
}
