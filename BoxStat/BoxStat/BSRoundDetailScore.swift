//
//  BSRoundDetailScore.swift
//  BoxStat
//
//  Created by Jamaal Sedayao on 2/11/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class BSRoundDetailScore: UIViewController {
    //UIView
    @IBOutlet var redCornerButtonsView: UIView!
    @IBOutlet var blueCornerButtonsView: UIView!
    @IBOutlet var redCornerTopView: UIView!
    @IBOutlet var blueCornerTopView: UIView!
    //ButtonOutlets
    @IBOutlet var redCleanPunchButton: UIButton!
    @IBOutlet var redDefenseButton: UIButton!
    @IBOutlet var redEffAggButton: UIButton!
    @IBOutlet var redRingGenButton: UIButton!
    @IBOutlet var blueCleanPunchButton: UIButton!
    @IBOutlet var blueDefenseButton: UIButton!
    @IBOutlet var blueEffAggButton: UIButton!
    @IBOutlet var blueRingGenButton: UIButton!
    //Testlabels
    @IBOutlet var blueCleanPunchLabel: UILabel!
    @IBOutlet var blueDefenseLabel: UILabel!
    @IBOutlet var blueEffAggLabel: UILabel!
    @IBOutlet var blueRingGenLabel: UILabel!
    @IBOutlet var redCleanPunchLabel: UILabel!
    @IBOutlet var redDefenseLabel: UILabel!
    @IBOutlet var redEffAggLabel: UILabel!
    @IBOutlet var redRingGenLabel: UILabel!
    //Score Variables
    var redCleanPunchScore = 0
    var redDefenseScore = 0
    var redEffAggScore = 0
    var redRingGenScore = 0
    var blueCleanPunchScore = 0
    var blueDefenseScore = 0
    var blueEffAggScore = 0
    var blueRingGenScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotateLandscape()
        displayUI()
    }
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func rotateLandscape(){
        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    func displayUI(){
        redCornerButtonsView.layer.borderWidth = 3.0
        blueCornerButtonsView.layer.borderWidth = 3.0
        redCornerButtonsView.layer.borderColor = (UIColor.blackColor()).CGColor
        blueCornerButtonsView.layer.borderColor = (UIColor.blackColor()).CGColor
        
        redCornerTopView.layer.borderWidth = 2.0
        blueCornerTopView.layer.borderWidth = 2.0
        redCornerTopView.layer.borderColor = (UIColor.redColor()).CGColor
        blueCornerTopView.layer.borderColor = (UIColor.blueColor()).CGColor
    }
    
    
    @IBAction func redCornerButtonTapped(sender: AnyObject) {
        if redCleanPunchButton == sender as! UIButton{
            redCleanPunchScore += 1
            redCleanPunchLabel.text = String(redCleanPunchScore)
        } else if redDefenseButton == sender as! UIButton{
            redDefenseScore += 1
            redDefenseLabel.text = String(redDefenseScore)
        } else if redEffAggButton == sender as! UIButton{
            redEffAggScore += 1
            redEffAggLabel.text = String(redEffAggScore)
        } else if redRingGenButton == sender as! UIButton{
            redRingGenScore += 1
            redRingGenLabel.text = String(redRingGenScore)
        }
        
    }
    @IBAction func blueCornerButtonTapped(sender: AnyObject) {
        if blueCleanPunchButton == sender as! UIButton{
            blueCleanPunchScore += 1
            blueCleanPunchLabel.text = String(blueCleanPunchScore)
        } else if blueDefenseButton == sender as! UIButton{
            blueDefenseScore += 1
            blueDefenseLabel.text = String(blueDefenseScore)
        } else if blueEffAggButton == sender as! UIButton{
            blueEffAggScore += 1
            blueEffAggLabel.text = String(blueEffAggScore)
        } else if blueRingGenButton == sender as! UIButton{
            blueRingGenScore += 1
            blueRingGenLabel.text = String(blueRingGenScore)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
