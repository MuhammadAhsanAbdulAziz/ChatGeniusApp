//
//  ChatGeniusAIApp.swift
//  ChatGeniusAI
//
//  Created by Apple on 04/10/2024.
//

import SwiftUI

@main
struct ChatGeniusAIApp: App {
    
    var vm = CurrentScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(vm)
                
        }
    }
}
