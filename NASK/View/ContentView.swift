//
//  ContentView.swift
//  NASK
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var ratesTable: ContentModel
    
    var body: some View {
        if ratesTable.rateList.isEmpty {
            ProgressView()
        } else {
            ScrollView {
                ForEach (ratesTable.rateList[0].rates!) { rate in
                    NavigationLink(destination: ProgressView(), label: {
                        RowView(id: rate.id ?? "", currency: rate.currency ?? "", mid: rate.mid ?? 0.0)
                    })
                    .foregroundColor(.primary)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
