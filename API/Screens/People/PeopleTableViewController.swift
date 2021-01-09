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
        
        setupTableCell()
        
        fetchData()
    }
    
    private func fetchData() {
        PeopleManager.shared.fetchPeople(byPage: 1) { [unowned self] (resultsModel: [PeopleResult]?) in
            guard let peopleModels = resultsModel else {
                return
            }
            
            for model in peopleModels {
                addOrUpdateDataToDatabase(with: model)
            }
            
            let realmPeople: [PeopleRealmModel] = DatabaseManager.shared.fetch()
            let people: [PeopleResult] = realmPeople.map { PeopleResult(realmModel: $0) }

            self.people = people
            self.tableView.reloadData()
        }
    }
    
    private func addOrUpdateDataToDatabase(with model: PeopleResult) {
        let peopleRealmModel: PeopleRealmModel = {
            let realmModel = PeopleRealmModel()
            
            realmModel.name = model.name ?? ""
            realmModel.height = model.height ?? ""
            realmModel.mass = model.mass ?? ""
            realmModel.hairColor = model.hairColor ?? ""
            realmModel.skinColor = model.skinColor ?? ""
            realmModel.eyeColor = model.eyeColor ?? ""
            realmModel.birthYear = model.birthYear ?? ""
            realmModel.gender = model.gender ?? ""
            realmModel.homeworld = model.homeworld ?? ""
            realmModel.created = model.created ?? ""
            realmModel.edited = model.edited ?? ""
            realmModel.url = model.url ?? ""
            
            return realmModel
        }()
        
        DatabaseManager.shared.add(peopleRealmModel)
    }
    
    private func setupTableCell() {
        tableView.register(PeopleTableViewCell.nib, forCellReuseIdentifier: PeopleTableViewCell.cellId)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTableViewCell.cellId, for: indexPath) as? PeopleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: people[indexPath.row])
        
        return cell
    }
}
