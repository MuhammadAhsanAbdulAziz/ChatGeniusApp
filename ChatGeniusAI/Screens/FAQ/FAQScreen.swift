//
//  FAQScreen.swift
//  ChatGeniusAI
//
//  Created by Apple on 11/10/2024.
//

import SwiftUI

struct FAQScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var currentVM : CurrentScreenViewModel
    @State var vm = FAQViewModel()
    let listOfQA: [[String]] = [
        ["What is Chat Genius AI?", "Chat Genius AI is an advanced artificial intelligence platform designed to assist users with a wide range of tasks, including creative writing, role-playing, idea generation, learning and tutoring, language translation, conversational interaction, programming support, professional assistance, lifestyle advice, and entertainment."],
        ["How do I access Chat Genius AI?", "You can access Chat Genius AI by downloading the app from the App Store or Google Play Store and creating an account. Once logged in, you can start interacting with the AI."],
        ["How does the language selector work?","The language selector allows users to choose their preferred language for interacting with Chat Genius AI. Users can select from a variety of languages to customize their experience."],
        ["What is the voice-to-text feature?","The voice-to-text feature converts spoken words into written text in real time."],
        ["How do I enable dark mode?","To enable dark mode, navigate to the app settings and look for the “Appearance” or “Theme” option. From there, you can switch to dark mode for a more comfortable viewing experience in low-light environments."],
        ["How can I get further assistance or support?","If you have any additional questions or need further assistance, please don’t hesitate to contact our support team! We’re here to help!"]
    ]
    
    
    var body: some View {
        ZStack{
            Color(.lightBlack)
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment:.center){
                    HStack{
                        Text("Support & Help Center" )
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25,weight: .bold))
                        
                        Spacer()
                            .frame(width: 30)
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15,height: 15)
                            .foregroundStyle(.white)
                            .bold()
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    
                    VStack(alignment:.center,spacing: 20){
                        Text("Privacy Policy and Terms of Service" )
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 23,weight: .medium))
                        Text("Review our Privacy Policy and Terms of Service to understand how we handle your data and usage of Chat Genius AI" )
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 13,weight: .medium))
                        
                        Button{
                        } label:{
                            Text("View Privacy Policy")
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 20,weight: .semibold))
                        }
                        .padding(.horizontal,20)
                        .frame(minHeight: 55)
                        .background(.darkBrown)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width:330)
                    
                    .background(Color.black)  // Optional, to ensure the background stays transparent
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)  // Apply rounded corners
                            .stroke(Color.gray, lineWidth: 2)  // White border with line width 2
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment:.leading,spacing: 20){
                        Text("Still have questions?" )
                            .foregroundStyle(.white)
                            .font(.system(size: 23,weight: .medium))
                        Text("We’re committed to providing the answers you need. Don’t hesitate to reach out!" )
                            .foregroundStyle(.white)
                            .font(.system(size: 13,weight: .medium))
                        
                        CustomTextField(bindingText: $vm.emailTxt, text: "Email Address",areIconsShowing: false,radius: 5,borderColor: .darkBrown,bgColor: .black,textColor: .white,lineNumber: 1)
                        
                        HStack{
                            CustomTextField(bindingText: $vm.queryTxt, text: "How can we help you?",areIconsShowing: false,radius: 5,borderColor: .darkBrown,bgColor: .black,textColor: .white,lineNumber: 1)
                            
                            Button {
                                // Button action
                            } label: {
                                Image("send")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(.white)
                                    .padding(10)
                            }
                            .frame(width: 50, height: 50)
                            .background(Color.darkBrown)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            
                            
                            
                        }
                        
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width:330)
                    
                    .background(Color.black)  // Optional, to ensure the background stays transparent
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)  // Apply rounded corners
                            .stroke(Color.gray, lineWidth: 2)  // White border with line width 2
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment:.leading,spacing: 20){
                        Text("General FAQs" )
                            .foregroundStyle(.white)
                            .font(.system(size: 23,weight: .bold))
                        
                        QuestionList(listOfQA: listOfQA)
                        
                    }
                    .padding(.vertical,20)
                    .padding(.horizontal,35)
                    
                }
            }
            
            
        }
        .onAppear{
            currentVM.currentScreen = "faq"
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FAQScreen()
}
