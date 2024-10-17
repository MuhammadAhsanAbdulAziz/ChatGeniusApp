import Foundation
import OpenAISwift

final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = [] // Published property for chat messages

    private var openAI: OpenAISwift?

    init() {}

    func setupOpenAI() {
         openAI = OpenAISwift(authToken: "TOKEN")

// Initialize OpenAI
        
        if openAI == nil {
            print("Error: OpenAI is not initialized.")
        } else {
            print("Success: OpenAI is initialized.")
        }
    }

    func sendUserMessage(_ message: String) {
        let userMessage = ChatMessage(message: message, isUser: true)
        messages.append(userMessage) // Append user message to chat history

        guard let openAI = openAI else {
            print("Error: OpenAI instance is not initialized.")
            return
        }

        print("Sending message to OpenAI: \(message)") // Log the outgoing message

//        openAI.sendCompletion(with: message) { [weak self] result in
//            switch result {
//            case .success(let model):
//                if let response = model.choices?.first?.text {
//                    DispatchQueue.main.async {
//                        print("Received response from OpenAI: \(response)")
//                        self?.receiveBotMessage(response.trimmingCharacters(in: .whitespacesAndNewlines)) // Handle bot's response
//                    }
//                } else {
//                    print("Error: No response choices found.")
//                }
//            case .failure(let error):
//                print("Error: Failed to send message to OpenAI. \(error.localizedDescription)")
//            }
//        }
        
        openAI.sendCompletion(with: "Hello how are you") { result in // Result<OpenAI, OpenAIError>
            switch result {
            case .success(let success):
                print(success.choices?.first?.text ?? "")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    private func receiveBotMessage(_ message: String) {
        let botMessage = ChatMessage(message: message, isUser: false)
        DispatchQueue.main.async {
            self.messages.append(botMessage) // Append bot message to chat history
        }
    }
}
