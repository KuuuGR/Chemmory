//
//  BottleGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 20/08/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class BottleGameViewController: UIViewController {
    
    @IBOutlet weak var centerBottleButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bottleImage  = UIImage(named: "bottle" + String(Int.random(in: 0...5)) + ".png")
        centerBottleButton.setImage(bottleImage, for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
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
