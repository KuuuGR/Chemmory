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
        
        backgroundNumber.text = String(lifeBarScotchAmmount)
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        
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
