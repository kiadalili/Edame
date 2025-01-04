import SwiftUI

class MultiplicationGameViewModel: ObservableObject {
    @Published var firstNumber = 2
    @Published var secondNumber = 3
    @Published var animal = "🦒"
    @Published var showingCorrectAnswer = false
    @Published var showingWrongAnswer = false
    @Published var answerOptions: [Int] = [1, 2, 3, 4]
    
    @ObservedObject private var scoreManager = ScoreManager.shared
    let animals = ["🦒", "🦮", "🦁", "🐘", "🦒", "🐪", "🦏", "🦘", "🦬", "🦃"]
    
    var correctAnswer: Int {
        firstNumber * secondNumber
    }
    
    func generateAnswerOptions() {
        var options = Set<Int>()
        options.insert(correctAnswer)
        
        while options.count < 4 {
            let offset = Int.random(in: -4...4)
            let newOption = max(1, correctAnswer + offset)
            if newOption != correctAnswer && !options.contains(newOption) {
                options.insert(newOption)
            }
        }
        
        answerOptions = Array(options).shuffled()
    }
    
    func resetGame() {
        firstNumber = Int.random(in: 1...4)
        secondNumber = Int.random(in: 1...4)
        animal = animals.randomElement() ?? "🦒"
        showingCorrectAnswer = false
        showingWrongAnswer = false
        generateAnswerOptions()
    }
    
    func checkAnswer(_ answer: Int) {
        if answer == correctAnswer {
            showingCorrectAnswer = true
            scoreManager.incrementScore(for: .multiplication)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.resetGame()
            }
        } else {
            showingWrongAnswer = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showingWrongAnswer = false
            }
        }
    }
} 