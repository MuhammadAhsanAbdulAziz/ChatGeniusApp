//
//  LoginViewModel.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import Foundation
import FirebaseAuth

@Observable class AuthViewModel {
    var isLogin = true
    var isPasswordShowing = false
    var emailText: FieldModel = FieldModel(value: "", fieldType: .email)
    var passwordText: FieldModel = FieldModel(value: "", fieldType: .password)
    var alertItem: AlertItem?
    var isLoading = false  // Initially set to false
    var isAuthenticated = false
    
    func signUp() {
        isLoading = true
        Auth.auth().createUser(withEmail: emailText.value, password: passwordText.value) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false  // Toggle off loading once complete
            
            if let error = error as NSError? {
                // Handle the Firebase-specific errors
                switch AuthErrorCode(rawValue: error.code) {
                case .invalidEmail:
                    self.alertItem = AlertContext.wrongEmail
                    
                case .emailAlreadyInUse:
                    self.alertItem = AlertContext.emailAlreadyUsed
                    
                case .networkError:
                    self.alertItem = AlertContext.unableToComplete // Using the "unableToComplete" alert for network errors
                    
                default:
                    self.alertItem = AlertContext.invalidResponse // Use the "invalidResponse" alert for other generic errors
                }
                return
            }
            // Successful sign-up
            self.isAuthenticated = true
        }
    }
    

    
    func sendEmailVerification(completion: @escaping (Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            self.alertItem = AlertContext.invalidResponse
            return
        }
        
        if !user.isEmailVerified{
            user.sendEmailVerification { error in
                if let error = error {
                    completion(error)
                }
            }
        }
    }
    
    func login() {
        isLoading = true
        Auth.auth().signIn(withEmail: emailText.value, password: passwordText.value) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false  // Toggle off loading once complete
            
            if let error = error as NSError? {
                // Handle the Firebase-specific errors
                switch AuthErrorCode(rawValue: error.code) {
                case .userNotFound:
                    self.alertItem = AlertContext.userNotFound
                    
                case .wrongPassword:
                    self.alertItem = AlertContext.wrongPassword
                    
                case .invalidEmail:
                    self.alertItem = AlertContext.wrongEmail
                    
                case .emailAlreadyInUse:
                    self.alertItem = AlertContext.emailAlreadyUsed
                    
                case .networkError:
                    self.alertItem = AlertContext.unableToComplete // Using the "unableToComplete" alert for network errors
                    
                default:
                    self.alertItem = AlertContext.invalidResponse // Use the "invalidResponse" alert for other generic errors
                }
                return
            }
            self.isAuthenticated = true
        }
    }
    
}
