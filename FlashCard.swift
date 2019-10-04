import Foundation

// - Structs are value types, they are passed by value
struct FlashCard {
    var prompt: String
    var solution: String

    init(withPrompt prompt: String, andSolution solution: String) {
        self.prompt = prompt
        self.solution = solution
    }

    func evaluate(submission: String) -> Bool {
        return submission.lowercased() == solution.lowercased()
    }
}
