//
//  Webservice.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}


final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(resource.parse(data))
            }
            
        }.resume()
    }
}
