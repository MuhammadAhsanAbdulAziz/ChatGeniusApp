//
//  GptTab.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import SwiftUI

struct GptTab: View {
    
    @State var selectedLabel = 0
    
    var body: some View {
        HStack{
            GptLabel(text: "GPT-3.5", image:selectedLabel == 0 ?  "selectthree" : "unselectthree", bgColor: selectedLabel == 0 ? .white : .app, textColor: selectedLabel == 0 ? .black : .gray)
                .onTapGesture {
                    selectedLabel = 0
                    print(selectedLabel)
                }
            GptLabel(text: "GPT-4", image:selectedLabel == 1 ?  "selectfour" : "unselectfour", bgColor: selectedLabel == 1 ? .white : .app, textColor: selectedLabel == 1 ? .black : .gray)
                .onTapGesture {
                    selectedLabel = 1
                    print(selectedLabel)
                }
            GptLabel(text: "GPT-4o mini", image:selectedLabel == 2 ?  "selectmini" : "unselectmini", bgColor:  selectedLabel == 2 ? .white : .app, textColor: selectedLabel == 2 ? .black : .gray)
                .onTapGesture {
                    selectedLabel = 2
                    
                }
            GptLabel(text: "GPT-4o", image:selectedLabel == 3 ?  "selectai" : "unselectai", bgColor: selectedLabel == 3 ? .white : .app, textColor:selectedLabel == 3 ? .black : .gray)
                .onTapGesture {
                    selectedLabel = 3
                }
            
            
        }
        .frame(maxWidth: .infinity,minHeight: 40)
        .background(Color(.app))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    GptTab()
}
