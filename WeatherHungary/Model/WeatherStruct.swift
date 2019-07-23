//
//  WeatherStruct.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 23..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import Foundation

struct WeatherInfo: Decodable {
    let clouds: Clouds
    let cod: Int
    let main: Main
    let sys: Sys
    let wind: Wind
}

struct Clouds: Decodable {
    let all: Int
    
    // Clouds into full sentence
    func clouds() -> String {
        let clouds = "Clouds: \(String(describing: all))%"
        return clouds
    }
    
}

struct Main: Decodable {
    let humidity: Int
    let temp: Double
    private enum CodingKeys: String, CodingKey {
        case humidity, temp
    }
    // Temp converting to Celsius into full sentence
    func celsius() -> String {
        let celsius = "Temperatur: \(String(describing: String(format: "%.0f", temp  - 273.15)))ºC"
        return celsius
    }
    
    // Humidity into full sentence
    func maniHumidity() -> String {
        let maniHumidity = "Humidity: \(String(describing: humidity))%"
        return maniHumidity
    }
}

struct Sys: Decodable {
    let sunset: UInt64
    
    // Sunset unix time converting to human time into full sentence
    func sunsetTime() -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(sunset))
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date)
        let sunsetTime = "Sunset: \(hour):\(minutes)"
        return sunsetTime
    }
}

struct Wind: Decodable {
    let speed: Double
    
    // Windspeed into full sentence
    func windspeed() -> String {
        let windspeed = "Wind Speed: \(String(describing: speed))m/s"
        return windspeed
    }
}
