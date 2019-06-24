//
//  TableViewController.swift
//  DemoAPISimple
//
//  Created by Hoàng Anh on 6/24/19.
//  Copyright © 2019 Hoàng Anh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var dataCategory = [RingTone]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataFromAPI()
    }
    
    func setDataFromAPI() {
        DataService.sharedInstance.getCategoryMusic { data in
            self.dataCategory = data
            print(self.dataCategory.count)
            self.tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCategory.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.idLabel.text = String(dataCategory[indexPath.row].id)
        cell.artistLabel.text = dataCategory[indexPath.row].artist
        cell.genreLabel.text = dataCategory[indexPath.row].genre
        cell.durationLabel.text = String(dataCategory[indexPath.row].duration)
        cell.titleLabel.text = dataCategory[indexPath.row].title
        
        return cell
    }


}
