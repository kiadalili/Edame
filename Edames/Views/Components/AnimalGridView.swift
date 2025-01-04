import SwiftUI

struct AnimalGridView: View {
    let count: Int
    let animal: String
    
    var body: some View {
        VStack(spacing: 10) {
            if count <= 2 {
                HStack(spacing: 15) {
                    ForEach(0..<count, id: \.self) { _ in
                        Text(animal)
                            .font(.system(size: 40))
                    }
                }
            } else if count <= 4 {
                VStack(spacing: 10) {
                    HStack(spacing: 15) {
                        ForEach(0..<min(2, count), id: \.self) { _ in
                            Text(animal)
                                .font(.system(size: 40))
                        }
                    }
                    HStack(spacing: 15) {
                        ForEach(0..<(count - 2), id: \.self) { _ in
                            Text(animal)
                                .font(.system(size: 40))
                        }
                    }
                }
            } else {
                VStack(spacing: 10) {
                    HStack(spacing: 15) {
                        ForEach(0..<2, id: \.self) { _ in
                            Text(animal)
                                .font(.system(size: 40))
                        }
                    }
                    HStack(spacing: 15) {
                        ForEach(0..<2, id: \.self) { _ in
                            Text(animal)
                                .font(.system(size: 40))
                        }
                    }
                    HStack(spacing: 15) {
                        Text(animal)
                            .font(.system(size: 40))
                    }
                }
            }
        }
    }
} 