//
//  Weather.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//
/*,
 "weather": [
 {
 "id": 800,
 "main": "Clear",
 "description": "clear sky",
 "icon": "01n"
 }
 ],
 "base": "stations",
 "main": {
 "temp": 275.55,
 "pressure": 1008,
 "humidity": 51,
 "temp_min": 274.15,
 "temp_max": 277.15
 },
 "visibility": 10000,
 "wind": {
 "speed": 3.1,
 "deg": 300
 },
 "clouds": {
 "all": 0
 },
 "dt": 1548696000,
 "sys": {
 "type": 1,
 "id": 1412,
 "message": 0.0031,
 "country": "GB",
 "sunrise": 1548661448,
 "sunset": 1548693814
 },
 "id": 2643743,
 "name": "London",
 "cod": 200
 }*/
import UIKit

struct Weather: Codable {
    
    var coord : Coordinates?
    var main_weather : [Weather_Main]?
    var main : Main?
    var wind : Wind?
    var clouds : Clouds?
    var sys : Sys?
    var rain : Rain?
    var id : Int?
    var name : String?
    var cod : Int?
    var base : String?
    var visibility : Double?
    var dt : Int?
    var message : String?
    var background_img : UIImage?
    
    enum CodingKeys : String, CodingKey{
        case coord = "coord"
        case main_weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case id = "id"
        case name = "name"
        case cod = "cod"
        case rain = "rain"
        case message = "message"
        
    }
    
    struct Coordinates : Codable {
        var latitude : Double?
        var longitude : Double?
        
        enum CodingKeys : String, CodingKey{
            case latitude = "lat"
            case longitude = "lon"
        }
    }
    
    struct Wind : Codable {
        var speed : Double?
        var deg : Double?
        
        enum CodingKeys : String, CodingKey{
            case speed = "speed"
            case deg = "deg"
        }
    }
    
    struct Clouds : Codable {
        var all : Int?
        
        enum CodingKeys : String, CodingKey{
            case all = "all"
        }
    }
    
    struct Rain : Codable {
        var threeH : Double?
        
        enum CodingKeys : String, CodingKey{
            case threeH = "3h"
        }
    }
    
    struct Sys : Codable {
        var id : Int?
        var type : Int?
        var message : Double?
        var country : String?
        var sunrise : Int?
        var sunset : Int?
        
        
        enum CodingKeys : String, CodingKey{
            case id = "id"
            case type = "type"
            case message = "message"
            case country = "country"
            case sunrise = "sunrise"
            case sunset = "sunset"
        }
    }
    
    struct Weather_Main : Codable {
        var id : Int?
        var main_type : String?
        var description : String?
        var icon : String?

        
        enum CodingKeys : String, CodingKey{
            case id = "id"
            case main_type = "main"
            case description = "description"
            case icon = "icon"
        }
    }
    
    struct Main : Codable {
        var temp : Double?
        var pressure : Double?
        var humidity : Double?
        var temp_min : Double?
        var temp_max : Double?
        
        
        enum CodingKeys : String, CodingKey{
            case temp = "temp"
            case pressure = "pressure"
            case humidity = "humidity"
            case temp_min = "temp_min"
            case temp_max = "temp_max"
        }
    }

}
