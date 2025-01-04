import Foundation

struct EmojiWord {
    let emoji: String
    let word: String
}

class EmojiWordList {
    static let shared = EmojiWordList()
    
    let words: [EmojiWord]
    
    private init() {
        // Create the array and shuffle it immediately
        words = [
            EmojiWord(emoji: "🐶", word: "DOG"),
            EmojiWord(emoji: "🐱", word: "CAT"),
            EmojiWord(emoji: "🐸", word: "FROG"),
            EmojiWord(emoji: "🐠", word: "FISH"),
            EmojiWord(emoji: "🦁", word: "LION"),
            EmojiWord(emoji: "🐘", word: "ELEPHANT"),
            EmojiWord(emoji: "🦒", word: "GIRAFFE"),
            EmojiWord(emoji: "🐪", word: "CAMEL"),
            EmojiWord(emoji: "🦈", word: "SHARK"),
            EmojiWord(emoji: "🦩", word: "FLAMINGO"),
            EmojiWord(emoji: "😊", word: "SMILY"),
            EmojiWord(emoji: "🐞", word: "LADYBUG"),
            EmojiWord(emoji: "😢", word: "SAD"),
            EmojiWord(emoji: "😡", word: "ANGRY"),
            EmojiWord(emoji: "🐾", word: "PAWS"),
            EmojiWord(emoji: "🌎", word: "EARTH"),
            EmojiWord(emoji: "🌸", word: "BLOSSOM"),
            EmojiWord(emoji: "🦴", word: "BONE"),
            EmojiWord(emoji: "🐢", word: "TURTLE"),
            EmojiWord(emoji: "🧠", word: "BRAIN"),
            EmojiWord(emoji: "🎶", word: "MUSIC"),
            EmojiWord(emoji: "🌊", word: "WAVE"),
            EmojiWord(emoji: "🎈", word: "BALLOON"),
            EmojiWord(emoji: "👀", word: "EYES"),
            EmojiWord(emoji: "🐦", word: "BIRD"),
            EmojiWord(emoji: "🐻", word: "BEAR"),
            EmojiWord(emoji: "🌱", word: "SPROUT"),
            EmojiWord(emoji: "❤️", word: "HEART"),
            EmojiWord(emoji: "💯", word: "HUNDRED"),
            EmojiWord(emoji: "🎉", word: "PARTY"),
            EmojiWord(emoji: "🎂", word: "CAKE"),
            EmojiWord(emoji: "🎁", word: "GIFT"),
            EmojiWord(emoji: "🍕", word: "PIZZA"),
            EmojiWord(emoji: "🍔", word: "BURGER"),
            EmojiWord(emoji: "🌮", word: "TACO"),
            EmojiWord(emoji: "☕", word: "COFFEE"),
            EmojiWord(emoji: "🍺", word: "BEER"),
            EmojiWord(emoji: "🌞", word: "SUN"),
            EmojiWord(emoji: "🌙", word: "MOON"),
            EmojiWord(emoji: "🌟", word: "STAR"),
            EmojiWord(emoji: "⚡", word: "LIGHTNING"),
            EmojiWord(emoji: "🔥", word: "FIRE"),
            EmojiWord(emoji: "💧", word: "DROP"),
            EmojiWord(emoji: "❄️", word: "SNOW"),
            EmojiWord(emoji: "🌈", word: "RAINBOW"),
            EmojiWord(emoji: "☂️", word: "UMBRELLA"),
            EmojiWord(emoji: "🐭", word: "MOUSE"),
            EmojiWord(emoji: "🐧", word: "PENGUIN"),
            EmojiWord(emoji: "🐍", word: "SNAKE"),
            EmojiWord(emoji: "🦋", word: "BUTTERFLY"),
            EmojiWord(emoji: "🚗", word: "CAR"),
            EmojiWord(emoji: "✈️", word: "PLANE"),
            EmojiWord(emoji: "🚀", word: "ROCKET"),
            EmojiWord(emoji: "🏠", word: "HOUSE"),
            EmojiWord(emoji: "🌿", word: "LEAF"),
            EmojiWord(emoji: "🎈", word: "BALLOON"),
        ].shuffled()  // Shuffle when created
    }
} 
