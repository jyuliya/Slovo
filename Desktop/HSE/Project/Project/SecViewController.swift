//
//  SecViewController.swift
//  Project
//
//  Created by Юлия Ренева on 01.06.17.
//  Copyright © 2017 Юлия Ренева. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation


protocol SecViewControllerDelegate {
    
}

class SecViewController: UIViewController, WordViewControllerDelegate, UISearchBarDelegate {
    @IBAction func follow(_ sender: UIButton) {
        
    }
    
    var delegate: SecViewControllerDelegate?
    var count = 0
    @IBOutlet weak var tableView: UITableView!
    var dict = NSDictionary()
    @IBOutlet weak var search: UISearchBar!
    @IBAction func Return(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgr.png")
        self.view.insertSubview(backgroundImage, at: 0)
        getData()
        search.delegate = self
        tableView.dataSource = self as UITableViewDataSource
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Word" {
            let destinationVC = segue.destination as! WordViewController
            destinationVC.delegate = self
            destinationVC.labeltext = dict.allKeys[count] as! String
        }
        if segue.identifier == "SW" {
            let destinationVC = segue.destination as! WordViewController
            destinationVC.delegate = self
            let content = dict.allKeys.contains {
                key in (key as AnyObject).contains(" " + search.text! + " ")
            }
            if content {
                destinationVC.labeltext = search.text!
                //destinationVC.labeltext1 = dict[" " + search.text! + " "] as! String
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBar(search: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarSearchButtonClicked(_ search: UISearchBar) {
        searchData(a: search.text!)
    }
    
    func searchBarTextDidBeginEditing(_ search: UISearchBar) {
        
    }
    
    
    func getData() {
        let path = Bundle.main.path(forResource: "data", ofType: "json") as String!
        if let data = NSData(contentsOfFile: path!) as Data! {
            do {
                let json = try JSONSerialization.jsonObject(with: data) as AnyObject
                dict = json as! NSDictionary
            }
            catch{
                print("error")
            }
        }
    }
    
    func searchData(a: String) {
        let content = dict.allKeys.contains {
            key in (key as AnyObject).contains(" " + search.text! + " ")
        }
    }


}

extension SecViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        count = indexPath.row
        cell.textLabel?.text =  dict.allKeys[indexPath.row] as? String
        let content = dict.allKeys.contains {
            key in (key as AnyObject).contains(" " + search.text! + " ")
        }
        if content {
            tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath).textLabel?.text = search.text!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        count = indexPath.row
        //performSegue(withIdentifier: "Word", sender: self)
    }
    
}
