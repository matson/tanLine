//
//  ViewController.swift
//  tanLine
//
//  Created by Tracy Adams on 5/15/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherLabel: UILabel!
   
    @IBOutlet weak var locationLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        //set it to class.
        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchPressed(_ sender: UIButton){
        searchBar.endEditing(true)
        print(searchBar.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.endEditing(true)
        print(searchBar.text!)
        return true
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
            
        }else{
            textField.placeholder = "type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if let city = searchBar.text {
            weatherManager.fetchWeather(cityName: city)
        }
        //capture the weather for the city
        searchBar.text = ""
        
        
        
    }
    
}

