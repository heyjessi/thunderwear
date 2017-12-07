//
//  SecondViewController.swift
//  Thunderwear1
//
//  Created by Jess Eng on 12/5/17.
//  Copyright © 2017 Jess Eng. All rights reserved.
//

import UIKit
import Alamofire
// creates array for weather info
var weatherInfo: [String] = []

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // overrides previously searched weather info's information
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
        // sends HTTP request to the server to get coordinates from text box location
        Alamofire.request("http://ide50-sangopark.cs50.io:8080/algorithm", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success:
                print(response.value)
                if let JSON = response.result.value as! [[String: Any]]!{

                    for i in 0..<(JSON.count){
                        let temp = JSON[i] as [String: AnyObject]!
                        // adds the items retrived from JSON file into weatherInfo array
                        weatherInfo.append(temp?["item"] as! String)
                        // info received so show text
                        showText = true
                    }
                }
                print("Validation Successful")
                // programmatically segue to First View Controller to ensure asynchronous execution
                self.performSegue(withIdentifier: "submitSegue", sender: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}



