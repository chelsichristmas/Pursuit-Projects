//
//  CharacterTableViewCell.swift
//  Rick_And_Morty
//
//  Created by Chelsi Christmas on 1/10/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIView!

    func configureCell(for character: Results) {
        nameLabel.text = character.name
        
       }

}
