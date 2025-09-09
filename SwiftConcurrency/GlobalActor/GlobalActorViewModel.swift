//
//  GlobalActorViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 09/09/2025.
//

import Combine

class GlobalActorViewModel: ObservableObject {
    @Published var numbers : [String] = []
    
    let manger = GlobalActor.shared
    
    @GlobalActor // this will remove warning when run app becouse it like on MainActor.run
    func fetchNumbers() {
        Task {
            numbers = await manger.getNumber()
        }
    }
    
}
