//
//  WeatherDetailViewModel.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class WeatherDetailViewModel: NSObject {

    weak var parentVc : UIViewController?
    var weatherDetailView : WeatherDetailView?
    var weather : Weather?
    
    static let shared = WeatherDetailViewModel()
    
    func loadWeatherDetailView(){
        
        weatherDetailView = WeatherDetailView.fromNib()
        
        
    }
    
    func updateDetailView(){
        if let weatherDetailView = weatherDetailView{
            weatherDetailView.background.image = weather?.background_img
            weatherDetailView.name.text = weather?.name
            weatherDetailView.main.text = weather?.main_weather?[0].main_type
            weatherDetailView.desc.text = weather?.main_weather?[0].description
            
            if let main = weather?.main{
                if let pressure = main.pressure{
                     weatherDetailView.pressure.text = String(pressure)
                }
                if let humidity = main.humidity{
                    weatherDetailView.humidity.text = String(humidity)
                }
            }
            
            if let wind = weather?.wind{
                if let speed = wind.speed{
                    weatherDetailView.wind_speed.text = String(speed)
                }
                if let degrees = wind.deg{
                    weatherDetailView.wind_degrees.text = String(degrees)
                }
            }
           
            
            //weatherDetailView.temp.text = weather?.main_weather.temp
        }
    }
    
}
