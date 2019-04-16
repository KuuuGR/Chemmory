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
    @IBOutlet weak var backgroundOptionsCardImage: UIImageView!
    @IBOutlet weak var fontOptionsCardImage: UIImageView!
    @IBOutlet var fontOptionsLabelsCollection: [UILabel]!
    
    @IBOutlet weak var fontRZipper: UISlider!
    @IBOutlet weak var fontGZipper: UISlider!
    @IBOutlet weak var fontBZipper: UISlider!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
        backgroundNumber.text = String(backgroundPictureNumber)

    }
    
    //Background Options
    
    @IBAction func dcsImageNrButtonTapped(_ sender: UIButton) {
        changeCardBackPicture(increasing: false)
    }
    
    @IBAction func incImageNrButtonTapped(_ sender: Any) {
        changeCardBackPicture(increasing: true)
    }
    
    //Fonts Options
    
    @IBAction func fontRZipperAction(_ sender: Any) {
        setFontsColor()
        takeActualFontColor()
    }
    @IBAction func fontGZipperAction(_ sender: Any) {
        setFontsColor()
        takeActualFontColor()
    }
    
    @IBAction func fontBZipperAction(_ sender: Any) {
        setFontsColor()
        takeActualFontColor()
    }
    
    
    //Save Options
    
    @IBAction func saveAndQuit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    
    func changeCardBackPicture(increasing: Bool) {
        
        if (backgroundPictureNumber < 101), increasing  {
            backgroundPictureNumber += 1
        } else if (backgroundPictureNumber > 0 ), !increasing {
            backgroundPictureNumber -= 1
        }
        backgroundOptionsCardImage.image = UIImage(named: "CardBack\(backgroundPictureNumber)")
        backgroundNumber.text = String(backgroundPictureNumber)
        fontOptionsCardImage.image = backgroundOptionsCardImage.image
    }

    func setFontsColor(){
        for element in fontOptionsLabelsCollection {
            element.textColor = UIColor(red: CGFloat(fontRZipper.value/255), green: CGFloat(fontGZipper.value/255), blue: CGFloat(fontBZipper.value/255), alpha: 1.0)
        }
    }
    
    func takeActualFontColor(){
        cardFontsColor[0] = fontRZipper.value/255
        cardFontsColor[1] = fontGZipper.value/255
        cardFontsColor[2] = fontBZipper.value/255
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


