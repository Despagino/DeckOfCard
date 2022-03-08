//
//  CardData.swift
//  DeckOfCard
//
//  Created by Gino Tasis on 3/8/22.
//

import Foundation

struct CardData: Codable {
    
    let cards: [Cards]
    
}

struct Cards: Codable {
    
    let image: String
    let value: String
    let suit: String
    
}
