//
//  OptionsViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 16/04/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    
    @IBOutlet weak var backgroundNumber: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ScrollView.contentSize.height = 1000
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func dcsImageNrButtonTapped(_ sender: UIButton) {
        incCardPicture(increasing: false)
        
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        incCardPicture(increasing: true)
    }
    
    
    func incCardPicture(increasing: Bool) {
        
        if (backgroundPictureNumber < 101), increasing  {
            backgroundPictureNumber += 1
        } else if (backgroundPictureNumber > 0 ), !increasing {
            backgroundPictureNumber -= 1
        }
        backgroundImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        backgroundNumber.text = String(backgroundPictureNumber)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


