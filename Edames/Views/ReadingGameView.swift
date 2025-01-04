import SwiftUI

struct ReadingGameView: View {
    @StateObject private var viewModel = ReadingGameViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Score and title row
            HStack {
                Text("Find the emoji!")
                    .font(.largeTitle)
                Spacer()
                ScoreView(gameType: .reading)
            }
            .padding()
            
            // Rest of the game content
            VStack {
                Text(viewModel.currentWord)
                    .font(.system(size: 70, weight: .bold))
                    .padding(.vertical, 50)
                
                Spacer()
                
                // 2x2 grid of emoji options
                VStack(spacing: 20) {
                    ForEach(0..<2) { row in
                        HStack(spacing: 20) {
                            ForEach(0..<2) { column in
                                let index = row * 2 + column
                                Button(action: {
                                    viewModel.checkAnswer(viewModel.emojiOptions[index])
                                }) {
                                    Text(viewModel.emojiOptions[index])
                                        .font(.system(size: 80))
                                        .frame(width: 140, height: 140)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
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
        .onAppear {
            viewModel.resetGame()
        }
    }
} 