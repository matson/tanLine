//
//  WeatherData.swift
//  tanLine
//
//  Created by Tracy Adams on 5/23/23.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather] //an array
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
