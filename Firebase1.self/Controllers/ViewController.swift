//
//  ViewController.swift
//  Firebase1.self
//
//  Created by 関口大海 on 2019/06/28.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit
import LineSDK

class ViewController: UIViewController, LineSDKLoginDelegate {
    
    // Loginで取得してくる関連の変数の宣言
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LineSDKの有効化
        LineSDKLogin.sharedInstance().delegate = self
        
    }
    
    
    // ログインボタンがタップされた時の処理
    @IBAction func loginButton(_ sender: UIButton) {
        
        LineSDKLogin.sharedInstance().start()
        
    }
    
    
    // LineSDKによるログイン処理
    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        
        // LINESDKの「displayName」と「pictureURL」の情報をそれぞれ「self.displayName」と「self.pictureURLString」に格納
        if let displayName = profile?.displayName {
            self.displayName = displayName
        }
        if let pictureURL = profile?.pictureURL {
            self.pictureURLString = pictureURL.absoluteString
        }
        
        // UserDefaultsで保存
        UserDefaults.standard.set(self.displayName, forKey: "displayName")
        UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")
        
        performSegue(withIdentifier: "start", sender: nil)
        
    }

}

