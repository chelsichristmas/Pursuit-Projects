//
//  DetailViewController.swift
//  Rick_And_Morty
//
//  Created by Chelsi Christmas on 1/10/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var character: Results?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        
        nameLabel.text = "Name: \(character!.name)"
        speciesLabel.text = "Species: \(character!.species)"
        statusLabel.text = "Status: \(character!.status)"
    }
    
    guard let characterImage = character!.image else {
    fatalError("Unable to acces picture of character")
    }
    func getPicture() {
        characterImage.getImage(with: characterImage, completion: <#T##(Result<UIImage, AppError>) -> ()#>)
    }
    
}
