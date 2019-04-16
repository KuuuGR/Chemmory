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
    @IBOutlet weak var backgroundOptionsCardImage: UIImageView!
    @IBOutlet weak var fontOptionsCardImage: UIImageView!
    @IBOutlet var fontOptionsLabelsCollection: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        backgroundNumber.text = String(backgroundPictureNumber)
        for element in fontOptionsLabelsCollection {
            element.textColor = UIColor.red
        }
    }
    
    //Background Options
    
    @IBAction func dcsImageNrButtonTapped(_ sender: UIButton) {
        changeCardBackPicture(increasing: false)
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        changeCardBackPicture(increasing: true)
    }
    
    func changeCardBackPicture(increasing: Bool) {
        
        if (backgroundPictureNumber < 101), increasing  {
            backgroundPictureNumber += 1
        } else if (backgroundPictureNumber > 0 ), !increasing {
            backgroundPictureNumber -= 1
        }
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        backgroundNumber.text = String(backgroundPictureNumber)
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
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


