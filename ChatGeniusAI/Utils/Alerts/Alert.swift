//
//  Alert.swift
//  Appetizers
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

struct AlertItem : Identifiable{
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
    
    
}
    
    struct AlertContext{
        static let invalidData = AlertItem(title: Text("Server Error"), message: Text ("Data recieved from the server is invalid"), dismissButton: .default(Text("OK")))
        
        static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
        
        static let invalidUrl = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
        
        static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later"), dismissButton: .default(Text("OK")))
        
        static let userNotFound = AlertItem(title: Text("Account Error"), message: Text("No account found with this email. Please sign up."), dismissButton: .default(Text("OK")))
        
        static let wrongPassword = AlertItem(title: Text("Authentication Error"), message: Text("The password is incorrect. Please try again."), dismissButton: .default(Text("OK")))
        
        static let wrongEmail =  AlertItem(title: Text("Email Error"), message: Text("The email address is badly formatted. Please enter a valid email."), dismissButton: .default(Text("OK")))
        
        static let emailAlreadyUsed = AlertItem(title: Text("Email Error"), message: Text("This email is already in use by another account."), dismissButton: .default(Text("OK")))
        
    
}
