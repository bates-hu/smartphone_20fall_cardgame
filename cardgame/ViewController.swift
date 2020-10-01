//
//  ViewController.swift
//  cardgame
//
//  Created by 胡秉诚 on 9/30/20.
//

import UIKit

class ViewController: UIViewController {
    let cards = ["AC", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "JC", "QC", "KC",
         "AD", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "JD", "QD", "KD",
         "AH", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "JH", "QH", "KH",
         "AS", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "JS", "QS", "KS"]
    let back = "blue_back"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    
    @IBOutlet weak var card4: UIImageView!
    
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func playButton(_ sender: Any) {
        let choosedCards = self.getRandomCards()
        
        card1.image = UIImage(named: choosedCards[0])
        card2.image = UIImage(named: choosedCards[1])
        card3.image = UIImage(named: choosedCards[2])
        
        card4.image = UIImage(named: choosedCards[3])
        card5.image = UIImage(named: choosedCards[4])
        card6.image = UIImage(named: choosedCards[5])
        
        if choosedCards[0] == "AS" || choosedCards[1] == "AS" || choosedCards[2] == "AS" {
            let msg = "player 1 win"
            self.resultLabel.text = msg
            self.gamover(msg: msg)
        } else if choosedCards[3] == "AS" || choosedCards[4] == "AS" || choosedCards[5] == "AS" {
            let msg = "player 2 win"
            self.resultLabel.text = msg
            self.gamover(msg: msg)
        }
    }
    
    func getRandomCards() -> Array<String> {
        let shuffledCards = self.cards.shuffled()
        return Array(shuffledCards.prefix(6))
    }
    
    func gamover(msg: String) {
        let alert = UIAlertController(title: "Play Again?", message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "YES", style: .default, handler: {_ in
            self.reset()
        })
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func reset() {
        card1.image = UIImage(named: self.back)
        card2.image = UIImage(named: self.back)
        card3.image = UIImage(named: self.back)
        card4.image = UIImage(named: self.back)
        card5.image = UIImage(named: self.back)
        card6.image = UIImage(named: self.back)
        self.resultLabel.text = "No Winner"
    }

}

