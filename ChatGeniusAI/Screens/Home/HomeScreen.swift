//
//  HomeScreen.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var vm = HomeViewModel()
    @State private var keyboard = KeyboardResponder()
    
    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20,height: 20)
                    
                    Spacer()
                    
                    
                }
                .padding(.horizontal,10)
                
                Spacer()
                    .frame(height: 10)
                
                Divider()
                    .frame(minHeight: 2)
                    .background(.white)
                
                VStack(alignment:.center,spacing:30){
                    
                    GptTab()
                    
                    Text("We answer all your questions and offer a wide range of services.")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14,weight: .bold))
                    
                    Image("home-pic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 240,height: 240)
                    
                    Text("Creative writing, role-playing, ider generation, learning and tutoring, language translation,conversational interaction, programming support, professional assistance, lifestyle advice,and entertainment.")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14,weight: .semibold))
                    
                    VStack(spacing:10){
                        HStack{
                            TextField("", text: $vm.msgText,
                                      prompt:
                                        Text("Send a message")
                                .foregroundStyle(.black))
                            Image("voice")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                            Image("send")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                        }
                        .padding(.vertical,15)
                        .padding(.horizontal,15)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundStyle(.black)
                        
                        Text("ChatGenius AI may produce inaccurate information about people, places, or facts.")
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 13))
                    }
                    
                    
                    
                    
                }
                .padding()
                
                
                
            }
            .opacity(vm.isLoginDialog ? 0.2 : 1)
            .blur(radius: vm.isLoginDialog ? 1 : 0)
            .disabled(vm.isLoginDialog)
            
            if vm.isLoginDialog{
                LoginDialog(isloginDialog: $vm.isLoginDialog)
            }
            
        }
        .animation(.easeOut(duration: 0.3), value: keyboard.currentHeight)
        
    }
}

#Preview {
    HomeScreen()
}
