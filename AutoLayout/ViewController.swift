//
//  ViewController.swift
//  AutoLayout
//
//  Created by ek1008 on 2019/2/26.
//  Copyright © 2019 ek1008. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class ViewController: UIViewController, GetData {
    func receiveData(data: String) {
        textLabel.text = data
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    /// 前往第二頁
    ///
    /// - Parameter sender: Go To SecondVIew 按鈕
    @IBAction func GoToSecondView(_ sender: UIButton) {
        performSegue(withIdentifier: "SecondViewSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters: Parameters = [
            "Amount": "6666",
            "Year": "6"
        ]
        
        Alamofire.request("https://online.skl.com.tw/Insure/Variable/getEZCashAmount",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default)
            .response{ response in
                let str = String(data: response.data!, encoding: .utf8)
                let ezcash:EZCashSimpleEstimate = EZCashSimpleEstimate
                    .deserialize(from: str)!
                if let invamt = ezcash.InvAmt {
                    print(invamt)
                    print(ezcash.InvYear)
                }
        }
        
        
        self.view.backgroundColor = .red
        
        textLabel.text = "\(123)"
        
        let url = URL(string: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1007426677%2F960x0.jpg")
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let imageData = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                    self.imageView.contentMode = .scaleAspectFill
                }
            }
        }
        task.resume()
    }
    
    func Calculator(a:Int,b:Int,operation: (Int,Int) -> Int) -> Int {
        return operation(a,b)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondViewSegue" {
            let secondControlle = segue.destination as! SecondViewController
            secondControlle.delegate = self
        }
    }
}

