//
//  ChatModel.swift
//  ChatGeniusAI
//
//  Created by Apple on 17/10/2024.
//

import Foundation

import Foundation

// Define a ChatMessage struct with id, message, and isUser properties.
struct ChatMessage: Identifiable {
    var id = UUID()
    var message: String
    var isUser: Bool
}
