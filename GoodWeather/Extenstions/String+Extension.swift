//
//  String+Extension.swift
//  GoodWeather
//
//  Created by JINSEOK on 2023/02/11.
//

import Foundation

extension String {
    
    var escape: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
}
