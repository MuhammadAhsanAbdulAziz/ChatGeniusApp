//
//  SupportDialog.swift
//  ChatGeniusAI
//
//  Created by Apple on 14/10/2024.
//

import SwiftUI

struct SupportDialog: View {
    
    @State var vm  = SupportViewModel()
    @Binding var isSupportDialogShowing : Bool
    
    var body: some View {
        VStack(alignment:.leading,spacing:20){
            HStack{
                Text("Contact Us" )
                    .foregroundStyle(.white)
                    .font(.system(size: 18,weight: .bold))
                
                Spacer()
                
                Button{
                    withAnimation {
                        isSupportDialogShowing.toggle()
                    }
                } label:{
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 17,height: 17)
                        .foregroundStyle(.gray)
                        .bold()
                        .padding(5)
                }
                .frame(width: 30,height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)  // Apply rounded corners
                        .stroke(.gray, lineWidth: 2)  // White border with line width 2
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            CustomTextField(bindingText: $vm.nameTxt, text: "Name", areIconsShowing: false, radius: 5, borderColor: .white, bgColor: .black, textColor: .white,lineNumber: 1)
            
            
            CustomTextField(bindingText: $vm.emailTxt, text: "Email", areIconsShowing: false, radius: 5, borderColor: .white, bgColor: .black, textColor: .white,lineNumber: 1)
            
            
            CustomTextField(bindingText: $vm.MessageTxt, text: "Message", areIconsShowing: false, radius: 5, borderColor: .white, bgColor: .black, textColor: .white,lineNumber: 7)
            
            Button{
            } label:{
                Text("SEND")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15,weight: .semibold))
            }
            .padding(.horizontal,20)
            .frame(maxWidth:.infinity,minHeight: 55)
            .background(.darkBrown)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .frame(maxWidth: .infinity,maxHeight: 500)
        .padding()
        .background(.app)
        .overlay(
            RoundedRectangle(cornerRadius: 5)  // Apply rounded corners
                .stroke(Color(.gray), lineWidth: 2)  // White border with line width 2
        )
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding()
        
        
        
    }
}
