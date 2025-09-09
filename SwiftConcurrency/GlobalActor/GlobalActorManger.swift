//
//  GlobalActorManger.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 09/09/2025.
//

@globalActor struct GlobalActor {
    static var shared = GlobalActorManger()
}

actor GlobalActorManger {
    // this func dont need to add async becouse it inside actor
    func getNumber() -> [String] {
        return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    }
}
