//
//  CardManager.swift
//  DeckOfCard
//
//  Created by Gino Tasis on 3/8/22.
//

import Foundation

protocol CardManagerDelegate {
    
    func didUpdateCard(_ cardManager: CardManager, card: CardModel)
    
}

struct CardManager {
    
    let baseURL = "https://deckofcardsapi.com/api/deck/new/draw/?count=1"
    
    var delegate: CardManagerDelegate?
    
    // MARK: - Calling to the API
    
    func getOneCard() {
        
        // setting up URL
        let urlString = "\(baseURL)"
        
        if let url = URL(string: urlString) {
            
            //create session object
            let session = URLSession(configuration: .default)
            
            // create new task
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                //format the data we get back
                if let safeData = data {
                    if let card = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCard(self, card: card)
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: - parsing the data we get
    
    func parseJSON(_ data: Data) -> CardModel? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CardData.self, from: data)
            
            let cardImage = decodedData.cards[0].image
            let suit = decodedData.cards[0].suit
            let value = decodedData.cards[0].value
            
            let card = CardModel(cardImage: cardImage, suit: suit, value: value)
            return card
        }
        catch {
            print(error)
            return nil
        }
    }
}
