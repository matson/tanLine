//
//  WeatherManager.swift
//  tanLine
//
//  Created by Tracy Adams on 5/22/23.
//

import Foundation

/*
 real key should not be on Github.
 */


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=03ac0ea03b5fc4cb1f6cf7d57f66f60c&units=metric"
    
    func fetchWeather(cityName: String){
        //by city
        let urlString = "\(weatherURL)&q=\(cityName)"
        //print(urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create URL
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
           
            //3. Give the session a Task:
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
           
            //4. Start the Task
            task.resume()

        }
        
        
    }
    func handle(data: Data?, response: URLResponse?, error: Error?){
    }
}
