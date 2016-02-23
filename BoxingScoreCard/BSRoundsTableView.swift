//
//  BSRoundsTableView.swift
//  BoxingScoreCard
//
//  Created by Jamaal Sedayao on 2/16/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

//enum GameState {
//    case ChooseRedFighter
//    case ChooseBlueFighter
//    case StartFight
//    
//    switch gameState {
//        case .ChooseRedFighter:
//        case .ChooseBlueFighter:
//    }
//    
//    init (){
//        self = .ChooseRedFighter
//    }
//    
//
//}

class BSRoundsTableView: UIViewController,UITableViewDelegate, UITableViewDataSource, RedFighterSelectedDelegate, BlueFighterSelectedDelegate{
    
    let tapRec = UITapGestureRecognizer()
    let tapRec2 = UITapGestureRecognizer()
    
    var passedData: String?
    
    //redCornerView
    @IBOutlet var redCornerView: UIView!
    @IBOutlet var redNameLabel: UILabel!
    @IBOutlet var redDivisionLabel: UILabel!
    @IBOutlet var redStanceLabel: UILabel!
    @IBOutlet var redCornerImageView: UIImageView!
    
    //blueCornerView
    @IBOutlet var blueCornerView: UIView!
    @IBOutlet var blueNameLabel: UILabel!
    @IBOutlet var blueCornerImageView: UIImageView!
    @IBOutlet var blueDivisionLabel: UILabel!
    @IBOutlet var blueStanceLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    var redCornerFighter: Fighter?
    var blueCornerFighter: Fighter?
    var rounds = 1
    
    func displayUI(){
        redCornerView.layer.borderWidth = 1.0
        blueCornerView.layer.borderWidth = 1.0
        redCornerView.layer.borderColor = (UIColor.redColor()).CGColor
        blueCornerView.layer.borderColor = (UIColor.blueColor()).CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        redCornerView.addGestureRecognizer(tapRec)
        redCornerView.userInteractionEnabled = true
        tapRec.addTarget(self, action: "tappedRedView")
        
        blueCornerView.addGestureRecognizer(tapRec2)
        blueCornerView.userInteractionEnabled = true
        tapRec2.addTarget(self, action: "tappedBlueView")
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if self.passedData != nil {
        print("Data Passed: \(self.passedData!)")
        }
    }
    
    func userDidSelectRedFighter(redFighter: Fighter) {
        print(redFighter.firstName!)
        redCornerFighter = redFighter
        redNameLabel.text = "\(redFighter.firstName!) \"\(redFighter.nickName!)\" \(redFighter.lastName!)"
        redDivisionLabel.text = "Division: \(redFighter.weightDivision!)"
        redStanceLabel.text = "Stance: \(redFighter.stance!)"
        let image: UIImage = UIImage(named: redFighter.imageString!)!
        redCornerImageView.image = image
    }
    
    func userDidSelectBlueFighter(blueFighter: Fighter) {
        print(blueFighter.firstName!)
        
        blueCornerFighter = blueFighter
        blueNameLabel.text = "\(blueFighter.firstName!) \"\(blueFighter.nickName!)\" \(blueFighter.lastName!)"
        blueDivisionLabel.text = "Division: \(blueFighter.weightDivision!)"
        blueStanceLabel.text = "Stance:\(blueFighter.stance!)"
        let image: UIImage = UIImage(named: blueFighter.imageString!)!
        blueCornerImageView.image = image
    }
    
    func tappedRedView(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewControllerWithIdentifier("fighterListTBVID") as! BSFighterListTableViewController
        destinationVC.delegateRed = self
        self.presentViewController(destinationVC, animated: true, completion: nil)
        
    }
    func tappedBlueView(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewControllerWithIdentifier("fighterListTBVID") as! BSFighterListTableViewController
        destinationVC.delegateBlue = self
        self.presentViewController(destinationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func endFightButtonTapped(sender: AnyObject) {
        
        print("button works!")
        
        
    }
    //MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rounds + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if indexPath.row < self.rounds{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath:indexPath) as UITableViewCell
        
        cell.textLabel?.text = "Round \(rounds)"
       
        return cell
            
        } else {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("endFightIdentifier", forIndexPath: indexPath)
        return cell
        }

}
}

