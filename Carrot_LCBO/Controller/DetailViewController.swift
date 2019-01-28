//
//  DetailViewController.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var controllerType : String?
    var detailViewModel : WeatherDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let type = controllerType{
            if type == "weatherDetail"{
              
                detailViewModel?.loadWeatherDetailView()
                view = detailViewModel?.weatherDetailView
                detailViewModel?.updateDetailView()
            }
            
            
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

