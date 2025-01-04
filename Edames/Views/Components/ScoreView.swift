import SwiftUI

struct ScoreView: View {
    @ObservedObject var scoreManager = ScoreManager.shared
    let gameType: GameType
    
    var score: Int {
        switch gameType {
        case .addition:
            return scoreManager.additionScore
        case .multiplication:
            return scoreManager.multiplicationScore
        case .reading:
            return scoreManager.readingScore
        case .writing:
            return scoreManager.writingScore
        }
    }
    
    var body: some View {
        Text("\(score)")
            .font(.title)
            .bold()
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(0.9))
                    .shadow(radius: 3)
            )
    }
} 