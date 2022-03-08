//
//  CardViewController.swift
//  DeckOfCard
//
//  Created by Gino Tasis on 3/8/22.
//

import UIKit

class CardViewController: UIViewController {

    var cardManager = CardManager()
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func drawButtonPressed(_ sender: UIButton) {
        cardManager.getOneCard()
    }
    
}
