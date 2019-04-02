//
//  MainViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 27/02/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startGameLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.backgroundColor = UIColor.red.cgColor
        startButton.layer.cornerRadius = 60 //40//startButton.bounds.size.height * 0.55
        
        startButton.layer.borderWidth = 8
        startButton.layer.borderColor = UIColor.white.cgColor
        startGameLabel.textColor = UIColor.yellow
    }

}

