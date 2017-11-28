//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Carlos Poles on 26/11/17.
//  Copyright © 2017 Carlos Poles. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    // MARK: - TableView Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // only one section in this tableView
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // numberOfRowsInEachSection
        switch section {
        case 0:
            return itemStore.allItems.filter { $0.valueInDollars > 50 }.count + 1 // add an extra row for the "no more items" warning
        default:
            return itemStore.allItems.filter { $0.valueInDollars < 50 }.count + 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       // set section header titles
       return  section == 0 ? "Over $50" : "Below $50"
 
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        switch indexPath.section  { // section "Over 50"
        case 0:
            let aboveFifty = itemStore.allItems.filter { $0.valueInDollars > 50 }.sorted { $0.valueInDollars < $1.valueInDollars }
            let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
            // Display "No more items in the last row of the table view."
            if indexPath.row == numberOfRows - 1 {
                cell.textLabel?.text = "No more items."
                cell.detailTextLabel?.text = nil
            } else {
                // Configure the cell...
                // Set the text on the cell with the description of the item that is at the nth index of items
                // where n = row this cell will appear in on the tableview
                let item  = aboveFifty[indexPath.row]
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            }
            return cell
        default:
            let belowFifty = itemStore.allItems.filter { $0.valueInDollars < 50 }.sorted { $0.valueInDollars < $1.valueInDollars }
            let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
            if indexPath.row == numberOfRows - 1 {
                cell.textLabel?.text = "No more items."
                cell.detailTextLabel?.text = nil
            } else {
                let item = belowFifty[indexPath.row]
                
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            }
            return cell
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
