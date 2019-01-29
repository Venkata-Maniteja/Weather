//
//  RLMWeather.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit
import RealmSwift

class RLMWeather: Object {

    @objc dynamic var name = ""
    @objc dynamic var desc = ""
    @objc dynamic var desc_detail = ""
    @objc dynamic var temp = ""
    @objc dynamic var humidity = ""
    @objc dynamic var pressure = ""
    @objc dynamic var icon = ""
    @objc dynamic var speed = ""
    @objc dynamic var deg = ""
    @objc dynamic var pk = 0
   
    
    func getLastRowPk() -> Int{
        let realm = try! Realm()
        if let maxValue =  realm.objects(RLMWeather.self).max(ofProperty: "pk") as Int?{
            return maxValue
        }
        return 0
    }
    
    override static func primaryKey() -> String? {
        return "pk"
    }
    
    convenience init(weather:Weather) {
        self.init()
        
        if let weather_name = weather.name{
            name = weather_name
        }
        if let weather_desc = weather.main_weather?[0].main_type{
            desc = weather_desc
        }
        if let desc_det = weather.main_weather?[0].description{
            desc_detail = desc_det
        }
        
        if let we_temp = weather.main?.temp{
            temp = String(we_temp)
        }
        
        if let main = weather.main{
            if let we_pressure = main.pressure{
                pressure = String(we_pressure)
            }
            if let we_humidity = main.humidity{
                humidity = String(we_humidity)
            }
        }
        
        if let wind = weather.wind{
            if let we_speed = wind.speed{
                speed = String(we_speed)
            }
            if let degrees = wind.deg{
               deg = String(degrees)
            }
        }
        
        icon = WeatherManager.getIconName(imgN: weather.main_weather?[0].main_type ?? "clear") ?? "clear"
       
        pk = getLastRowPk() + 1
        
        print(pk)
    }
    
}
