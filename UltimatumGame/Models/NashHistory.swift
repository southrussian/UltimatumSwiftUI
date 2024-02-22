//
//  NashHistory.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 22.02.2024.
//

import Foundation

struct NashHistory: Identifiable {
    var id: String =  UUID().uuidString
    var nashValue: Double?
    var index: Int
    
//    var indexString: String {
//            return String(index)
//        }
}

struct TableNash: Identifiable {
    let id = UUID()
    let firstNash: Double?
    let secondNash: Double?
    let firstNil: Double
    let secondNil: Double
    
    var fullNash: String { String("\(firstNash ?? 0), \(secondNash ?? 0)")  }
    var fullnil: String { String("\(firstNil), \(secondNil)") }
}
