//
//  ViewController3.swift
//  Firebase1.self
//
//  Created by 関口大海 on 2019/06/28.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    // UI部品の宣言
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートメソッドの有効化
        textField.delegate = self
        
    }
    
    
    
    
    

    // 「投稿する」ボタン
    @IBAction func postButton(_ sender: UIButton) {
        
        
        
        
        
        
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
