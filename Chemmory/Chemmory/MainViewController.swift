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

    @IBOutlet weak var c_cardButton: UIButton!
    @IBOutlet weak var he_cardButton: UIButton!
    @IBOutlet weak var m_CardButton: UIButton!
    @IBOutlet weak var mo_cardButton: UIButton!
    @IBOutlet weak var r_cardButton: UIButton!
    @IBOutlet weak var y_cardButton: UIButton!
    @IBOutlet weak var left_cardButton: UIButton!
    @IBOutlet weak var right_cardButton: UIButton!
    @IBOutlet weak var bottom_cardButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButton(button: c_cardButton)
        prepareButton(button: he_cardButton)
        prepareButton(button: m_CardButton)
        prepareButton(button: mo_cardButton)
        prepareButton(button: r_cardButton)
        prepareButton(button: y_cardButton)
        prepareButton(button: left_cardButton)
        prepareButton(button: right_cardButton)
        prepareButton(button: bottom_cardButton)

        startButton.layer.backgroundColor = UIColor.red.cgColor
        startButton.layer.cornerRadius = 60 //40//startButton.bounds.size.height * 0.55
        
        startButton.layer.borderWidth = 8
        startButton.layer.borderColor = UIColor.white.cgColor
        startGameLabel.textColor = UIColor.yellow
    }

    func prepareButton(button: UIButton) {
        button.layer.backgroundColor = UIColor.red.cgColor
        button.layer.cornerRadius = button.bounds.size.height * 0.1
        button.alpha = 0.1
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
    }
    
}

