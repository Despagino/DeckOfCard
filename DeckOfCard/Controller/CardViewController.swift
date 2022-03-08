//
//  CardViewController.swift
//  DeckOfCard
//
//  Created by Gino Tasis on 3/8/22.
//

import UIKit

class CardViewController: UIViewController, CardManagerDelegate {
   
    var cardManager = CardManager()
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardManager.delegate = self
    }

    @IBAction func drawButtonPressed(_ sender: UIButton) {
        cardManager.getOneCard()
    }

    func didUpdateCard(_ cardManager: CardManager, card: CardModel) {
        DispatchQueue.main.async {
            self.name.text = "\(card.value) of \(card.suit)"
        }
    }
}
