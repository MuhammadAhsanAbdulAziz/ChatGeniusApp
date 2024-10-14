//
//  LanguageItem.swift
//  ChatGeniusAI
//
//  Created by Apple on 13/10/2024.
//

import SwiftUI

struct LanguageItem: View {
    
    var image:String
    var text:String
    var isFull:Bool
    
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)

            Text(text)
                .font(.system(size: isFull ?  16 : 14))
                .bold()
                .padding(.trailing,5)
        }
    }
}

