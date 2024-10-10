//
//  KeyboardResponder.swift
//  ChatGeniusAI
//
//  Created by Apple on 10/10/2024.
//

import SwiftUI
import Combine

@Observable class KeyboardResponder {
     var currentHeight: CGFloat = 0
    private var cancellable: AnyCancellable?

    init() {
        cancellable = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
            .compactMap { notification in
                if notification.name == UIResponder.keyboardWillHideNotification {
                    return CGFloat(0)
                } else {
                    return (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height
                }
            }
            .assign(to: \.currentHeight, on: self)
    }

    deinit {
        cancellable?.cancel()
    }
}
