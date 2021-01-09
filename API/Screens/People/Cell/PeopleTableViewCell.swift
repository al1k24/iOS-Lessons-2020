//
//  PeopleTableViewCell.swift
//  API
//
//  Created by Алик on 24.12.2020.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!

    // Set the identifier for the custom cell
    static let cellId = "peopleCellId"
    
    // Returning the xib file after instantiating it
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: PeopleResult) {
        nameLabel.text = model.name
    }
    
}
