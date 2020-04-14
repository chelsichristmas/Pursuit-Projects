//
//  ViewController.swift
//  Podcasts-Review
//
//  Created by Chelsi Christmas on 12/18/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {
    
    var podcasts = [PodcastInfo]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchPodcasts(searchQuery: "love")
        dump(podcasts)
        
    }
    
    func searchPodcasts(searchQuery: String) {
        PodcastAPIClient.getPodcasts(for: searchQuery, completion: { (result) in
            switch result {
            case .failure(let appError):
                print("error \(appError)")
            case .success(let podcasts):
                self.podcasts = podcasts
            }
        })
    
    
}

   

}

extension PodcastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        podcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell (withIdentifier: "podcastCell", for: indexPath) as? PodcastCell else {
            fatalError("Unable to deque PodcastCell")
        }
        let podcast = podcasts[indexPath.row]
        cell.configureCell(for: podcast)
        
        return cell
    }
}

extension PodcastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}


extension PodcastViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            print("Missing search text")
            return
        }
        searchPodcasts(searchQuery: searchText)
        resignFirstResponder()
    }
}

