//
//  NASKApp.swift
//  NASK
//
//  Created by Tomasz Kubicki on 28/08/2023.
//

import SwiftUI

@main
struct NBPApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
        }
    }
}
