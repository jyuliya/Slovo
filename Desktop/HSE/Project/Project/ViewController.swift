import UIKit
import SwiftyJSON
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var Lbl: UILabel!
    
    @IBOutlet var Rate: UILabel!
    @IBOutlet var Search: UISearchBar!
    
    @IBOutlet weak var Title2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        searchSearchButtonClicked(searchbar: Search)
    }
    
    func searchSearchButtonClicked(searchbar: UISearchBar) {
        //Lbl.text = Search.text
        let json = try JSONSerialization.jsonObject(with: data) as AnyObject
        let words = json["words"]
        let value = words[Search.text]
        print(value)
    }
    
    func getData() {
        let path = Bundle.main.path(forResource: "data", ofType: "json") as String!
        if let data = NSData(contentsOfFile: path!) as Data! {
            do {
                let json = try JSONSerialization.jsonObject(with: data) as AnyObject
            if let words = json["words"] as? NSDictionary {
                print(words.allKeys)
                Title2.text = "Топ слов: \n"
                Rate.text =  words.allKeys[1] as? String
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
