//
//  PeopleTableViewController.swift
//  API
//
//  Created by Алик on 24.12.2020.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    let items = ["Item 1", "Item2", "Item3", "Item4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .yellow
        tableView.register(PeopleTableViewCell.nib, forCellReuseIdentifier: PeopleTableViewCell.cellId)
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTableViewCell.cellId, for: indexPath) as? PeopleTableViewCell else {
            return UITableViewCell()
        }

        cell.nameLabel.text = items[indexPath.row]
        
        return cell
    }
}
