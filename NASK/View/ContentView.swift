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
    
    @State private var multiplier = 3.5
    
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
                                
                                let count = c / 3 + 1
                                
                                ForEach (0..<count) { row  in
                                    
                                    GridRow {
                                        
                                        let start = row * 3
                                        
                                        let lim = start + 3 < c ? start + 3 : c
                                        
                                        ForEach (start..<lim) { rate in
                                            
                                            NavigationLink(destination: ProgressView(), label: {
                                                
                                                let id = ratesTable.rateList[0].rates![rate].id ?? ""
                                                let currency = ratesTable.rateList[0].rates![rate].currency ?? ""
                                                let mid = ratesTable.rateList[0].rates![rate].mid ?? 0.0
                                                let maxSize = geometry.size.width / multiplier
                                                
                                                if viewSwap {
                                                    RowView(id: id, currency: currency, mid: mid)
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
                        
                        if !viewSwap {
                            Slider(value: $multiplier, in: 3.5...5)
                                .padding([.leading, .trailing])
                        }
                    }
                    .navigationBarItems(trailing: Toggle("View", isOn: $viewSwap)
                        .toggleStyle(.switch)
                        .foregroundColor(.purple))
                    .navigationBarHidden(false)
                }
            }
            .accentColor(.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
