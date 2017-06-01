//
//  TableViewController.swift
//  Project
//
//  Created by Юлия Ренева on 01.06.17.
//  Copyright © 2017 Юлия Ренева. All rights reserved.
//
/*
import UIKit

protocol TableViewControllerDelegate {
    //func fill(info: String)
}

class TableViewController: UITableViewController {

   // @IBOutlet weak var Search: UISearchBar!
    var delegate = TableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

import UIKit
import SwiftyJSON
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate{
    
    
    @IBOutlet weak var Definition: UILabel!
    @IBOutlet weak var Lbl: UILabel!
    @IBOutlet weak var Search: UISearchBar!
    @IBOutlet weak var Title2: UILabel!
    var dict = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        Search.delegate = self
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg_image.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func searchBar(Search: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarSearchButtonClicked(_ Search: UISearchBar) {
        searchData(a: Search.text!)
    }
    
    func searchBarTextDidBeginEditing(_ Search: UISearchBar) {
        
    }
    
    
    func searchBarCancelButtonClicked(_ Search: UISearchBar) {
        print(3)
        Lbl.textColor = UIColor.green
    }
    
    func getData() {
        let path = Bundle.main.path(forResource: "data_2", ofType: "json") as String!
        if let data = NSData(contentsOfFile: path!) as Data! {
            do {
                
                let json = try JSONSerialization.jsonObject(with: data) as AnyObject
                print(json["glossary"])
                if let words = json["words"] as? NSDictionary {
                    dict = words
                    Title2.text = "Топ слов: \n"
                    Definition.text = (words.allKeys[1] as? String)! + "\n" +  (words.allKeys[2] as? String)!
                    //                    print((words.allKeys[1] as? [Any: String])!)
                    
                }
                else {
                    print("not")
                }
            }
            catch{
                print("error")
            }
        }
    }
    
    func searchData(a: String) {
        print(a)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

*/
