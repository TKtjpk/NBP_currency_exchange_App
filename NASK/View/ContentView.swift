//
//  ContentView.swift
//  NASK
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var ratesTable: ContentModel
    
    @State private var viewSwap: Bool = true
    
    @State private var swapButtonName: String = "Circles"
    
    //@StateObject var currency = ContentModel()
    
    var body: some View {
        
        if ratesTable.rateList.isEmpty {
            
            ProgressView()
            
        } else {
            
            GeometryReader { geometry in
                
                NavigationView {
                    
                    VStack {
                        
                        ScrollView {
                            
                            Grid {
                                
                                let c = ratesTable.rateList[0].rates?.count ?? 1
                                
                                let count = c / 2 + 1
                                
                                ForEach (0..<count, id: \.self) { row  in
                                    
                                    GridRow {
                                        
                                        let start = row * 2
                                        
                                        let lim = start + 2 < c ? start + 2 : c
                                        
                                        ForEach (start..<lim, id: \.self) { rate in
                                            
                                            let currency = ratesTable.rateList[0].rates![rate].id!
                                            
                                            NavigationLink(destination: DetailView()
                                                .environmentObject(RatesModel(currency: currency)), label: {
                                                
                                                let id = ratesTable.rateList[0].rates![rate].id ?? ""
                                                let currency = ratesTable.rateList[0].rates![rate].currency ?? ""
                                                let mid = ratesTable.rateList[0].rates![rate].mid ?? 0.0
                                                let maxSize = geometry.size.width / 2.5
                                                
                                                if viewSwap {
                                                    RowView(id: id, currency: currency)
                                                } else {
                                                    CoinView(id: id, currency: currency, mid: mid, maxSize: maxSize)
                                                }
                                            })
                                            .foregroundColor(.primary)
                                            .padding([.trailing, .leading], 5)
                                            .padding([.top, .bottom], 3)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationBarItems(trailing: Toggle("Toggle view", isOn: $viewSwap)
                        .toggleStyle(.switch)
                        .foregroundColor(.indigo)
                        .tint(.indigo)
                        .font(.footnote)
                        .shadow(radius: 5, x: -2, y: 3)
                    )
                    
                    .navigationBarHidden(false)
                }
            }
            .accentColor(.indigo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
