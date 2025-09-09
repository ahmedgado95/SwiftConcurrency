//
//  ActorsViewManger.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 09/09/2025.
//

import Foundation

//  Race Data
class RaceDataViewManger {
    static let instance = RaceDataViewManger()
    private init() {}
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        return data.randomElement()
    }
    
    
    //   how can solve Race Data Without Actor ?
    
    private let lock: DispatchQueue = .init(label: "com.ahmedgado.queue")
    
    func getRandomDataWithQueue(complition: @escaping (_ title: String?) -> ()) {
        lock.async {
            self.data.append(UUID().uuidString)
            complition(self.data.randomElement())
        }
    }
}

// solve Race Data With Actor

actor ActorsViewManger {
    static let instance = ActorsViewManger()
    private init() {}
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        return data.randomElement()
    }
    
    // if you dont need use it in task and cant use any item from actor here like data or getRandomData becouse it isolated
    nonisolated func getRandomDataWithoutTask() -> String {
        return "Gado"
    }
}
