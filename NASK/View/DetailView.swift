//
//  DetailView.swift
//  NASK
//
//  Created by Tomasz Kubicki on 29/08/2023.
//

import SwiftUI
import Charts

struct DetailView: View {
    
    @EnvironmentObject var rates: RatesModel
        
    var body: some View {
        VStack {
            if rates.rates.rates != nil {
                Chart (rates.rates.rates!) { rate in
                    BarMark (x: .value("Date", rate.effectiveDate!), y: .value("Exchange rate", rate.mid!))
                }
                Grid {
                    
                    let c = rates.rates.rates?.count
                    
                    let count = c! / 2 + 1
                    
                    ForEach (0..<count, id: \.self) { row  in
                        
                        GridRow {
                            
                            let start = row * 2
                            
                            let lim = start + 2 < c! ? start + 2 : c
                            
                            ForEach (start..<lim!, id: \.self) { rate in
                                
                                let effectiveDay = rates.rates.rates![rate].effectiveDate ?? ""
                                let mid = rates.rates.rates![rate].mid ?? 0.0
                                
                                RowView(id: effectiveDay, currency: "\(mid)")
                            }
                            .foregroundColor(.primary)
                            .padding([.trailing, .leading], 5)
                            .padding([.top, .bottom], 3)
                        }
                    }
                }
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(RatesModel(currency: "chf"))
    }
}
