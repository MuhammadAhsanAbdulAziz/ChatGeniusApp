//
//  LoginDialog.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import SwiftUI

struct EmailVerificationDialog: View {
    
    @State var vm = AuthViewModel()
    
    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            VStack(alignment:.center){
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60,height: 60)
                
                Text("ChatGenius AI")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 29,weight: .bold))
                
                Spacer()
                    .frame(height: 30)
                
                Text("Verify your Account")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 34,weight: .bold))
                
                Spacer()
                    .frame(height: 30)
                
                Text("Please verify your account by clicking the link sent to your email. If you haven't received the email, check your spam folder or request a new verification link.")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
                
                
                Button{
                    vm.sendEmailVerification { error in
                        if let error = error {
                            vm.alertItem = AlertContext.invalidResponse
                            print("Failed to send verification email: \(error.localizedDescription)")
                        } else {
                            print("Verification email sent.")
                        }
                    }
                } label:{
                    Text("Resend")
                        .bold()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .semibold))
                }
                .frame(maxWidth: .infinity,minHeight: 55)
                .background(.darkBrown)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
            }
            
            .padding()
            
            
        }
        .onAppear{
            vm.sendEmailVerification { error in
                if let error = error {
                    vm.alertItem = AlertContext.invalidResponse
                    print("Failed to send verification email: \(error.localizedDescription)")
                } else {
                    print("Verification email sent.")
                }
            }
        }
        .alert(item: $vm.alertItem) { alert in
            Alert(title: alert.title,message: alert.message,dismissButton: alert.dismissButton)
        }
        .frame(height: 550)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        
    }
}

#Preview {
    EmailVerificationDialog()
}


