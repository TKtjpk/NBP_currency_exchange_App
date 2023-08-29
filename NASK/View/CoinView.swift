//
//  CoinView.swift
//  NASK
//
//  Created by Tomasz Kubicki on 29/08/2023.
//

import SwiftUI

struct CoinView: View {
    
    var id: String
    var currency: String
    var mid: Double
    var maxSize: CGFloat
    
    var body: some View {
        
            ZStack {
                
                Circle()
                    .foregroundColor(.white)
                    .shadow(radius: 5, x: -2, y: 3)
                
                VStack {
                    
                    Spacer()
                    
                    Text("\(id)")
                        .font(Font.custom("Avenir", size: maxSize / 3))
                        .fontWeight(.heavy)
                        .italic()
                        .foregroundColor(.purple)
                    
                    Text("\(currency)")
                        .frame(maxWidth: maxSize - 50)
                        .font(Font.custom("Avenir", size: maxSize / 10))
                        .multilineTextAlignment(.center)
                        .italic()
                        .foregroundColor(.primary)
                        .offset(CGSize(width: 0, height: -10))
                    
                    Spacer()
                }
                .foregroundColor(.gray)
            }
            .frame(width: maxSize)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(id: "CHF", currency: "frank szwajcarski", mid: 0.0, maxSize: 150)
    }
}
