//
//  WeatherViewModel.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherViewModel: NSObject {
    
    weak var parentVc : UIViewController?
    var weatherView : WeatherView?
    var datasource : [RLMWeather]?
    var hashImg = [String:UIImage]()
    var isCelcius  = true
    
    static let shared = WeatherViewModel()
    
    func loadWeatherView(){
        
        datasource = [RLMWeather]()
        weatherView = WeatherView.fromNib()
        registerCell()
        
        weatherView?.txtfield.delegate = self
        weatherView?.cityListView.dataSource = self
        weatherView?.cityListView.delegate = self
        weatherView?.addCityBtn.addTarget(self, action: #selector(addCityClicked), for: .touchUpInside)
        weatherView?.segmentCtrl.addTarget(self, action: #selector(segChanged), for: .valueChanged)
        
        //load data from db
        datasource = WeatherManager.shared.getWeatherDataFromDB(sortBy: "name")
        //prepare img hash
        if let datasource = datasource{
            for rlmWeather in datasource{
                let img = UIImage.gifImageWithName(rlmWeather.icon)
                self.hashImg[rlmWeather.icon] = img
            }
        }
        
        DispatchQueue.main.async {
            self.weatherView?.cityListView.reloadData()
        }
        
        
    }
    
    @objc func addCityClicked(){
        
        weatherView?.endEditing(true)
        let manager = WeatherManager()
        if let name = weatherView?.txtfield.text{
            manager.getWeather(cityName: name) { (weather) in
                
                if let weather = weather{
                    self.datasource?.append(weather)
                    let img = UIImage.gifImageWithName(weather.icon)
                    self.hashImg[weather.icon] = img
                    DispatchQueue.main.async {
                        self.weatherView?.cityListView.reloadData()
                    }
                }else{
                    print("invalid city name")
                    self.showAlert(title: "Invalid City", msg: "Please enter the valid city name.")
                }
                
            }
        }
        
    }
    
    func showAlert(title:String,msg:String){
        let vc = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        vc.addAction(action)
        parentVc?.present(vc, animated: true, completion: nil)
    }
    
    func showDetailView(w:RLMWeather){
        let vc = DetailViewController.init(nibName: "DetailViewController", bundle: Bundle.main)
        vc.controllerType = "weatherDetail"
        vc.detailViewModel = WeatherDetailViewModel.shared
        vc.detailViewModel?.weather = w
        parentVc?.navigationController?.isNavigationBarHidden = false
        parentVc?.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func segChanged(){
        
        if weatherView?.segmentCtrl.selectedSegmentIndex == 0{
            isCelcius = true
        }else{
            isCelcius = false
        }
        self.weatherView?.cityListView.reloadData()
        
    }
    
    func loadGif(imgV : UIImageView, imgN:String){
        
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
        imgV.image = gif
    }
    
    func toCelcius(kelvin : Double) -> String{
        
        return String(Int(kelvin - 273.15))
    }
    
    func toFarenheit(kelvin : Double) -> String{
        
        return String(Int((kelvin - 273.15) * 9/5 + 32))
    }

}

extension WeatherViewModel : UITextFieldDelegate{
    
    
}

extension WeatherViewModel : UITableViewDelegate,UITableViewDataSource{
    
    func registerCell(){
        weatherView?.cityListView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let datasource = datasource{
            return datasource.count
        }
        print("no data source")
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        
        if let datasource = datasource{
            let weather = datasource[indexPath.row]
            
            cell.name.text = weather.name
            cell.background.image = nil
            cell.background.image = hashImg[weather.icon]
            
            cell.temp.text = isCelcius ? toCelcius(kelvin: Double(weather.temp) ?? 0) : toFarenheit(kelvin: Double(weather.temp) ?? 0)
            
            return cell
           // loadGif(imgV: cell.background, imgN: weather.main_weather?[0].main_type ?? "rain")
        }
        
        print("empty cell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let datasource = datasource{
            let weather = datasource[indexPath.row]
            showDetailView(w: weather)
        }
        
    }
    
    
}
