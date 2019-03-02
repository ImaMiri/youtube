//
//  ApiService.swift
//  youtube
//
//  Created by Ima Miri on 23/11/18.
//  Copyright © 2018 TechKube. All rights reserved.
//

import UIKit

class ApiService: NSObject{
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        let urlString = "\(baseUrl)/home.json"
        fetchFeedForUrlString(urlString: urlString, completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()) {
        let urlString = "\(baseUrl)/trending.json"
        fetchFeedForUrlString(urlString: urlString, completion: completion)
    }

    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> ()) {
        let urlString = "\(baseUrl)/subscriptions.json"
        fetchFeedForUrlString(urlString: urlString, completion: completion)
    }
    
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()) {
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            do {
                if let unwrappedData = data {
                    if let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                        var videos = [Video]()
                        
                        for dictionary in jsonDictionaries {
                            let video = Video()
                            video.title = dictionary["title"] as? String
                            video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                            video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                            let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                            let channel = Channel()
                            channel.name = channelDictionary["name"] as? String
                            channel.profileImageName = channelDictionary["profile_image_name"] as? String
                            video.channel = channel
                            
                            videos.append(video)
                        }
                        DispatchQueue.main.async {
                            completion(videos)
                        }
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
}


//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//var videos = [Video]()
//
//for dictionary in json as! [(AnyObject)] {
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailIamgeName = dictionary["thumbnail_image_name"] as? String
//
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//    video.channel = channel
//
//    videos.append(video)
//}
//DispatchQueue.main.async {
//    completion(videos)
//}
