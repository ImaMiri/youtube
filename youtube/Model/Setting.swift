//
//  Setting.swift
//  youtube
//
//  Created by Ima Miri on 22/11/18.
//  Copyright © 2018 TechKube. All rights reserved.
//

import UIKit

class Setting: NSObject {
    
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
}
