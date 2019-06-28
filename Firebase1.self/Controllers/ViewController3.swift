//
//  ViewController3.swift
//  Firebase1.self
//
//  Created by 関口大海 on 2019/06/28.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class ViewController3: UIViewController, UITextFieldDelegate {
    
    // UI部品の宣言
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // UserDefaults内のデータを受け取るための変数
    var displayName = String()
    var pictureURLString = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートメソッドの有効化
        textField.delegate = self
        
        // UserDefaultsから値を取り出す
        let defaults = UserDefaults.standard
        displayName = defaults.object(forKey: "displayName") as! String
        pictureURLString = defaults.object(forKey: "pictureURLString") as! String
        
        // UDから取り出した情報をUI部品に反映
        label.text = displayName
        userImage.sd_setImage(with: URL(string: pictureURLString), completed: nil)
        
        // プロフ画像を丸くする
        userImage.layer.cornerRadius = 8.0
        userImage.clipsToBounds = true
        
    }
    
    // 「投稿する」ボタン（Firebaseへ情報を送信）
    @IBAction func postButton(_ sender: UIButton) {
        
        // ☆☆☆Firebaseにデータの諸々を保存する☆☆☆ //
        let ref = Database.database().reference(fromURL: "https://fir-1-self.firebaseio.com/").child("post").childByAutoId()
        
        let feed = [
            "userName": label.text!,
            "postItem": textField.text!
        ] as! [String: Any]
        
        
        ref.setValue(feed)
        
        // モーダルを閉じる
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    // リターンキーでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    // 「戻る」ボタン
    @IBAction func returnButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}
