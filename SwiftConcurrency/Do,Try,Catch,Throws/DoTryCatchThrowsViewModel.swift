//
//  DoTryCatchThrowsViewModel.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 21/08/2025.
//

import Foundation

class DoTryCatchThrowsViewModel : ObservableObject {
    
    @Published var text : String = ""
    let manger = DoTryCatchThrowsManger()
    
    func featchText() {
        //        let name = manger.getNameOptinal()
        //        if let name = name {
        //            text = name
        //        }
        
        
        //        let name = manger.getNameOptinalWithError()
        //        if let name = name.0 {
        //            text = name
        //        }else {
        //            text = name.1?.localizedDescription ?? ""
        //        }
        
        //        let name = manger.getNameWithResult()
        //        switch name {
        //        case .success(let name):
        //            self.text = name
        //        case .failure(let error):
        //            self.text = error.localizedDescription
        //        }
        
        //        do {
        //            let name = try manger.getNameWithThrow()
        //            text = name
        //        } catch {
        //            text = error.localizedDescription
        //        }
        
        //        do {
        //            let name = try manger.getNameWithThrowError()
        //            text = name
        //            let nameSuccess = try manger.getNameWithThrowSuccess()
        //            text = nameSuccess
        //        } catch {
        //            text = error.localizedDescription
        //        }
        
        do {
            let name = try? manger.getNameWithThrowError()
            if let name = name {
                text = name
            }
            let nameSuccess = try manger.getNameWithThrowSuccess()
            text = nameSuccess
        } catch {
            text = error.localizedDescription
        }

        
    }
}
