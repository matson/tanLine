//
//  WeatherManager.swift
//  tanLine
//
//  Created by Tracy Adams on 5/22/23.
//

import Foundation

//https://api.openweathermap.org/data/2.5/weather?temp=293.39&units=metic&appid=03ac0ea03b5fc4cb1f6cf7d57f66f60c

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=03ac0ea03b5fc4cb1f6cf7d57f66f60c&units=metric"
    
    func fetchWeather(cityName: String){
        //by city
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
}
