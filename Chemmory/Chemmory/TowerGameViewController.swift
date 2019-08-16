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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        SoundManager.playSound(.back)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func button5of5tapped(_ sender: UIButton) {
        let imageName = "puzzle" + String(picNumber) + ".png"
        towerImageView.image = UIImage(named: imageName)
        //towerImageView.image = UIImage(contentsOfFile: imageName)
        picNumber += 1
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
