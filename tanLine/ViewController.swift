//
//  ViewController.swift
//  tanLine
//
//  Created by Tracy Adams on 5/15/23.
//

import UIKit
import CoreLocation

//MARK: -Class ViewController

class ViewController: UIViewController{
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherLabel: UILabel!
   
    @IBOutlet weak var locationLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //question will pop up.
        locationManager.requestLocation() //requests one time
        
        weatherManager.delegate = self
        searchBar.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func currentLocation(_ sender: UIButton) {
        locationManager.requestLocation()
        
    }
}

//extensions
//MARK: -UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
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
    
    
}
//MARK: - WeatherManagerDelegate

extension ViewController: WeatherManagerDelegate {
   
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        //need a dispatch since this is dependent on the networking
        DispatchQueue.main.async {
            self.weatherLabel.text = weather.temperatureString
            self.weatherImage.image = UIImage(systemName: weather.conditionName)
            self.locationLabel.text = weather.cityName
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
        
    }
}
//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

