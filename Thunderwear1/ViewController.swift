//
//  ViewController.swift
//  Thunderwear1
//
//  Created by Jess Eng on 12/1/17.
//  Copyright © 2017 Jess Eng. All rights reserved.
//

import UIKit
import Alamofire
// app starts with certain text hidden
var showText = false

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var outfitRec: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var tempOut: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var rain: UILabel!
    @IBOutlet weak var misc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let len = weatherInfo.count - 1
        if(showText == false){
            // before location received, must hide the header and outfitRec text to keep main screen clean
            header.isHidden = true
            outfitRec.isHidden = true
            temp.isHidden = true
            tempOut.isHidden = true
            rain.isHidden = true
            weather.isHidden = true
            misc.isHidden = true
        }
        if(showText == true){
            // displays the header and outfitRec Text
            header.isHidden = false
            outfitRec.isHidden = false
            temp.isHidden = false
            tempOut.isHidden = false
            rain.isHidden = false
            weather.isHidden = false
            misc.isHidden = true
            
            // gets the first two articles of clothing from the weatherInfo array in the SecondViewController
            outfitRec.text = weatherInfo[0] + " and " + weatherInfo[1]
            
            // outs puts the high and low temperature
            tempOut.text = "HIGH: " + weatherInfo[len-2] + "°" + "and LOW: " + weatherInfo[len-1] + "°"
            
            
            if (weatherInfo.count > 7)
            {
                misc.isHidden = false
                misc.textColor = UIColor.white
                misc.text = "Don't forget a " + weatherInfo[2] + " or a " + weatherInfo[3] + "!"
            }
            
            // changes the header and outfitRec color to white so the user can see
            header.textColor = UIColor.white
            outfitRec.textColor = UIColor.white
            temp.textColor = UIColor.white
            tempOut.textColor = UIColor.white
            rain.textColor = UIColor.white
            weather.textColor = UIColor.white
            
            // gets weather code from weatherInfo array (tells qualitative information about the weather)
            let weatherCode = weatherInfo[len]
            
            // changes the background of the app based on weather code
            if (weatherCode[0] == "2"){
                self.view.backgroundColor = UIColor(patternImage: UIImage(named:"thunderstorm")!)
                rain.text = "Bring an umbrella and a rain jacket"
            }
            else if (weatherCode[0] == "3"){
                self.view.backgroundColor = UIColor(patternImage: UIImage(named:"drizzle")!)
                rain.text = "Bring an umbrella and a rain jacket"
            }
            else if (weatherCode[0] == "5"){
                self.view.backgroundColor = UIColor(patternImage: UIImage(named:"rain")!)
                rain.text = "Bring an umbrella and a rain jacket"
            }
            else if (weatherCode[0] == "6"){
                // changes text color to black on white background
                header.textColor = UIColor.black
                outfitRec.textColor = UIColor.black
                temp.textColor = UIColor.black
                tempOut.textColor = UIColor.black
                rain.textColor = UIColor.black
                misc.textColor = UIColor.black
                weather.textColor = UIColor.black
                self.view.backgroundColor = UIColor(patternImage:
                    UIImage(named:"snow")!)
                rain.text = "It won't rain today"
            }
            else{
                self.view.backgroundColor = UIColor(patternImage:
                    UIImage(named:"blue")!)
                rain.text = "It won't rain or snow today"
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
                    let dic2 = JSON[1] as [String: AnyObject]!
                    let bottom = dic2?["item"] as! String
                    self.outfitRec.text =  top + " and " + bottom
                     
                }
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

