//
//  MovieReviewView.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class MovieReviewView: UIView {
    
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var circleViewHolder : UIView!
    @IBOutlet weak var movieName : UILabel!
    @IBOutlet weak var writer : UILabel!
    @IBOutlet weak var director : UILabel!
    @IBOutlet weak var actors : UILabel!
    @IBOutlet weak var plot : UILabel!
    @IBOutlet weak var year : UILabel!
    @IBOutlet weak var rated : UILabel!
    @IBOutlet weak var releaseD : UILabel!
    @IBOutlet weak var runtime : UILabel!
    @IBOutlet weak var genre : UILabel!
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var spinner : UIActivityIndicatorView!
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
