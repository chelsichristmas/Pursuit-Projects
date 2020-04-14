//
//  UsersViewController.swift
//  number-Facts
//
//  Created by Chelsi Christmas on 4/8/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    private var users = [User]() {
        didSet {
            tableView.reloadData()
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
configureTableView()

        
    }
    
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func fetchUsers() {
        users = CoreDataManager.shared.fetchUsers()
    }
    // get a reference to the CreateUserViewCOntroller

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createUserSegue" {
            guard let createUserVC = segue.destination as? CreateUsersViewController else {
                fatalError("could not segue to Create Users View COntroller")
            }
            createUserVC.delegate = self
        }
    }

}

extension UsersViewController: UITableViewDataSource {
    // numberofrows in section
    // return users.count
    
    // cellfor row at
    // let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
    // let user = users[indexPath.row]
    // cell.textLabel?.text = user.name
    // return cell
}


extension UsersViewController: UITableViewDelegate {
    // segue to post vc and show only users posts
    
    func didCreateUser(_ CreateUsersViewController: CreateUsersViewController, user: User) {
        users.append(user) // will append user ro users array
    }
}
