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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create URL
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
           
            //3. Give the session a Task:
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    //need to parse the data
                    self.parseJSON(weatherData: safeData)
                    
                }
            }
           
            //4. Start the Task
            task.resume()

        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        }catch{
            print(error)
        }
    }
}


