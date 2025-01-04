import SwiftUI

struct WritingGameView: View {
    @StateObject private var viewModel = WritingGameViewModel()
    
    // QWERTY layout rows
    let topRow = "QWERTYUIOP".map { String($0) }
    let middleRow = "ASDFGHJKL".map { String($0) }
    let bottomRow = "ZXCVBNM".map { String($0) }
    
    var body: some View {
        VStack(spacing: 0) {
            // Score and title row
            HStack {
                Text("Spell the word!")
                    .font(.largeTitle)
                Spacer()
                ScoreView(gameType: .writing)
            }
            .padding()
            
            // Game content
            VStack(spacing: 30) {
                Text(viewModel.currentEmoji)
                    .font(.system(size: 100))
                    .padding()
                
                Text(viewModel.displayWord)
                    .font(.system(size: 50, weight: .bold, design: .monospaced))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
                    .padding()
                
                // QWERTY keyboard
                VStack(spacing: 8) {
                    // Top row
                    HStack(spacing: 4) {
                        ForEach(topRow, id: \.self) { letter in
                            LetterButton(letter: letter) {
                                viewModel.checkLetter(Character(letter))
                            }
                        }
                    }
                    
                    // Middle row
                    HStack(spacing: 4) {
                        Spacer(minLength: 20)
                        ForEach(middleRow, id: \.self) { letter in
                            LetterButton(letter: letter) {
                                viewModel.checkLetter(Character(letter))
                            }
                        }
                        Spacer(minLength: 20)
                    }
                    
                    // Bottom row
                    HStack(spacing: 4) {
                        Spacer(minLength: 40)
                        ForEach(bottomRow, id: \.self) { letter in
                            LetterButton(letter: letter) {
                                viewModel.checkLetter(Character(letter))
                            }
                        }
                        Spacer(minLength: 40)
                    }
                }
                .padding()
            }
        }
        .overlay {
            if viewModel.showingCorrectAnswer {
                FireworksView()
            }
            if viewModel.showingWrongAnswer {
                WrongAnswerView()
            }
        }
    }
}

// Helper view for keyboard buttons
struct LetterButton: View {
    let letter: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(letter)
                .font(.title2)
                .frame(width: 35, height: 45)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
} 