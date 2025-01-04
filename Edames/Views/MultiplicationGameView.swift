import SwiftUI

struct MultiplicationGameView: View {
    @StateObject private var viewModel = MultiplicationGameViewModel()
    
    // Calculate dynamic size based on number of items and rows
    private var animalSize: CGFloat {
        if viewModel.firstNumber == 4 {
            // When there are 4 rows, make emojis smaller based on column count
            switch viewModel.secondNumber {
            case 1: return 25
            case 2: return 25
            case 3: return 25
            default: return 30
            }
        }
        // Default size for other combinations
        if viewModel.firstNumber * viewModel.secondNumber > 9 {
            return 30 // Smaller size for larger combinations
        }
        return 40
    }
    
    // Calculate spacing based on number of items
    private var horizontalSpacing: CGFloat {
        if viewModel.firstNumber == 4 && viewModel.secondNumber <= 3 {
            return 5 // Tighter spacing for problematic cases
        }
        return 10 // Default spacing
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Score and title row
            HStack {
                Text("Multiplication!")
                    .font(.largeTitle)
                Spacer()
                ScoreView(gameType: .multiplication)
            }
            .padding()
            
            // Rest of the game content
            VStack {
                // Multiplication expression
                HStack {
                    Text("\(viewModel.firstNumber)")
                        .font(.system(size: 50, weight: .bold))
                    Text("×")
                        .font(.system(size: 50, weight: .bold))
                    Text("\(viewModel.secondNumber)")
                        .font(.system(size: 50, weight: .bold))
                }
                .padding(.bottom, 5)
                
                // Animal groups
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        ForEach(0..<viewModel.firstNumber, id: \.self) { _ in
                            HStack(spacing: horizontalSpacing) {
                                ForEach(0..<viewModel.secondNumber, id: \.self) { _ in
                                    Text(viewModel.animal)
                                        .font(.system(size: animalSize))
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.4)
                
                Spacer()
                
                // Answer options
                AnswerGridView(options: viewModel.answerOptions, onSelection: viewModel.checkAnswer)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
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