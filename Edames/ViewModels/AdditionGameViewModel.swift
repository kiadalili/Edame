import SwiftUI

class AdditionGameViewModel: ObservableObject {
    @Published var firstAnimal = "🦒"
    @Published var secondAnimal = "🦮"
    @Published var firstCount = 2
    @Published var secondCount = 3
    @Published var showingCorrectAnswer = false
    @Published var showingWrongAnswer = false
    @Published var answerOptions: [Int] = [1, 2, 3, 4]
    
    @ObservedObject private var scoreManager = ScoreManager.shared
    let animals = ["🦒", "🦮", "🦁", "🐘", "🦒", "🐪", "🦏", "🦘", "🦬", "🦃"]
    
    var correctAnswer: Int {
        firstCount + secondCount
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
        firstAnimal = animals.randomElement() ?? "🦒"
        secondAnimal = animals.randomElement() ?? "🦮"
        firstCount = Int.random(in: 1...5)
        secondCount = Int.random(in: 1...5)
        showingCorrectAnswer = false
        showingWrongAnswer = false
        generateAnswerOptions()
    }
    
    func checkAnswer(_ answer: Int) {
        if answer == correctAnswer {
            showingCorrectAnswer = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.resetGame()
            }
            scoreManager.incrementScore(for: .addition)
        } else {
            showingWrongAnswer = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showingWrongAnswer = false
            }
        }
    }
} 