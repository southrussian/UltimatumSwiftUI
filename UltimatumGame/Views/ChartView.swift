//
//  ChartView.swift
//  UltimatumGame
//
//  Created by Danil Peregorodiev on 22.02.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    @EnvironmentObject var game: Game
    var body: some View {
        Chart {
            ForEach(game.nashHistoryStruct) { nash in
                LineMark(x: PlottableValue.value("", nash.index), y: PlottableValue.value("nash", nash.nashValue ?? 0))
                    .interpolationMethod(.catmullRom)
            }
            
        }
        .frame(width: 250, height: 250)
    }
}

#Preview {
    ChartView()
}
