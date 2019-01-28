//
//  WeatherManager.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class WeatherManager: NSObject {

     //ef31715d29dd89502532fc32fa248ac7
    
    //https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=ef31715d29dd89502532fc32fa248ac7
    func getWeather(cityName:String,completion: @escaping (_ weather: Weather?) -> Void){
        
        //creating a NSURL
        let scheme = "https"
        let host = "api.openweathermap.org"
        let path = "/data/2.5/weather/"
        let queryItem1 = URLQueryItem(name: "q", value: cityName)
        let queryItem2 = URLQueryItem(name: "appid", value: "ef31715d29dd89502532fc32fa248ac7")
        
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = [queryItem1,queryItem2]
        
        if let url = urlComponents.url {
            
            getData(from: url) { (data, response, error) in
                if let data = data{
                    if var weather = try? JSONDecoder().decode(Weather.self, from: data){
                        weather.background_img = self.getBackImage(imgN: weather.main_weather?[0].main_type ?? "clear")
                        completion(weather)
                    }else{
                        completion(nil)
                    }
                }
            }
        }
        
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func getBackImage(imgN : String) -> UIImage?{
        var gif : UIImage?
        if imgN.lowercased().contains("rain") == true{
            gif = UIImage.gifImageWithName("rain")
        }
        if imgN.lowercased().contains("Mist") == true{
            gif = UIImage.gifImageWithName("mist_fog")
        }
        if imgN.lowercased().contains("cloud") == true{
            gif = UIImage.gifImageWithName("cloudy")
        }
        if imgN.lowercased().contains("clear") == true{
            gif = UIImage.gifImageWithName("clear_sky")
        }
        if imgN.lowercased().contains("storm") == true{
            gif = UIImage.gifImageWithName("thunderstorm")
        }
        if imgN.lowercased().contains("snow") == true{
            gif = UIImage.gifImageWithName("snow")
        }
        
        if gif == nil{
            gif = UIImage.gifImageWithName("clear_sky")
        }
        
        print(imgN)
        
        return gif
    }
    
}
