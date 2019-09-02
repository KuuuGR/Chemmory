//
//  RadioactiveGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 02/09/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class RadioactiveGameViewController: UIViewController {

    @IBOutlet weak var elementBackgroundView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMainElement()
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    func prepareMainElement(){
        elementBackgroundView.layer.cornerRadius = 15.0
        elementBackgroundView.layer.borderColor = UIColor.white.cgColor
        elementBackgroundView.layer.borderWidth = 5
        elementBackgroundView.backgroundColor = .black
        elementBackgroundView.clipsToBounds = true
    }

}


