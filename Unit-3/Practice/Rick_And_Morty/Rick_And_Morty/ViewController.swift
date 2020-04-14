//
//  ViewController.swift
//  Rick_And_Morty
//
//  Created by Chelsi Christmas on 1/10/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var characters = [Results](){
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       getCharacters()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow  else {
            fatalError("Unable to segue")
        }
        
        
        let character = characters[indexPath.row]
        detailViewController.character = character
                
    }
    
    


    func getCharacters() {
        CurrencySearchAPI.fetchInfo( completion: { (result) in
            switch result{
            case .failure(let appError):
                print("error \(appError)")
            case .success(let characters):
                DispatchQueue.main.async {
                    self.characters = characters
                    print(characters)
                }
            }
            
        })
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell else {
            fatalError("Unable to dequeue Character Cell")
        }

        
        let character = characters[indexPath.row]
        
        cell.configureCell(for: character)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

