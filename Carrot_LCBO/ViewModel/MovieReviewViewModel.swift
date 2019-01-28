//
//  MovieReviewViewModel.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 28/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit
import UICircularProgressRing

class MovieReviewViewModel: NSObject {
    
    static let shared = MovieReviewViewModel()
    var reviewView : MovieReviewView?
    
    func loadReviewView(){
        
        reviewView = MovieReviewView.fromNib()
        reviewView?.searchBar.delegate = self
        
    }
    
    func updateReviewView(review:MovieReview){
        
        DispatchQueue.main.async() {
            
            if let reviewView = self.reviewView{
                
                reviewView.movieName.text = review.movieTitle
                reviewView.year.text = review.year
                reviewView.rated.text = review.rated
                reviewView.genre.text = review.genre
                reviewView.actors.text = review.actors
                reviewView.director.text = review.director
                reviewView.writer.text = review.writer
                reviewView.plot.text = review.plot
                reviewView.runtime.text = review.runtime
                
                var progressRing : UICircularProgressRing?
                if reviewView.circleViewHolder.subviews.count > 0 {
                    progressRing = reviewView.circleViewHolder.subviews[0] as? UICircularProgressRing
                }else{
                    progressRing = UICircularProgressRing(frame: reviewView.circleViewHolder.bounds)
                    reviewView.circleViewHolder.addSubview(progressRing!)
                }
                
                if let progressRing = progressRing{
                    progressRing.maxValue = 10
                    progressRing.minValue = 0
                    progressRing.value = UICircularProgressRing.ProgressValue(Float(review.imdbrating)!)
                    progressRing.innerRingColor = UIColor.blue
                    progressRing.outerRingColor = UIColor.clear
                    
                }
               
            }
        }
        
        
        
    }
    
    func updateImage(img:UIImage){
        DispatchQueue.main.async() {
            
            if let reviewView = self.reviewView{
                reviewView.imgView.image = img
            }
        }
    }
    
    func showSpinner(){
        DispatchQueue.main.async {
             if let reviewView = self.reviewView{
                reviewView.spinner.isHidden = false
                reviewView.spinner.startAnimating()
            }
        }
    }
    
    func hideSpinner(){
        DispatchQueue.main.async {
             if let reviewView = self.reviewView{
                reviewView.spinner.isHidden = true
                reviewView.spinner.stopAnimating()
            }
        }
    }
    
    

}

extension MovieReviewViewModel : UISearchBarDelegate{
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        if  let name = searchBar.text{
            showSpinner()
            
            let manager = MovieReviewManager()
            manager.getMovieReview(movieName:name ,completion:{ result in
                MovieReviewViewModel.shared.updateReviewView(review: result)
                manager.downloadImage(from: URL(string:result.poster), completion: { img in
                    
                    if let img = img{
                        self.updateImage(img: img)
                    }
                    self.hideSpinner()
                    
                })
            })
            
        }
        
    }
}


