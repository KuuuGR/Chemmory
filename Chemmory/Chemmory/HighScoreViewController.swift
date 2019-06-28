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
    
    let animalArray = ["kot", "pies", "krowa", "owca","kot", "pies", "krowa", "owca"]
    
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
        var textForCell = ""
        
        let positionStr = String(indexPath.row + 1)
        let nameStr = grabResults[indexPath.row].name ?? "noname"
        
        let timeStr = String(grabResults[indexPath.row].time)
        let dayStr = grabResults[indexPath.row].date ?? "noday"
        
        let scoreStr = String(grabResults[indexPath.row].score)
        let hintStr = grabResults[indexPath.row].hint ?? "unknown hint"
        
        //TODO: make score and time aproximate, make hint as a Emoji, add tekst hint:, time:, date,
        // add localized names
        
        textForCell.append("\(positionStr). \(nameStr) \(timeStr) \(dayStr) \(scoreStr) \(hintStr)")
        
        cell.textLabel!.text = textForCell
        
        return cell
    }
}
