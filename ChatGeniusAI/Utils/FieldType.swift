//
//  FieldType.swift
//  ChatGeniusAI
//
//  Created by Apple on 16/10/2024.
//

import Foundation

protocol FieldValidatorProtocol {
    func validate(value : String) -> String?
}

enum FieldType : FieldValidatorProtocol {
    
    case email
    case password
    
    func validate(value: String) -> String? {
        switch self {
        case .email :
            return emailValidate(value : value)
        case .password:
            return passwordValidate(value : value)
        }
    }
    
    private func emailValidate(value: String) -> String? {
        
        if value.isEmpty {
            return "Email cannot be empty"
        } else {
            let emailFormat = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: value) ? nil : "Please enter valid Email Address"
        }
    }
    
    private func passwordValidate(value: String) -> String? {
        if value.isEmpty {
            return "Please enter password"
        }
        
        if value.count < 6 {
            return "Length of the password should be at least 6"
        }
        
        // Check if the password contains at least one letter and one number
        let letterRegex = ".*[A-Za-z]+.*" // Regex for letters
        let numberRegex = ".*[0-9]+.*"    // Regex for numbers
        
        let letterTest = NSPredicate(format: "SELF MATCHES %@", letterRegex)
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        
        if !letterTest.evaluate(with: value) {
            return "Password must contain at least one letter"
        }
        
        if !numberTest.evaluate(with: value) {
            return "Password must contain at least one number"
        }
        
        return nil
    }
    
    
}
