//
//  ScaleTableViewController.swift
//  HelloWorldAudioKit
//
//  Created by Michael Mecham on 4/26/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class ScaleTableViewController: UITableViewController {

    let allScales: [String] = ["C Maj","G Maj","D Maj","A Maj","E Maj","B Maj","G♭/F# Maj","D♭/C# Maj","A♭/G# Maj","E♭/D# Maj","B♭/A# Maj","F Maj","A min","E min","B min","F#/G♭ min","C#/D♭ min","G#/A♭ min","D#/E♭ min","B♭/A# min","F min","C min","G min","D min"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundPattern.png"]]
        tableView.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "ScaleBack7")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("scaleCell", forIndexPath: indexPath)
        cell.textLabel?.text = allScales[indexPath.row]
        cell.contentView.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let newScale = ScaleController.sharedController.availableScales[indexPath.row]
        ScaleController.sharedController.currentScale = newScale
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
