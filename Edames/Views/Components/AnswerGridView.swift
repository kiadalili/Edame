import SwiftUI

struct AnswerGridView: View {
    let options: [Int]
    let onSelection: (Int) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<2) { row in
                HStack(spacing: 20) {
                    ForEach(0..<2) { column in
                        let index = row * 2 + column
                        Button(action: {
                            onSelection(options[index])
                        }) {
                            Text("\(options[index])")
                                .font(.system(size: 60, weight: .bold))
                                .frame(width: 140, height: 140)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
    }
} 