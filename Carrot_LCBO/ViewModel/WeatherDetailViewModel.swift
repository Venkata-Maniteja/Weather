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
    var weather : RLMWeather?
    
    static let shared = WeatherDetailViewModel()
    
    func loadWeatherDetailView(){
        
        weatherDetailView = WeatherDetailView.fromNib()
        
        
    }
    
    func updateDetailView(){
        if let weatherDetailView = weatherDetailView{
            
            weatherDetailView.background.image = UIImage.gifImageWithName(weather?.icon ?? "clear")
            weatherDetailView.name.text = weather?.name
            weatherDetailView.main.text = weather?.desc
            weatherDetailView.desc.text = weather?.desc_detail
            
            weatherDetailView.pressure.text = weather?.pressure
            weatherDetailView.humidity.text = weather?.humidity
            
            weatherDetailView.wind_speed.text = weather?.speed
            weatherDetailView.wind_degrees.text = weather?.deg
            
            //weatherDetailView.temp.text = weather?.main_weather.temp
        }
    }
    
}
