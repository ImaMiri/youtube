//
//  TrendingCell.swift
//  youtube
//
//  Created by Ima Miri on 28/11/18.
//  Copyright © 2018 TechKube. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
