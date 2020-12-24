//
//  PeopleTableViewController.swift
//  API
//
//  Created by Алик on 24.12.2020.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    private var people = [PeopleResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PeopleManager.shared.fetchPeople(byPage: 1) { [unowned self] (model: [PeopleResult]?) in
            guard let people = model else {
                return
            }
            
            self.people = people
            self.tableView.reloadData()
        }
        
        tableView.register(PeopleTableViewCell.nib, forCellReuseIdentifier: PeopleTableViewCell.cellId)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTableViewCell.cellId, for: indexPath) as? PeopleTableViewCell, let name = people[indexPath.row].name else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = name
        
        return cell
    }
}
