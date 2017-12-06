//
//  ViewController.swift
//  Thunderwear1
//
//  Created by Jess Eng on 12/1/17.
//  Copyright © 2017 Jess Eng. All rights reserved.
//

import UIKit
import Alamofire
import MapKit
import CoreLocation
var showText = false

class ViewController: UIViewController, CLLocationManagerDelegate {

    //MARK: Properties
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var outfitRec: UILabel!
    let manager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(showText)
        if(showText == false){
            // before location received, must hide the header and outfitRec text to keep main screen clean
            header.isHidden = true
            outfitRec.isHidden = true
        }
        if(showText == true){
            // displays the header and outfitRec Text
            header.isHidden = false
            outfitRec.isHidden = false
            
            // gets the first two articles of clothing from the weatherInfo array in the SecondViewController
            outfitRec.text = weatherInfo[0] + " and " + weatherInfo[1]
            
            // changes the header and outfitRec color to white so the user can see
            header.textColor = UIColor.white
            outfitRec.textColor = UIColor.white
            
            // gets weather code from weatherInfo array (tells qualitative information about the weather)
            let weatherCode = weatherInfo[weatherInfo.count - 1]
            
            // depending on the first digit in the weather code, changes the background of the app
            if (weatherCode[0] == "2"){
                self.view.backgroundColor = UIColor(patternImage: UIImage(named:"thunderstorm")!)
            }
            else if (weatherCode[0] == "3"){
                self.view.backgroundColor = UIColor(patternImage: UIImage(named:"drizzle")!)
            }
            else if (weatherCode[0] == "5"){
                self.view.backgroundColor = UIColor(patternImage: UIImage(named:"rain")!)
            }
            else if (weatherCode[0] == "6"){
                header.textColor = UIColor.black
                outfitRec.textColor = UIColor.black
                self.view.backgroundColor = UIColor(patternImage:
                    UIImage(named:"snow")!)
            }
            else{
                self.view.backgroundColor = UIColor(patternImage:
                    UIImage(named:"blue")!)
            }
        }
        
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
                     
                }
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

