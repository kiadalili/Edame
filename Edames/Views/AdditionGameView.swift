import SwiftUI

struct AdditionGameView: View {
    @StateObject private var viewModel = AdditionGameViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Score and title row
            HStack {
                Text("Add the animals!")
                    .font(.largeTitle)
                Spacer()
                ScoreView(gameType: .addition)
            }
            .padding()
            
            // Rest of the game content
            VStack {
                // Animals side by side
                HStack(spacing: 40) {
                    VStack {
                        HStack(spacing: 40) {
                            Text("\(viewModel.firstCount)")
                                .font(.system(size: 50, weight: .bold))
                                .frame(width: 80)
                            
                            Text("+")
                                .font(.system(size: 50, weight: .bold))
                            
                            Text("\(viewModel.secondCount)")
                                .font(.system(size: 50, weight: .bold))
                                .frame(width: 80)
                        }
                        
                        HStack(spacing: 40) {
                            VStack {
                                AnimalGridView(count: viewModel.firstCount, animal: viewModel.firstAnimal)
                            }
                            
                            Text("")
                                .frame(width: 50)
                            
                            VStack {
                                AnimalGridView(count: viewModel.secondCount, animal: viewModel.secondAnimal)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                // 2x2 grid of answer options
                AnswerGridView(options: viewModel.answerOptions, onSelection: viewModel.checkAnswer)
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