//
//  QuestionList.swift
//  ChatGeniusAI
//
//  Created by Apple on 13/10/2024.
//

import SwiftUI

struct QuestionList: View {
    
    var listOfQA : [[String]]
    
    var body: some View {
        ForEach(listOfQA, id: \.self) { qa in
            QuestionItem(question: qa[0], answer: qa[1])
        }
    }
}

