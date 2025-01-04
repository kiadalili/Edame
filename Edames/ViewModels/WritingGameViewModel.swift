import SwiftUI

class WritingGameViewModel: ObservableObject {
    @Published var currentEmoji = ""
    @Published var currentWord = ""
    @Published var displayWord = ""
    @Published var currentPosition = 0
    @Published var showingCorrectAnswer = false
    @Published var showingWrongAnswer = false
    
    private var availableWords: [EmojiWord]
    @ObservedObject private var scoreManager = ScoreManager.shared
    
    init() {
        availableWords = EmojiWordList.shared.words
        resetGame()
    }
    
    func resetGame() {
        if availableWords.isEmpty {
            availableWords = EmojiWordList.shared.words
        }
        
        let randomIndex = Int.random(in: 0..<availableWords.count)
        let selectedWord = availableWords.remove(at: randomIndex)
        
        currentEmoji = selectedWord.emoji
        currentWord = selectedWord.word
        currentPosition = 0
        updateDisplayWord()
        
        showingCorrectAnswer = false
        showingWrongAnswer = false
    }
    
    func updateDisplayWord() {
        displayWord = String(repeating: "_ ", count: currentWord.count).trimmingCharacters(in: .whitespaces)
    }
    
    func checkLetter(_ letter: Character) {
        let upperLetter = Character(letter.uppercased())
        let currentLetter = currentWord[currentWord.index(currentWord.startIndex, offsetBy: currentPosition)]
        
        if upperLetter == currentLetter {
            // Correct letter
            let start = displayWord.startIndex
            let letterPosition = displayWord.index(start, offsetBy: currentPosition * 2) // Account for spaces
            displayWord.replaceSubrange(letterPosition...letterPosition, with: String(currentLetter))
            
            currentPosition += 1
            
            // Check if word is complete
            if currentPosition == currentWord.count {
                showingCorrectAnswer = true
                scoreManager.incrementScore(for: .writing)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.resetGame()
                }
            }
        } else {
            // Wrong letter
            showingWrongAnswer = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showingWrongAnswer = false
            }
        }
    }
} 
