//
//  ResultViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 09/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift

struct Points {
    let value: Int
}

class ResultsViewController: UIViewController, UITextFieldDelegate {

    
    weak var delegate: GameResultDelegate?
    
    var points: Points?
    
    @IBOutlet weak var resultButtonView: UIView!
    @IBOutlet weak var inputUserNameTextField: UITextField!
    @IBOutlet weak var textFieldTopConstraint: NSLayoutConstraint!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        backAction()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        print ("reset")
    }
    
    @IBAction func typingUserNameTextField(_ sender: Any) {
        print ("type tye type: \(inputUserNameTextField.text!) !!")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButtonViewConfig()
        
        inputUserNameTextField.delegate=self

        
        // Show Keyboard with text field go up animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            //UIApplication.keyboardWillChangeFrameNotification, object: nil)
    
        //Hide keyboard when tap elsewhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ResultsViewController.dismissKeyboard))
            self.view.addGestureRecognizer(tap)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Moje punkty: \(points?.value ?? 0)")
        
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
        delegate?.backFromResult(transferredDataToGameVC: "Z widoku punktów")
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let info = notification.userInfo {
            
            let rect:CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            
            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.25, animations: {
                
                self.view.layoutIfNeeded()
                self.textFieldTopConstraint.constant = 1 - rect.height
                self.inputUserNameTextField.alpha = 1
                })
            
        }
    }
    
    @objc func dismissKeyboard() {

                self.inputUserNameTextField.alpha = 0.5
                self.textFieldTopConstraint.constant = 12
        
        view.endEditing(true)
    }
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        performAction()
        return true;
    }
    
    func performAction(){
        print("lolo")
        //execute code for your action inside this function
        
    }
    
    
}  // End ResoultViewController class
