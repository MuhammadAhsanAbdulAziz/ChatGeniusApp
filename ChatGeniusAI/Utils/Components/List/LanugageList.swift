//
//  LanugageList.swift
//  ChatGeniusAI
//
//  Created by Apple on 13/10/2024.
//

import SwiftUI

struct LanguageList: View {
    
    var languages: [[String]]
    @Binding var selectedLanguage: [String] // Binding to the selected language
    @Binding var isLanguageShowing: Bool
    
    var body: some View {
        ForEach(languages, id: \.self) { lang in
            LanguageItem(image: lang[0], text: lang[1], isFull: true)
                .onTapGesture {
                    selectedLanguage = lang
                    withAnimation {
                        isLanguageShowing.toggle()
                    }
                }
        }
    }
}
