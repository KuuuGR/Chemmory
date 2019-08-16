//
//  TowerGameViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 14/08/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class TowerGameViewController: UIViewController {

    var picNumber = 0
    @IBOutlet weak var towerImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareButtons()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func button5of5tapped(_ sender: UIButton) {
        let imageName = "puzzle" + String(picNumber) + ".png"
        towerImageView.image = UIImage(named: imageName)
        picNumber += 1
    }
    
    @IBAction func answerButtoTapped(_ sender: UIButton) {
        
    }
    
    
    func prepareButtons(){
        // round corners in image of the tower
        towerImageView.layer.cornerRadius = 16.0
        towerImageView.clipsToBounds = true
        
        // round corners and prepare answer buttons
        for button in answerButons {
            button.backgroundColor = .clear
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
        }
        
        // round corners question laber
        questionLabel.layer.cornerRadius = 15
        questionLabel.layer.borderColor = UIColor.white.cgColor
        questionLabel.layer.borderWidth = 3
        questionLabel.layer.masksToBounds = true
        
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
