//
//  Bundle+.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/09.
//

import Foundation

// a5a3e588ff0d69df530f226864a848aa

extension Bundle {
    
    var apiKey: String {
        // forResource에다 plist 파일 이름을 입력해주세요.
        guard let filePath = Bundle.main.path(forResource: "SecureAPIKeys", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't find file 'SecureAPIKeys.plist'.")
        }
        
        // plist 안쪽에 만들 Key값을 입력해주세요.
        guard let value = plist.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_Key' in 'SecureAPIKeys.plist'.")
        }        
        return value
    }
}

