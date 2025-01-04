import SwiftUI

class ScoreManager: ObservableObject {
    static let shared = ScoreManager()
    private let highScoreManager = HighScoreManager.shared
    
    @Published var additionScore: Int = 0 {
        didSet {
            highScoreManager.checkAndUpdateHighScore(for: .addition, score: additionScore)
        }
    }
    @Published var multiplicationScore: Int = 0 {
        didSet {
            highScoreManager.checkAndUpdateHighScore(for: .multiplication, score: multiplicationScore)
        }
    }
    @Published var readingScore: Int = 0 {
        didSet {
            highScoreManager.checkAndUpdateHighScore(for: .reading, score: readingScore)
        }
    }
    @Published var writingScore: Int = 0 {
        didSet {
            highScoreManager.checkAndUpdateHighScore(for: .writing, score: writingScore)
        }
    }
    
    private init() {} // Singleton
    
    func incrementScore(for game: GameType) {
        switch game {
        case .addition:
            additionScore += 1
        case .multiplication:
            multiplicationScore += 1
        case .reading:
            readingScore += 1
        case .writing:
            writingScore += 1
        }
    }
    
    func resetScores() {
        additionScore = 0
        multiplicationScore = 0
        readingScore = 0
        writingScore = 0
    }
}

enum GameType {
    case addition
    case multiplication
    case reading
    case writing
} 