//
//  LoginDialog.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import SwiftUI

struct LoginDialog: View {
    
    @Binding var isloginDialog : Bool
    @State var vm = LoginViewModel()
    
    var body: some View {
        ZStack{
            Color(.lightBlack)
                .ignoresSafeArea()
            VStack(alignment:.center){
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 82,height: 82)
                
                Text("ChatGenius AI")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 29,weight: .bold))
                
                Spacer()
                    .frame(height: 30)
                
                Text(vm.isLogin ? "Welcome back" : "Create your account")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 34,weight: .bold))
                
                
                HStack{
                    TextField("", text: $vm.emailText,
                              prompt:
                                Text("Email address")
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)
                    )
                    .keyboardType(.emailAddress)
                }
                .padding(.vertical,15)
                .padding(.horizontal,15)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .foregroundStyle(.black)
                
                Spacer()
                    .frame(height: 10)
                
                Button{
                    isloginDialog = false
                } label:{
                    Text("Continue")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20,weight: .semibold))
                }
                .frame(maxWidth: .infinity,minHeight: 55)
                .background(.darkBrown)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
                Spacer()
                    .frame(height: 20)
                
                HStack{
                    Text(vm.isLogin ? "Don’t have an account?" : "Already have an account?")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16,weight: .semibold))
                    Text(vm.isLogin ? "Sign up" : "Log in")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20,weight: .semibold))
                }
                .onTapGesture {
                    vm.isLogin = !vm.isLogin
                }
                
            }
            .padding()
            
            
        }
        .frame(height: 450)
        .background(.lightBlack)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        
    }
}


