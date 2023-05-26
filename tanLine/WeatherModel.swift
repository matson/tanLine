//
//  WeatherModel.swift
//  tanLine
//
//  Created by Tracy Adams on 5/24/23.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    //computed property. 
    var conditionName: String {
        switch conditionId {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
        default: return "cloud"
            
        }
        
    }
    
    //void function.
    func bronzeRadar(conditionName: String) -> String {
        var text: String
        if(conditionName == "sun.max"){
              text = "wear that sunscreen and get that bronze on!"
        }
        else{
            text = "you problably will not catch that bronze today"
        }
        return text
    }
    
}
