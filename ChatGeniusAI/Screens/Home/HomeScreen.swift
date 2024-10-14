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
    @EnvironmentObject var currentVM : CurrentScreenViewModel
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    @State var isLanguageShowing = false
    private var languages : [[String]] = [["en","English","EN"],["france","Francias","FR"],["germany","Deutsch","GR"],["portugal","Protugues","PR"],["arabic","Arabic","AR"],["esponol","Espanol","ES"],["italy","Italiano","IT"]]
    @State private var selectedLanguage: [String] = ["en", "English", "EN"] // Track the selected language
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.lightBlack)
                    .ignoresSafeArea()
                
                VStack{
                    
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
                            CustomTextField(bindingText: $vm.msgText, text: "Send a message", areIconsShowing: true, radius: 8, borderColor: .white,bgColor: .white,textColor: .black,lineNumber: 1)
                            
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
                .padding(.bottom, keyboard.currentHeight / 2)
                
                if vm.isLoginDialog{
                    LoginDialog(isloginDialog: $vm.isLoginDialog)
                }
                
                SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
                
                
            }
            .onAppear{
                currentVM.currentScreen = "home"
            }
            
            .toolbar {
                if !vm.isLoginDialog{
                    if !presentSideMenu{
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                presentSideMenu = true
                            }) {
                                Image("menu")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:30,height: 30)
                            }
                        }
                    }
                }
            }
            
            .toolbarBackground(.app, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .animation(.easeOut(duration: 0.3), value: keyboard.currentHeight)
            
            
        }
        .overlay(alignment: .topTrailing, content: {
            if !vm.isLoginDialog{
                if currentVM.currentScreen != "faq"{
                    VStack(alignment:.leading){
                        HStack{
                            Spacer()
                            
                            LanguageItem(image: selectedLanguage[0], text: selectedLanguage[2], isFull: false)
                                .onTapGesture {
                                    withAnimation {
                                        isLanguageShowing.toggle()
                                    }
                                }
                            
                            Image(systemName: isLanguageShowing ? "chevron.down" : "chevron.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10,height: 10)
                                .padding(.bottom,6)
                                .padding(.trailing,10)
                                .onTapGesture {
                                    withAnimation {
                                        isLanguageShowing.toggle()
                                    }
                                    
                                }
                        }
                        .padding(isLanguageShowing ? .bottom : .top)
                        
                        ScrollView{
                            HStack{
                                VStack(alignment: .leading) {
                                    let filteredLanguages = languages.filter { $0 != selectedLanguage }
                                    LanguageList(languages: filteredLanguages, selectedLanguage: $selectedLanguage, isLanguageShowing: $isLanguageShowing)
                                }
                                Spacer()
                            }
                        }
                        .defaultScrollAnchor(.top)
                        .frame(maxWidth: .infinity)
                        .padding(.leading,10)
                        Spacer()
                        
                    }
                    .frame(width: isLanguageShowing ? 150 : 100,height: isLanguageShowing ? 250 : 30)
                    .background(.white)
                    .padding(.horizontal,10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            
            
        })
        
        
        
        
    }
}

#Preview {
    HomeScreen()
}
