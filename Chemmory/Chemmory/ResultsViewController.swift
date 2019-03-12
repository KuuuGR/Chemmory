//
//  ResultViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 09/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var resultButtonView: UIView!
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        backAction()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButtonViewConfig()
        
        // TODO: Get time of solving puzzles (start time - end time). 
        
        
        // Add result to database
        
        
        /*let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        try! realm.write {
        }*/
        
        
        //let results = realm.objects(Results.self).filter("color = 'Orange'")
        //let results1 = realm.objects(Cat.self).sorted(by: "")
        //print(results[1].name ?? "Niema")
        //print(results.count)
/*        var myCat = Cat()
        myCat.name = "Joe"
        myCat.gender = "Male"
        myCat.color = "Orange"
        
        try! realm.write {
            realm.add(myCat)
        } */
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func backAction(){
        //print("Back Button Clicked")
        self.dismiss(animated: true, completion: nil)
    }
    
    func resultButtonViewConfig(){
        self.resultButtonView.alpha = 0.9
        self.resultButtonView.backgroundColor = UIColor.white
        self.resultButtonView.layer.cornerRadius = 16.0
        self.resultButtonView.clipsToBounds = false
        self.resultButtonView.layer.borderWidth = 8
        self.resultButtonView.layer.borderColor = UIColor.black.cgColor
        
        self.resultButtonView.layer.shadowColor = UIColor.yellow.cgColor
        self.resultButtonView.layer.shadowOpacity = 1.9
        self.resultButtonView.layer.shadowOffset = CGSize.zero
        self.resultButtonView.layer.shadowRadius = 22
    }
    
}  // End ResoultViewController class

