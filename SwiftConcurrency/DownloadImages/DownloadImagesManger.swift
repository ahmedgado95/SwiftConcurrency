//
//  DownloadImagesManger.swift
//  SwiftConcurrency
//
//  Created by ahmed gado on 24/08/2025.
//

import Combine
import UIKit

class DownloadImagesManger {
    
    let url = URL(string: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")!
    
    func handelResponse(data: Data?, respone: URLResponse? ) -> UIImage? {
        guard
            let data = data ,
            let image = UIImage(data: data) ,
            let respone = respone as? HTTPURLResponse,
            (200...399).contains(respone.statusCode) else {
            return nil
        }
        
        return image
    }
    
    func downloadImages(completion: @escaping (UIImage? , Error?) -> Void){
        URLSession.shared.dataTask(with: url) {[weak self] data, respone, error in
            guard let self else { return }
            let image = self.handelResponse(data: data, respone: respone)
            completion(image, error)
        }
        .resume()
    }
    
    func downloadImageWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(handelResponse)
            .mapError({$0})
            .eraseToAnyPublisher()
    }
    
    func downloadImageWithAsync() async throws -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            return handelResponse(data: data, respone: response)
        }
        catch {
            print("error \(error)")
            throw error
        }
    }
}
