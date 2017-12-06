//
//  SecondViewController.swift
//  Thunderwear1
//
//  Created by Jess Eng on 12/5/17.
//  Copyright © 2017 Jess Eng. All rights reserved.
//

import UIKit
import Alamofire
var weatherInfo: [String] = []

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherInfo = []
        // Do any additional setup after loading the view.
    }

    // MARK: Properties
    @IBOutlet weak var newLocationLabel: UILabel!
    @IBOutlet weak var search: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Actions

    @IBAction func submit(_ sender: UIButton) {
        
        let parameters: [String: String] = [
            "Location" : search.text!
        ]

        Alamofire.request("http://ide50-sangopark.cs50.io:8080/algorithm", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success:
                print(response.value)
                if let JSON = response.result.value as! [[String: Any]]!{

                    for i in 0..<(JSON.count){
                        let temp = JSON[i] as [String: AnyObject]!
//                        print(temp?["item"] as! String)
                        weatherInfo.append(temp?["item"] as! String)
                        showText = true
                    }
                }
                print("Validation Successful")
                self.performSegue(withIdentifier: "submitSegue", sender: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}



