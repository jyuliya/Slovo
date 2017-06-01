import UIKit
import SwiftyJSON
import Foundation


class ViewController: UIViewController, SecViewControllerDelegate {
    
    @IBOutlet var Lbl: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bgimage.jpg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSeque" {
            let destinationVC = segue.destination as! SecViewController
            destinationVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var Exit: UIButton!
    
    @IBAction func Searchstart(_ sender: UIButton) {
    }
}
//navigationController?.popViewController(animated: true)
