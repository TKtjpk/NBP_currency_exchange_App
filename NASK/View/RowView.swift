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
        HStack {
            Text(id)
            Spacer()
            Text(currency)
                .font(.footnote)
//            Spacer()
//            Text(String(format: "%.3f", mid))
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(alignment: .center)
        .border(.gray, width: 0.1)
        .cornerRadius(5)
        .shadow(color:.gray, radius: 5)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(id: "PLN", currency: "zloty", mid: 1.0)
    }
}
