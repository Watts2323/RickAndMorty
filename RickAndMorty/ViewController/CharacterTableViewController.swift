//
//  CharacterTableViewController.swift
//  RickAndMorty
//
//  Created by Xavier on 10/24/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)

        // Configure the cell...

        return cell
    }
}
