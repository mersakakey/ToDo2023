//
//  OpenAIView.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/22.
//

import SwiftUI
import OpenAISwift

struct OpenAIView: View {

    @State private var inputText = ""
    @State private var generateAnswerState: GenerateAnswerState = .none

    private let openAI = OpenAISwift(authToken: "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")

    var body: some View {
        VStack {

            Spacer()

            Text(generateAnswerState.resultText)

            Spacer()

            HStack {
                TextField(text: $inputText) {
                    Text("会話したい内容を入力してください")
                }
                .disabled(generateAnswerState.isRequesting)

                // Generate Text Action
                Button {

                    Task {
                        do {
                            generateAnswerState = .requesting

                            let result = try await openAI.sendCompletion(with: inputText,
                                                                         maxTokens: 100)
                            inputText = ""

                            let generatedText = result.choices?.first?.text ?? ""
                            generateAnswerState = .success(text: generatedText)
                        } catch {
                            print("Do some error handling")
                            generateAnswerState = .error(message: "Error")
                        }
                    }

                } label: {
                    Image(systemName: "paperplane")
                }
                .disabled(inputText.isEmpty)
                .disabled(generateAnswerState.isRequesting)
            }
        }
        .padding()
        .overlay {
            if case .requesting = generateAnswerState {
                ProgressView()
            }
        }
    }
}

enum GenerateAnswerState {
    case none
    case success(text: String)
    case error(message: String)
    case requesting

    var isRequesting: Bool {
        if case .requesting = self {
            return true
        }
        return false
    }

    var resultText: String {
        switch self {
        case .none, .requesting:
            return ""
        case let .success(text), let .error(text):
            return text
        }
    }
}
