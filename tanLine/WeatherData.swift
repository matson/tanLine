//
//  WeatherData.swift
//  tanLine
//
//  Created by Tracy Adams on 5/23/23.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    
    
    
}

struct Main: Decodable {
    let temp: Double
    
}

//get cloudyness, or pick the features you want and translate them on here.

