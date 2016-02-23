//
//  BSFighterListTableViewController.swift
//  
//
//  Created by Jamaal Sedayao on 2/23/16.
//
//

import UIKit

protocol RedFighterSelectedDelegate{
    func userDidSelectRedFighter(redFighter:Fighter)
}
protocol BlueFighterSelectedDelegate{
    func userDidSelectBlueFighter(blueFighter:Fighter)
}

class BSFighterListTableViewController: UITableViewController {
    
    var fightersArray = [Fighter]()
    var delegateRed: RedFighterSelectedDelegate? = nil
    var delegateBlue: BlueFighterSelectedDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Choose Your Fighter"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        initiateData()
    
    }

    func initiateData(){
        
        let fighterCharles = Fighter(firstName: "Charles", lastName: "Kang", weight: "147", height: "5'6", wins:12, losses: 0, imageString: "charleskang", weightDivision:"Welterweight", stance: "Southpaw", country:"USA/S.Korea")
        fighterCharles.knockouts = 8
        fighterCharles.nickName = "The King"
    
        
        let fighterBereket = Fighter(firstName: "Bereket", lastName: "Ghebremedhin", weight: "145", height: "5'10", wins: 13, losses: 2, imageString: "bereket", weightDivision:"Welterweight", stance: "Orthodox", country: "Eritrea")
        fighterBereket.knockouts = 12
        fighterBereket.nickName = "Breaks Stuff"
        
        fightersArray.append(fighterBereket)
        fightersArray.append(fighterCharles)
        
        //print(fighterCharles.firstName)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fightersArray.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Fighters"
        }
        return ""
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let fighter = fightersArray[indexPath.row] as Fighter!
        
        if (delegateRed != nil){
            delegateRed?.userDidSelectRedFighter(fighter)
        }
        
        if (delegateBlue != nil){
            delegateBlue?.userDidSelectBlueFighter(fighter)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("fighterIdentifier", forIndexPath: indexPath) as! CustomFighterTableViewCell
        
        let fighter = fightersArray[indexPath.row] as Fighter!
        
        cell.nameLabel.text = "\(fighter.firstName!) \"\(fighter.nickName!)\" \(fighter.lastName!)"
        cell.weightLabel.text = "\(fighter.weight!) lbs."
        cell.heightLabel.text = "Ht: \(fighter.height!)"
        cell.recordLabel.text = "\(fighter.wins!) W - \(fighter.losses!) L, \(fighter.knockouts!)KOs"
        cell.countryLabel.text = "Origin: \(fighter.country!)"
        cell.divisionLabel.text = fighter.weightDivision!
        cell.stanceLabel.text = "Stance: \(fighter.stance!)"
        let image : UIImage = UIImage(named: fighter.imageString!)!
        cell.fighterImage?.image = image
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
