//
//  CharacterController.swift
//  RickAndMorty
//
//  Created by Xavier on 10/24/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class CharacterController {
    
    static let baseURL = URL(string: "https://rickandmortyapi.com/api")
    
    static func fetchCharacters(id: String, name: String, completion: @escaping ([Character]?) -> Void) {
        
        // Step 1 - Construct URL
        guard var baseURL = baseURL else { completion(nil); return}
        baseURL.appendPathComponent("character")
        baseURL.appendPathComponent("id")
        
        //Step 3
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            do{
                guard let jsonDictionaries = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String : Any]] else { completion(nil); return}
                
                var characters: [Character] = []
                
                for JSONDictionary in jsonDictionaries {
                    guard let character = Character(dictionary: JSONDictionary) else { completion(nil); return}
                    characters.append(character)
                }
                completion(characters)
            }catch {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(nil); return
            }
        }.resume()
    }
    
    static func fetchImages(for character: Character, completion: @escaping (UIImage?) -> Void) {
        
        //Step 1 - Constrcut URL
        guard let imageURLAsString = character.imageURLAsString,
            let url = URL(string: imageURLAsString) else { completion(nil); return}
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(nil) ; return
            }
            guard let data = data else { completion(nil); return}
            let image = UIImage(data: data)
            completion(image)
        }.resume()
        
    }
}
