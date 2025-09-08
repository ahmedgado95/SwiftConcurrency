//
//  ContinuationsViewManger.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 08/09/2025.
//

import UIKit

class ContinuationsViewManger {
    
    func featchImage(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url , delegate: nil)
            return data
        }
        catch {
            throw error
        }
    }
    
    func featchImageWithContinuation(url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data {
                    continuation.resume(returning: data)
                }else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getSystemImage(completion: @escaping (_ image: UIImage) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let systemImage = UIImage(systemName: "plus") {
                completion(systemImage)
            }
        }
    }
    
    func getSystemImageWithContinuation() async  -> UIImage {
        await withCheckedContinuation { continuation in
            getSystemImage { image in
                continuation.resume(returning: image)
            }
        }
    }

}

