//
//  ChatGeniusAIApp.swift
//  ChatGeniusAI
//
//  Created by Apple on 04/10/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct ChatGeniusAIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var vm = CurrentScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(vm)
            
        }
    }
}
