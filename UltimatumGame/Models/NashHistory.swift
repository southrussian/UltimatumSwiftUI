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
}
