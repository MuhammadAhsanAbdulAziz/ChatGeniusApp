//
//  CustomTextField.swift
//  ChatGeniusAI
//
//  Created by Apple on 14/10/2024.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var bindingText:String
    var text : String
    var areIconsShowing:Bool
    var radius : CGFloat
    var borderColor : UIColor
    var bgColor : UIColor
    var textColor : UIColor
    var lineNumber : Int
    
    var body: some View {
        HStack{
            TextField("", text: $bindingText, prompt:
                        Text(text)
                .font(.system(size: 15))
                .foregroundStyle(Color(textColor)), axis: .vertical
            )
            .lineLimit(lineNumber, reservesSpace: true)
            .foregroundStyle(.white)
            if areIconsShowing {
                Image("voice")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25,height: 25)
                Image("send")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25,height: 25)
            }
        }
        .keyboardType(.emailAddress)
        .padding(.vertical,15)
        .padding(.horizontal,15)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .background(Color(bgColor))
        .overlay(
            RoundedRectangle(cornerRadius: radius)  // Apply rounded corners
                .stroke(Color(borderColor), lineWidth: 2)  // White border with line width 2
        )
        .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}
