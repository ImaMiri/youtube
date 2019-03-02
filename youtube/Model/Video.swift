//
//  Model.swift
//  youtube
//
//  Created by Ima Miri on 14/11/18.
//  Copyright © 2018 TechKube. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
}
