//
//  MovieReviewManager.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 27/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

import UIKit

class MovieReviewManager: NSObject {

    
    func getMovieReview(movieName:String,completion: @escaping (_ review: MovieReview) -> Void){
        
        //creating a NSURL
        let scheme = "http"
        let host = "www.omdbapi.com"
        let path = "/"
        let queryItem1 = URLQueryItem(name: "t", value: movieName)
        let queryItem2 = URLQueryItem(name: "apikey", value: "a48a94d0")
        
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = [queryItem1,queryItem2]
        
        print(urlComponents.url)
        
        if let url = urlComponents.url {
        
            getData(from: url) { (data, response, error) in
                if let data = data{
                    let review = try! JSONDecoder().decode(MovieReview.self, from: data)
                    completion(review)
                }
            }
        }
       
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
    func downloadImage(from url: URL?,completion: @escaping (_ img: UIImage?) -> Void) {
        print("Download Started")
        if let url = url{
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                let img = UIImage(data: data)
                completion(img)
                
            }
        }
    }
    
    
}
