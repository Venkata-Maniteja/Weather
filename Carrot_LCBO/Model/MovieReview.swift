//
//  MovieReview.swift
//  Carrot_LCBO
//
//  Created by Rupika Sompalli on 27/01/19.
//  Copyright © 2019 Venkata. All rights reserved.
//

/* "Title": "Titanic",
 "Year": "1997",
 "Rated": "PG-13",
 "Released": "19 Dec 1997",
 "Runtime": "194 min",
 "Genre": "Drama, Romance",
 "Director": "James Cameron",
 "Writer": "James Cameron",
 "Actors": "Leonardo DiCaprio, Kate Winslet, Billy Zane, Kathy Bates",
 "Plot": "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.",
 "Language": "English, Swedish",
 "Country": "USA",
 "Awards": "Won 11 Oscars. Another 111 wins & 77 nominations.",
 "Poster": "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg",
 "Ratings": [
 {
 "Source": "Internet Movie Database",
 "Value": "7.8/10"
 },
 {
 "Source": "Rotten Tomatoes",
 "Value": "89%"
 },
 {
 "Source": "Metacritic",
 "Value": "75/100"
 }
 ],
 "Metascore": "75",
 "imdbRating": "7.8",
 "imdbVotes": "926,635",
 "imdbID": "tt0120338",
 "Type": "movie",
 "DVD": "10 Sep 2012",
 "BoxOffice": "N/A",
 "Production": "Paramount Pictures",
 "Website": "http://www.titanicmovie.com/",
 "Response": "True"*/

import UIKit

struct MovieReview: Codable {
    
    var movieTitle : String
    var year : String
    var rated : String
    var released : String
    var runtime : String
    var genre : String
    var director : String
    var writer : String
    var actors : String
    var plot : String
    var language : String
    var country : String
    var awards : String
    var poster : String
    var ratings : [Rating]
    var imdbrating : String
    
    
    
    enum CodingKeys : String, CodingKey{
        case movieTitle = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case imdbrating = "imdbRating"
    }
    
    
}

struct Rating : Codable {
    
    var source : String
    var rating : String
    
    enum CodingKeys : String, CodingKey{
        case source = "Source"
        case rating = "Value"
    }
}
