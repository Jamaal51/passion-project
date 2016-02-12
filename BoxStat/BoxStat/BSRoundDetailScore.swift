//
//  BSRoundDetailScore.swift
//  BoxStat
//
//  Created by Jamaal Sedayao on 2/11/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class BSRoundDetailScore: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    override func shouldAutorotate() -> Bool {
        return true
    }
}
