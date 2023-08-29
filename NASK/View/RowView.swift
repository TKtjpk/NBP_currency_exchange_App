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
    var mid: Double
    
    var body: some View {
        
        ZStack {
        
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5, x: -2, y: 3)
            
            VStack {
            
                Text(id)
                    .bold()
                    .foregroundColor(.purple)
                    .italic()
                
                Text(currency)
                    .italic()
                    .font(.footnote)
            }
            .padding([.leading, .trailing])
        }
        .frame(height:65)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(id: "PLN", currency: "zloty", mid: 1.0)
    }
}
