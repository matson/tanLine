//
//  ViewController.swift
//  tanLine
//
//  Created by Tracy Adams on 5/15/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,  WeatherManagerDelegate{
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherLabel: UILabel!
   
    @IBOutlet weak var locationLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchPressed(_ sender: UIButton){
        searchBar.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.endEditing(true)
        
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
    
    func didUpdateWeather(weather: WeatherModel){
        print(weather.temperature)
        
    }
    
}

