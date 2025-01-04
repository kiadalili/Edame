import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Education Games!")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: AdditionGameView()) {
                    GameButton(title: "Addition Game", color: .blue, gameType: .addition)
                }
                
                NavigationLink(destination: MultiplicationGameView()) {
                    GameButton(title: "Multiplication Game", color: .green, gameType: .multiplication)
                }
                
                NavigationLink(destination: ReadingGameView()) {
                    GameButton(title: "Reading Game", color: .purple, gameType: .reading)
                }
                
                NavigationLink(destination: WritingGameView()) {
                    GameButton(title: "Writing Game", color: .pink, gameType: .writing)
                }
            }
            .padding()
        }
    }
}

struct GameButton: View {
    let title: String
    let color: Color
    let gameType: GameType
    @ObservedObject private var highScoreManager = HighScoreManager.shared
    
    var highScore: Int {
        switch gameType {
        case .addition:
            return highScoreManager.additionHighScore
        case .multiplication:
            return highScoreManager.multiplicationHighScore
        case .reading:
            return highScoreManager.readingHighScore
        case .writing:
            return highScoreManager.writingHighScore
        }
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.leading, 16)
            
            Spacer()
            
            // High score display
            VStack(alignment: .trailing) {
                Text("Best")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))
                Text("\(highScore)")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .padding(.trailing, 16)
        }
        .frame(width: 280, height: 60)
        .background(color)
        .cornerRadius(15)
    }
} 