//
//  GroupTableViewCell.swift
//  Pair Randomizer
//
//  Created by Eva Marie Bresciano on 7/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
       @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithPerson(person: Person) {
        nameLabel.text = person.name
    }
    
   
}


