//
//  Logger.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import Foundation

final class Logger {
    
    static let shared = Logger()
    
    func debug(buffer: Any) {
        #if DEBUG
            self.log(buffer)
        #endif
    }
    private func log(_ buffer: Any) {
        print("-", Date())
        print(">", buffer)
    }
    
}
