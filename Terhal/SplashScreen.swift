//
//  SplashScreen.swift
//  Terhal
//
//  Created by Lujain Alaydie on 22/01/2024.
//

import SwiftUI
import FLAnimatedImage
struct SplashScreen: View {
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    GIFView(type: .name("LOGO"))
                        .frame(width: geometry.size.width / 2.3, height: geometry.size.height / 4)

                    Spacer()
                }
                .padding(.horizontal, 0)
                
                Spacer()
            }
            }
        }
        .frame(width: 390, height: 844)
        .background(
        LinearGradient(
        stops: [
        Gradient.Stop(color: Color(red: 0.26, green: 0.63, blue: 0.94).opacity(0.5), location: 0.00),
        Gradient.Stop(color: Color(red: 0.26, green: 0.63, blue: 0.94), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
        )
        )  
    }
}

#Preview {
    SplashScreen()
}
