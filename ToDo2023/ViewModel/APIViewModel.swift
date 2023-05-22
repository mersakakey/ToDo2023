//
//  APIViewModel.swift
//  ToDo2023
//
//  Created by Takeru Sakakibara on 2023/05/15.
//

import Foundation

//GithubのAPIのテストに使ったVM（現在は使用してない）

final class ConcurrencyViewViewModel: ObservableObject {
    @Published private(set) var designPhilosophy = "now loading..."
    private let model = APIModel()
    
    // @MainActorを付与して、MainActor（メインスレッド）で実行されることを保証する
    @MainActor
    func fetch() async {
        self.designPhilosophy = await model.fetchDesignPhilosophy() ?? ""
    }
}
