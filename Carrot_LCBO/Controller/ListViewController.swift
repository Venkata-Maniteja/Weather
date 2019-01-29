//
//  ListViewController.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 25/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var controllerType : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //observe the network changes, andupdate user when no network is avilablble
        startObservingNetworkChanges()
        

        // Do any additional setup after loading the view.
        if let type = controllerType{
            if type == "movies"{
                MovieReviewViewModel.shared.loadReviewView()
                let scrollV = UIScrollView(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: view.frame.size.height - 100))
                view.addSubview(scrollV)
                if let reviewView = MovieReviewViewModel.shared.reviewView{
                    scrollV.addSubview(reviewView)
                    scrollV.contentSize = reviewView.frame.size
                }
            }
            
            if type == "weather"{
                navigationController?.isNavigationBarHidden = true
                WeatherViewModel.shared.loadWeatherView()
                WeatherViewModel.shared.parentVc = self
                view = WeatherViewModel.shared.weatherView
            }
        }
       
        
    }
    
    func customiseLandingView(){
        
        //http://www.omdbapi.com/?i=tt3896198&apikey=a48a94d0
        
        //TODO - build box views Movie Reviews/Recepies/News/Videos
        
    }
    
    @IBAction func goHome(){
        dismiss(animated: true, completion: nil)
    }
    

    
}



