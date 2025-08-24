//
//  AsyncAwaitViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 24/08/2025.
//

import Foundation

class AsyncAwaitViewModel: ObservableObject {
    @Published var nameList : [String] = []
    
    func fetchName() {
        // background thread
        DispatchQueue.global().asyncAfter(deadline: .now() + 3){[weak self] in
            self?.nameList.append(" global asyncAfter --> \(Thread.current)")
            // main thread
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {[weak self] in
                self?.nameList.append("main into global asyncAfter --> \(Thread.current)")
            }
        }
        
        // current thread
        nameList.append("Gado -> \(Thread.current)")
        
        // main thread
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {[weak self] in
            self?.nameList.append("main asyncAfter --> \(Thread.current)")
        }
        
    }
    
    func fetchName() async {
        /* Maybe Main or Background depend on call
         if it main  like this
         Task {
         await fetchName()
         }
         and if it Background like this
         Task.detached {
         await fetchName()
         }
         */
        let name = "Current Thread : \(Thread.current)"
        nameList.append(name)
        
        // suspend task for 2 seconds Dont close thread but stop task itself
        try? await Task.sleep(for: .seconds(2))
        
        // complete on the same thread if it main or background
        let secondName = "Second Thread : \(Thread.current)"
        
        // MainActor mean code work on Main Thread
        await MainActor.run {
            nameList.append(secondName)
            
            let thirdName = "Third Thread : \(Thread.current)"
            nameList.append(thirdName)
        }
        
    }
    
    func fetchSecondName() async {
        
        try? await Task.sleep(for: .seconds(3))
        let secondName = "Fourth Thread : \(Thread.current)"
        
        await MainActor.run {
            nameList.append(secondName)
            
            let thirdName = "Fifth Thread : \(Thread.current)"
            nameList.append(thirdName)
        }
    }
}
