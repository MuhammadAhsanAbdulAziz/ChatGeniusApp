//
//  gptLabelTab.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import SwiftUI

struct GptLabel: View {
    
    var text:String
    var image:String
    var bgColor:UIColor
    var textColor:UIColor
    
    
    var body: some View {
        Label {
            Text(text)
                .foregroundStyle(Color(textColor))
                .font(.system(size: 10))
                .padding(.trailing,5)
        } icon: {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading,5)
        }
        .frame(minHeight: 40)
        .background(Color(bgColor))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    GptLabel(text: "",image: "",bgColor: .white, textColor: .gray)
}
