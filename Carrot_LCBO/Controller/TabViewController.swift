//
//  TabViewController.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 27/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var secondItem: UIImageView?
    var firstItem: UIImageView?
    var controllerType : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let secondItemImageView = self.tabBar.subviews[1]
        let firstItemImageView = self.tabBar.subviews[0]
        firstItem = firstItemImageView.subviews.first as? UIImageView
        secondItem = secondItemImageView.subviews.first as? UIImageView
        let nav = viewControllers?[0] as! UINavigationController
        let vc = nav.viewControllers[0] as! ListViewController
        vc.controllerType = controllerType
        
        // Do any additional setup after loading the view.
        if let type = controllerType{
            if type == "movies"{
                
            }
            
            if type == "weather"{
                let item = tabBar.items?[0]
                item?.title = "Weather"
               item?.image = UIImage(named: "weather_tab")
                item?.selectedImage = UIImage(named: "weather_tab")
                viewControllers?.removeLast()
            }
        }
        
       
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("tab selected \(selectedIndex)")
        if selectedIndex == 1{
            animate(button: firstItem)
        }else{
            animate(button: secondItem)
        }
        
        
    }
    
    func animate(button: UIImageView?) {
        // CABasicAnimation
        if let button = button{
            button.animateTap()
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

extension UIImageView{
    
    func animateTap(){
        let animation = CABasicAnimation(keyPath: "transform")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.isRemovedOnCompletion = true
        animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.1, 1.1, 1.1))
        self.layer.add(animation, forKey: nil)
    }
    
}
