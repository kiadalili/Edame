import SwiftUI

class ReadingGameViewModel: ObservableObject {
    @Published var currentWord = ""
    @Published var emojiOptions: [String] = ["🐶", "🐱", "🐸", "🐠"] // Default values
    @Published var correctEmoji = ""
    @Published var showingCorrectAnswer = false
    @Published var showingWrongAnswer = false
    
    private var availableWords: [EmojiWord]
    @ObservedObject private var scoreManager = ScoreManager.shared
    
    init() {
        availableWords = EmojiWordList.shared.words
        resetGame()
    }
    
    func resetGame() {
        if availableWords.count < 4 {
            availableWords = EmojiWordList.shared.words
        }
        
        let selectedEmojis = Array(availableWords.shuffled().prefix(4))
        
        availableWords.removeAll { word in
            selectedEmojis.contains { $0.emoji == word.emoji }
        }
        
        let correctIndex = Int.random(in: 0...3)
        let correctAnswer = selectedEmojis[correctIndex]
        
        currentWord = correctAnswer.word
        correctEmoji = correctAnswer.emoji
        emojiOptions = selectedEmojis.map { $0.emoji }
        
        showingCorrectAnswer = false
        showingWrongAnswer = false
    }
    
    func checkAnswer(_ selectedEmoji: String) {
        if selectedEmoji == correctEmoji {
            showingCorrectAnswer = true
            scoreManager.incrementScore(for: .reading)
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
