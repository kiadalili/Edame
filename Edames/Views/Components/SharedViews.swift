import SwiftUI

struct FireworkParticle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var color: Color
    var scale: Double
    var opacity: Double
    
    static func random(in rect: CGRect) -> FireworkParticle {
        FireworkParticle(
            position: CGPoint(
                x: rect.midX + .random(in: -100...100),
                y: rect.midY + .random(in: -100...100)
            ),
            color: [.yellow, .red, .blue, .green, .purple, .orange].randomElement() ?? .yellow,
            scale: 0.1,
            opacity: 1.0
        )
    }
}

struct FireworksView: View {
    @State private var particles: [FireworkParticle] = []
    @State private var timer: Timer?
    
    func createFirework(in rect: CGRect) {
        for _ in 0..<20 {
            particles.append(.random(in: rect))
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                ForEach(particles) { particle in
                    Text("✨")
                        .font(.system(size: 40))
                        .foregroundColor(particle.color)
                        .position(particle.position)
                        .scaleEffect(particle.scale)
                        .opacity(particle.opacity)
                }
            }
            .onAppear {
                createFirework(in: geometry.frame(in: .local))
                
                withAnimation(.easeOut(duration: 1.0)) {
                    for index in particles.indices {
                        let randomOffset = CGFloat.random(in: 50...150)
                        let angle = Double.random(in: 0...(2 * .pi))
                        particles[index].position.x += cos(angle) * randomOffset
                        particles[index].position.y += sin(angle) * randomOffset
                        particles[index].scale = 1.0
                        particles[index].opacity = 0.0
                    }
                }
                
                timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                    createFirework(in: geometry.frame(in: .local))
                    
                    withAnimation(.easeOut(duration: 1.0)) {
                        for index in (particles.count - 20)..<particles.count {
                            let randomOffset = CGFloat.random(in: 50...150)
                            let angle = Double.random(in: 0...(2 * .pi))
                            particles[index].position.x += cos(angle) * randomOffset
                            particles[index].position.y += sin(angle) * randomOffset
                            particles[index].scale = 1.0
                            particles[index].opacity = 0.0
                        }
                    }
                    
                    if particles.count > 100 {
                        particles.removeFirst(20)
                    }
                }
            }
            .onDisappear {
                timer?.invalidate()
                timer = nil
            }
        }
    }
}

struct WrongAnswerView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            Text("❌")
                .font(.system(size: 100))
                .foregroundColor(.red)
                .scaleEffect(2)
        }
        .ignoresSafeArea()
    }
} 