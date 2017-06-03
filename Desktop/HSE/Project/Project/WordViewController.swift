//
//  WordViewController.swift
//  Project
//
//  Created by Юлия Ренева on 01.06.17.
//  Copyright © 2017 Юлия Ренева. All rights reserved.
//

import UIKit

protocol WordViewControllerDelegate {
    
}

class WordViewController: UIViewController {

    var delegate: WordViewControllerDelegate?
    
    @IBOutlet weak var Word: UILabel!
    @IBOutlet weak var Def: UILabel!
    
    var labeltext = String()
    var labeltext1 = String()
    
    @IBAction func Return_b(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        Word.text = labeltext
        Def.text = labeltext1
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "backgr.png")
        self.view.insertSubview(backgroundImage, at: 0)
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
