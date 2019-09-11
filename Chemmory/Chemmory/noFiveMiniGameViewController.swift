//
//  noFiveMiniGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 11/09/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class noFiveMiniGameViewController: UIViewController {

    @IBOutlet weak var centralSaveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButton(centralSaveButton)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func centralSaveButton(_ sender: UIButton) {
        SoundManager.playSound(.up)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func prepareButton(_ button: UIButton){
        
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitleColor(.white, for: .normal)
       
    }


}
