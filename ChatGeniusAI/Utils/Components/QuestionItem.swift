//
//  QuestionItem.swift
//  ChatGeniusAI
//
//  Created by Apple on 11/10/2024.
//

import SwiftUI

struct QuestionItem: View {
    
    @State var isFirstQuestionShowing = false
    
    var question:String
    var answer:String
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text( question)
                    .foregroundStyle(.white)
                    .font(.system(size: 20,weight: .semibold))
                
                
                Spacer()
                
                
                Image(systemName: isFirstQuestionShowing ?  "chevron.up" : "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:15,height: 15)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        isFirstQuestionShowing.toggle()
                    }
            }
            if isFirstQuestionShowing{
                Text(answer)
                    .foregroundStyle(.white)
                    .font(.system(size: 15,weight: .medium))
            }
            
            
        }
        .padding()
        .border(.white,width: 1)
    }
}
