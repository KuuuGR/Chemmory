//
//  ResultViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 09/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift

class ResultsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultButtonView: UIView!
    @IBOutlet weak var inputUserNameTextField: UITextField!
    @IBOutlet weak var textFieldTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var scoreTextLabel: UILabel!
    @IBOutlet weak var firstPlaceHighScoreLabel: UILabel!
    @IBOutlet weak var firstPlaceScoreValueLabel: UILabel!
    @IBOutlet weak var secondPlaceHighScoreLabel: UILabel!
    @IBOutlet weak var secondPlaceScoreValueLabel: UILabel!
    @IBOutlet weak var thirdPlaceHighScoreLabel: UILabel!
    @IBOutlet weak var thirdPlaceScoreValueLabel: UILabel!
   
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passSwitch1: UISwitch!
    @IBOutlet weak var passSwitch2: UISwitch!
    @IBOutlet weak var passSwitch3: UISwitch!
    @IBOutlet weak var passSwitch4: UISwitch!
    @IBOutlet weak var passSwitch5: UISwitch!
    @IBOutlet weak var passSwitch6: UISwitch!
    
    var winGameResultsData  = ("","","")
    var myName = ""
    var myResult = Result()
    
    weak var delegate: GameResultDelegate?
    
    @IBAction func backButtonPressed(_ sender: Any) {
        backAction()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        passwordView.isHidden = false
        preparePasswordField()
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll()
            }
            //backAction()
        
    }
    
    @IBAction func typingUserNameTextField(_ sender: Any) {
        // get user name and show save button
        saveButton.alpha = 1
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // save tepped name and game result and block to save result as another person
        if myResult.name?.count != 0 && saveButton.alpha == 1 {
            saveResultToDatabase()
            inputUserNameTextField.isUserInteractionEnabled = false
            saveButton.alpha = 0.1
            //update result HighSore
            showRecordResults()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputUserNameTextField.delegate = self
        resultButtonViewConfig()
        
        // show High Score
        showRecordResults()
        
        // show segue from GameVC
        print(winGameResultsData)
        
        // Show Keyboard with text field go up animation
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //Hide keyboard when tap elsewhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ResultsViewController.dismissKeyboard))
            self.view.addGestureRecognizer(tap)
        
   
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
        passwordView.isHidden = true
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
    
    // Animate textfield if Keyboard appears
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
    // hide keyboard when pressed return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.inputUserNameTextField.alpha = 0.5
        self.textFieldTopConstraint.constant = 12
        return (true)
    }
    @objc func dismissKeyboard() {
        self.inputUserNameTextField.alpha = 0.5
        self.textFieldTopConstraint.constant = 12
        view.endEditing(true)
    }
    
    func saveResultToDatabase() {
       
        let userName = inputUserNameTextField.text ?? "no Name"
        let gameDate = winGameResultsData.0
        let gameTime = Float(winGameResultsData.1) ?? 999.9
        let gameMisses = Float(winGameResultsData.2) ?? 999.9
        // First way
        myResult.name = userName
        myResult.date = gameDate
        myResult.time = Float(gameTime)
        myResult.misses = Int(gameMisses)
        
        // score = 10000/(gameTime * (gameMisses+1))
        let gameScore = 10000/(gameTime * (gameMisses+1.0))
        myResult.score = gameScore
        
        // Add result to database
        let realm = try! Realm()
        try! realm.write {
            realm.add(myResult)
        }
        print("Realm save youre record at: ")
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
    }
    
    func showRecordResults() {
        
        // get results from dataBase and show in scren
        
        let realm = try! Realm()
        
        let grabReluts = realm.objects(Result.self).sorted(byKeyPath: "score", ascending: false)
        
        if grabReluts.count >= 1 {
            let firstName = grabReluts[0].name ?? "no Name"
            let firstScore = String(format: "%.0f",grabReluts[0].score)
            let firstDate = grabReluts[0].date ?? "no Date"
            let firstTime = String(format: "%.1f",grabReluts[0].time)
        
            if grabReluts.count >= 2 {
                let secondName = grabReluts[1].name ?? "no Name"
                let secondScore = String(format: "%.0f",grabReluts[1].score)
                let secondDate = grabReluts[1].date ?? "no Date"
                let secondTime = String(format: "%.1f",grabReluts[1].time)
            
                if grabReluts.count >= 3 {
                    let thirdName = grabReluts[2].name ?? "no Name"
                    let thirdScore = String(format: "%.0f",grabReluts[2].score)
                    let thirdDate = grabReluts[2].date ?? "no Date"
                    let thirdTime = String(format: "%.1f",grabReluts[2].time)

                    thirdPlaceHighScoreLabel.text = ("\(thirdName)\ntime: \(thirdTime) s\nday: \(thirdDate)")
                    thirdPlaceScoreValueLabel.text = "\(thirdScore)"
                }
                secondPlaceHighScoreLabel.text = ("\(secondName)\ntime: \(secondTime) s\nday: \(secondDate)")
                secondPlaceScoreValueLabel.text = "\(secondScore)"
            }
            firstPlaceHighScoreLabel.text = ("\(firstName)\ntime: \(firstTime) s\nday: \(firstDate)")
            firstPlaceScoreValueLabel.text = "\(firstScore)"
        }
        
    }
 
    func preparePasswordField() {
        passwordView.backgroundColor = UIColor.gray
        passwordView.layer.cornerRadius = 6
        passwordView.layer.masksToBounds = true
        let xScale = CGFloat(0.5)
        let yScale = CGFloat(0.5)
        passSwitch1.onTintColor = UIColor.blue
        passSwitch1.transform = CGAffineTransform(scaleX: xScale, y: yScale)
        passSwitch2.transform = CGAffineTransform(scaleX: xScale, y: yScale)
        passSwitch3.transform = CGAffineTransform(scaleX: xScale, y: yScale)
        passSwitch4.transform = CGAffineTransform(scaleX: xScale, y: yScale)
        passSwitch5.transform = CGAffineTransform(scaleX: xScale, y: yScale)
        passSwitch6.transform = CGAffineTransform(scaleX: xScale, y: yScale)
        
        //some fun element
        if passSwitch1.isOn == false {
            passSwitch3.onTintColor = UIColor.red
            if passSwitch2.isOn == false {
                passSwitch2.onTintColor = UIColor.yellow
                passSwitch6.onTintColor = UIColor.magenta
                if passSwitch4.isOn == false {
                    passSwitch5.onTintColor = UIColor.green
                    passSwitch4.onTintColor = UIColor.orange
                }
            }
        }
        
        print("\(passSwitch1.isOn) \(passSwitch2.isOn) \(passSwitch3.isOn) \(passSwitch4.isOn) \(passSwitch5.isOn) \(passSwitch6.isOn)" )
    }
    
    
}  // End ResoultViewController class
