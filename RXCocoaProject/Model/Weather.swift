//
//  Weather.swift
//  RXCocoaProject
//
//  Created by Husnain Ali on 13/09/2022.
//

import Foundation

struct WeatherResult: Codable{
    let main: Weather
}

extension WeatherResult{
    static var emptyWeather: WeatherResult{
        return WeatherResult.init(main: Weather.init(temp: 0.0, humidity: 0.0))
    }
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}
