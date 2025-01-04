import Foundation

class HighScoreManager: ObservableObject {
    static let shared = HighScoreManager()
    
    @Published private(set) var additionHighScore: Int = 0
    @Published private(set) var multiplicationHighScore: Int = 0
    @Published private(set) var readingHighScore: Int = 0
    @Published private(set) var writingHighScore: Int = 0
    
    private let defaults = UserDefaults.standard
    
    private init() {
        // Load saved scores
        additionHighScore = defaults.integer(forKey: "additionHighScore")
        multiplicationHighScore = defaults.integer(forKey: "multiplicationHighScore")
        readingHighScore = defaults.integer(forKey: "readingHighScore")
        writingHighScore = defaults.integer(forKey: "writingHighScore")
    }
    
    func checkAndUpdateHighScore(for game: GameType, score: Int) {
        switch game {
        case .addition:
            if score > additionHighScore {
                additionHighScore = score
                defaults.set(score, forKey: "additionHighScore")
            }
        case .multiplication:
            if score > multiplicationHighScore {
                multiplicationHighScore = score
                defaults.set(score, forKey: "multiplicationHighScore")
            }
        case .reading:
            if score > readingHighScore {
                readingHighScore = score
                defaults.set(score, forKey: "readingHighScore")
            }
        case .writing:
            if score > writingHighScore {
                writingHighScore = score
                defaults.set(score, forKey: "writingHighScore")
            }
        }
    }
} 