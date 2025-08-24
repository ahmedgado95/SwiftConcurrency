//
//  DoTryCatchThrowsManger.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 21/08/2025.
//

import Foundation

class DoTryCatchThrowsManger {
    
    private var hasName: Bool = false
    
    func getName() -> String {
        "Gado"
    }
    
    func getNameOptinal() -> String? {
        if hasName {
            return "Gado"
        }else {
            return nil
        }
    }
    
    
    func getNameOptinalWithError() -> (String?, Error?) {
        if hasName {
            return ("Gado", nil)
        }else {
            return (nil , URLError(.unknown))
        }
    }
    
    func getNameWithResult() -> Result<String, Error> {
        if hasName {
            return .success("gado")
        }else {
            return .failure(URLError(.unknown))
        }
    }
    
    func getNameWithThrow() throws ->  String {
        if hasName {
            return "Gado"
        }else {
            throw URLError(.unknown)
        }
    }
    
    func getNameWithThrowError() throws ->  String {
            throw URLError(.unknown)
    }
    
    func getNameWithThrowSuccess() throws ->  String {
        return "Gado"
    }
}
