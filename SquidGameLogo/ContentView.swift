//
//  ContentView.swift
//  SquidGameLogo
//
//  Created by VictorZima on 22/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var change = false
    @State private var progress = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 30) {
                Spacer()
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(red: 250 / 255, green: 0 / 255, blue: 80 / 255), style: StrokeStyle(lineWidth: 13, lineCap: CGLineCap.round))
                    .frame(width: 90, height: 90)
                    .offset(x: 15)
                    .animation(.linear(duration: 2), value: change)
                Triangle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(red: 250 / 255, green: 0 / 255, blue: 80 / 255), style: StrokeStyle(lineWidth: 13, lineCap: CGLineCap.round))
                    .frame(width: 90, height: 90)
                    .animation(.linear(duration: 2).delay(0.4), value: change)
                
                Rectangle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(red: 250 / 255, green: 0 / 255, blue: 80 / 255), style: StrokeStyle(lineWidth: 13, lineCap: CGLineCap.round))
                    .frame(width: 90, height: 90)
                    .offset(x: -2)
                    .animation(.linear(duration: 2).delay(0.9), value: change)
                Spacer()

            }
            .offset(x: -10)
            Spacer()
            Button("Change") {
                self.change.toggle()
                self.progress = self.change ? 0 : 1
            }
            .foregroundColor(.white)
            .font(.title)
            .padding()
        }
        .background(.black)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
