//
//  HomeViewModel.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import Foundation
import FirebaseAuth

@Observable class HomeViewModel {
    
    var isLoginDialog : Bool = true
    var isEmailDialog : Bool = false
    var msgText = ""
    var user : FirebaseAuth.User?
    
    init(){
        user = Auth.auth().currentUser
    }
    
    func checkAndReloadUser(completion: @escaping (Bool) -> Void) {
        if let user = Auth.auth().currentUser {
            // Reload the user's data from the server
            user.reload { error in
                if let error = error {
                    print("Error reloading user: \(error.localizedDescription)")
                    completion(false)  // Return false if there's an error
                } else {
                    // After reloading, check if the email is verified
                    if user.isEmailVerified {
                        print("Email is verified")
                        completion(true)  // Return true if the email is verified
                    } else {
                        print("Email is still not verified")
                        completion(false)  // Return false if the email is not verified
                    }
                }
            }
        } else {
            print("No user is signed in")
            completion(false)  // Return false if no user is signed in
        }
    }
}
