//
//  SecondViewController.swift
//  AutoLayout
//
//  Created by ek1008 on 2019/4/2.
//  Copyright © 2019 ek1008. All rights reserved.
//

import UIKit


protocol GetData {
    func receiveData(data:String)
}

class SecondViewController: UIViewController {
    
    
    /// 傳遞資料回第一頁
    var delegate:GetData?
    
    
    @IBOutlet weak var inputTextField: UITextField!
    /// 前往第一頁
    ///
    /// - Parameter sender: Go To FirstView按鈕
    @IBAction func GoToFirstView(_ sender: UIButton) {
        if let dataText = inputTextField.text {
            delegate?.receiveData(data: dataText)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
