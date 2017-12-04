//
//  ViewController.swift
//  Thunderwear1
//
//  Created by Jess Eng on 12/1/17.
//  Copyright © 2017 Jess Eng. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var outfitRec: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions

    @IBAction func getOutfit(_ sender: UIButton) {
        Alamofire.request("http://ide50-sangopark.cs50.io:8080/algorithm", method: .post).validate().responseJSON { response in
            switch response.result {
            case .success:
                print(response.value)
                if let JSON = response.result.value as! [[String: Any]]!{
                    print("JSON: \(JSON)")
                    let dic = JSON[0] as [String: AnyObject]!
                    var top = dic?["item"] as! String
                    print(top)
                    let dic2 = JSON[1] as [String: AnyObject]!
                    let bottom = dic2?["item"] as! String
                    print(bottom)
                    self.outfitRec.text =  top + " and " + bottom
                    
                    if top == "Tank Top" {
                        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"yellow")!)
                    }
                    else {
                        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"blue")!)
                    }
                    
//                    let dic3 = JSON[2] as [String: AnyObject]!
//                    let temp = dic3?["item"] as! String
//                    let fakelow = "item"
                    
//                    let low = dic3?[fakelow] as? Int ?? Int(temp as? String ?? "")
//                    print(low!)
//                    if low! > 1
//                    {
//                        print("heeelo")
//                    }
                    
                }
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

