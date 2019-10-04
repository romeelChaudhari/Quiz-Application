import UIKit

class DeckOfCards {

    private var cards: [FlashCard] = [
        FlashCard(withPrompt: "The best synonym for provoke:", andSolution: "make angry"),
        FlashCard(withPrompt: "Which suffix means "the quality or state of"?", andSolution: "ence")
    ]

    private var counter: Int = 0

    func currentCard() -> FlashCard? {
        if counter < cards.count {
            return cards[counter]
        } else {
            return nil
        }
    }

    func evaluate(submission: String) -> Bool {
        // we use guard let to unwrap the optional
        // we could have used an if let block
        guard let card = currentCard() else {
            return false
        }
        if card.evaluate(submission: submission) {
            counter += 1
            return true
        } else {
            return false
        }
    }
}

class MainScreenViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!

    let deck = DeckOfCards()

    override func viewDidLoad() {
        super.viewDidLoad()
        let prompt: String? = deck.currentCard()?.prompt
        question.text = prompt
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let userInput = input.text else {
            return
        }
        if deck.evaluate(submission: userInput) {
            output.text = "Correct!"
            if let prompt = deck.currentCard()?.prompt {
                question.text = prompt
            } else {
                question.text = "No more questions!"
            }
        } else {
            output.text = "Oh noooooo!"
        }
    }
}
