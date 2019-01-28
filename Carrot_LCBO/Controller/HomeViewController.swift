//
//  HomeViewController.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 27/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieReel : UIImageView!
    @IBOutlet weak var weather : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func movieReviewPressed(){
        
        movieReel.animateTap()
        performSegue(withIdentifier: "showList", sender: "movies")
        
    }
    
    @IBAction func weatherPressed(){
        
        weather.animateTap()
        performSegue(withIdentifier: "showList", sender: "weather")
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let listVc = segue.destination as? TabViewController{
            listVc.controllerType = sender as? String
        }
    }
 

}
