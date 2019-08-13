//
//  HighScoreViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 28/06/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit
import RealmSwift


class HighScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var highScoreTableView: UITableView!
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        highScoreTableView.dataSource = self
        highScoreTableView.delegate = self
    }

    // MARK: - TABLEVIEW DELEGATE & DATASOURCE
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return as many records as elements in Realm
        let realm = try! Realm()
        let grabResults = realm.objects(Result.self).sorted(byKeyPath: "score", ascending: false)
        return grabResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath)
        
        // prepare text for cell
        let realm = try! Realm()
        let grabResults = realm.objects(Result.self).sorted(byKeyPath: "score", ascending: false)
        
        let positionStr = String(indexPath.row + 1)
        let nameStr = grabResults[indexPath.row].name ?? "noname"
        
        let timeStr = String(format: "%.0f", grabResults[indexPath.row].time)
        let dayStr = grabResults[indexPath.row].date ?? "noday"
        
        let scoreStr = String(format: "%.0f", grabResults[indexPath.row].score)
        let hintStr = hintToSymbol(grabResults[indexPath.row].hint ?? "unknown hint")
        
        let fontSize = returnFontSize()
        
        let attributedString = NSMutableAttributedString(string: "",
                                                  attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                                              NSAttributedString.Key.font: UIFont(name: "Arial", size: fontSize) as Any])
        
        let attStr01 = NSMutableAttributedString(string: "\(positionStr). ",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray,
                        NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: fontSize) as Any])
        attributedString.append(attStr01)
        
        let attStr03 = NSMutableAttributedString(string: "\(nameStr) ",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,
                        NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: fontSize) as Any])
        attributedString.append(attStr03)
        
        let attStr04 = NSMutableAttributedString(string: "score: ".localized,
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: fontSize) as Any])
        attributedString.append(attStr04)
        
        let attStr05 = NSMutableAttributedString(string: "\(scoreStr) pts. ",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,
                        NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: fontSize) as Any])
        attributedString.append(attStr05)
        
        let attStr06 = NSMutableAttributedString(string: "time: ".localized,
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: fontSize) as Any])
        attributedString.append(attStr06)
        
        let attStr07 = NSMutableAttributedString(string: "\(timeStr) s ",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,
                        NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: fontSize) as Any])
        attributedString.append(attStr07)
        
        let attStr08 = NSMutableAttributedString(string: "\nhint: ".localized,
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: fontSize) as Any])
        attributedString.append(attStr08)
        
        let attStr09 = NSMutableAttributedString(string: "\(hintStr) ",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 2 * fontSize) as Any])
        attributedString.append(attStr09)
        
        let attStr10 = NSMutableAttributedString(string: "played on: ".localized,
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: fontSize) as Any])
        attributedString.append(attStr10)
        
        let attStr11 = NSMutableAttributedString(string: "\(dayStr) ",
                                                 attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray,
                                                             NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: fontSize) as Any])
        attributedString.append(attStr11)
        
        cell.textLabel!.attributedText = attributedString
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func hintToSymbol(_ hint: String) -> String {
        
        switch hint {
        case "mass":
            return "🐘"
        //return "M"
        case "number":
            return "🐠"
        //return "N"
        case "valence":
            return "🐉"
        //return "V"
        case "name":
            return "🐓"
        //return "n"
        case "symbol":
            return "🐬"
        //return " "
        default:
            return "🐛"
        }
        
    }
    
    func returnFontSize() -> CGFloat {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        // for iPhone X
        if (width == 812 && height == 375) {
            return 14 as CGFloat
        }
        // other iPhones
        return ((18 * width)/667) as CGFloat
        
    }
    
}
