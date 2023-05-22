//
//  APIModel.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/15.
//

import Foundation

final class APIModel {
    private let urlString = "https://api.github.com/zen"

    // APIのレスポンスを非同期で返すため、asyncで定義
    func fetchDesignPhilosophy() async -> String? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            // data(from:delegate:)はasyncメソッドのため、呼び出し時に await が必要
            let (data, _) = try await URLSession.shared.data(from: url)
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
