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

class SecViewController: UIViewController,WordViewControllerDelegate {
    
    var delegate: SecViewControllerDelegate?
    
    @IBOutlet weak var words: UITableView!
    @IBOutlet weak var search: UISearchBar!
    @IBAction func Return(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgr.png")
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Wordsegue" {
            let destinationVC = segue.destination as! WordViewController
            destinationVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

    

/*
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
