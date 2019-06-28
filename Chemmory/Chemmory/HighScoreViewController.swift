//
//  HighScoreViewController.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 28/06/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import UIKit






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
        return animalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath)
        
        var textForCell = ""
        textForCell.append(String(indexPath.row))
        textForCell.append(" ")
        textForCell.append(animalArray[indexPath.row])
        cell.textLabel!.text = textForCell
        return cell
    }
}
