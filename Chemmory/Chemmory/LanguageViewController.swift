//
//  LanguageViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 30/04/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit



class LanguageViewController: UIViewController {

    @IBOutlet var languageButtonsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in languageButtonsCollection {
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = button.bounds.size.height * 0.1
            button.clipsToBounds = true
            
        }
        
    
    
        // Do any additional setup after loading the view.
    }
   
    deinit {
        languageButtonsCollection.removeAll()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
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
