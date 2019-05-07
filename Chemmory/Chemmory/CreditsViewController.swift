//
//  CreditsViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 06/05/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    @IBOutlet weak var logoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoButton.layer.cornerRadius =  logoButton.frame.height * 0.1
        logoButton.layer.borderWidth = 4
        logoButton.layer.borderColor = UIColor.darkGray.cgColor
        logoButton.clipsToBounds = true
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logoButtonTapped(_ sender: Any) {
        
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
