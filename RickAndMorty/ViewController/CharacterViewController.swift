//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Xavier on 10/24/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
    }
    
//    //MARK: - Landing Pad!
//    var character: Character? {
//        didSet{
//            updateViews(character: character)
//        }
//    }
//
//    var characterImage: UIImage? {
//        didSet{
//            updateViews(characterImage: characterImage)
//        }
//    }
    
//    func updateViews(character: Character? = nil, characterImage: UIImage? = nil) {
//        DispatchQueue.main.async {
//            if let character = character {
//                self.nameLabel.text = character.name
//                self.statusLabel.text = character.status
//            } else if let characterImage = characterImage {
//                self.characterImageView.image = characterImage
//            }
//        }
//    }
}
extension CharacterViewController {
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return}
        print("Searchbar was clicked")
        searchBar.resignFirstResponder()
        
        CharacterController.fetchCharacters(by: searchText) { (character) in
            
            if character != nil {
                print("Are you on the main thread \(Thread.isMainThread)")
                guard let character = character else { return}
                DispatchQueue.main.async {
                    searchBar.text = ""
                    self.nameLabel.text = character.name
                    self.statusLabel.text = character.status
                }
                
                CharacterController.fetchImages(for: character, completion: { (image) in
                    DispatchQueue.main.async {
                        self.characterImageView.image = image
                    }
                })
            }
        }
    }
}






//class CharacterTableViewController: UITableViewController {
//
//    @IBOutlet weak var searchbar: UISearchBar!
//
//    var characters: [Character] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        searchbar.delegate = self
//    }
//
//    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return characters.count
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 250
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell()}
//
//        let rickAndMorty = characters[indexPath.row]
//        cell.character = rickAndMorty
//
//        CharacterController.fetchImages(for: rickAndMorty) { (characterImage) in
//            if let characterImage = characterImage {
//                cell.characterImage = characterImage
//            }
//        }
//
//        return cell
//    }
//}
//
//extension CharacterTableViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchbar.text, !searchText.isEmpty else { return}
//        print("Searchbar was clicked")
//        searchbar.text = ""
//        searchbar.resignFirstResponder()
//        CharacterController.fetchCharacters(by: searchText) { (characters) in
//            guard let characters = characters else { return}
//
//            self.characters = characters
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
//}
//
//
//
//
//
////stuff that was in the cell
//
////MARK: - OUTLETS
//@IBOutlet weak var characterImageView: UIImageView!
//@IBOutlet weak var nameLabel: UILabel!
//@IBOutlet weak var statusLabel: UILabel!
//
////MARK: - Landing Pad!
//var character: Character? {
//    didSet{
//        updateViews(character: character)
//    }
//}
//
//var characterImage: UIImage? {
//    didSet{
//        updateViews(characterImage: characterImage)
//    }
//}
//
//func updateViews(character: Character? = nil, characterImage: UIImage? = nil) {
//    DispatchQueue.main.async {
//        if let character = character {
//            self.nameLabel.text = character.name
//            self.statusLabel.text = character.status
//        } else if let characterImage = characterImage {
//            self.characterImageView.image = characterImage
//        }
//    }
//}
//}
//
//extension CharacterTableViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchbar.text, !searchText.isEmpty else { return}
//        print("Searchbar was clicked")
//        searchbar.text = ""
//        searchbar.resignFirstResponder()
//        CharacterController.fetchCharacters(by: searchText) { (characters) in
//            guard let characters = characters else { return}
//
//            self.characters = characters
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
//}

