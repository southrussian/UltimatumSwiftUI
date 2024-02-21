//
//  UltimatumGameApp.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 17.02.2024.
//

import SwiftUI

@main
struct UltimatumGameApp: App {
    @ObservedObject var game = Game()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
