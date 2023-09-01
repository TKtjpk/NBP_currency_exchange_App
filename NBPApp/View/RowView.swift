//
//  RowView.swift
//  NASK
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import SwiftUI

struct RowView: View {
    
    var id: String
    var currency: String
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
        
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5, x: -2, y: 3)
                
            VStack(alignment: .leading) {
            
                Text(id)
                    .bold()
                    .foregroundColor(.white)
                    .italic()
                    .shadow(color: .indigo,radius: 3, x: -1, y: 2)
                    
                Text(currency)
                    .foregroundColor(.indigo)
                    .italic()
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .animation(.default.speed(0.01), value: 10)
            }
            .padding([.leading, .trailing])
            .offset(CGSize(width: 0, height: 5))
        }
        .frame(height:50)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(id: "PLN", currency: "zloty")
    }
}
