//
//  CardManager.swift
//  DeckOfCard
//
//  Created by Gino Tasis on 3/8/22.
//

import Foundation

struct CardManager {
    
    let baseURL = "https://deckofcardsapi.com/api/deck/new/draw/?count=1"
    
    func getOneCard() {
        
        // setting up URL
        let urlString = "\(baseURL)"
        
        if let url = URL(string: urlString) {
            
            //create session object
            let session = URLSession(configuration: .default)
            
        }
        
    }
    
}
