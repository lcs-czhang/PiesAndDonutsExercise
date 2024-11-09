//
//  ContentView.swift
//  PiesAndDonutsExercise
//
//  Created by Yuzhou Zhang on 2024-11-08.
//

import SwiftUI
import Charts

struct ContentView: View {
    private var percentageStudentsByHouse = [
        (name: "Matthews", count: 120),
        (name: "Ross", count: 202),
        (name: "Moddie", count: 678),
        (name: "Parent", count: 776),
        (name: "Ondaatje", count: 432),
        (name: "Upland", count: 423),
        (name: "Colebrook", count: 543),
        (name: "Cooper", count: 722),
        (name: "Memorial", count: 636),
        (name: "Grove", count: 456),
        (name: "Rashleigh", count: 647),
        (name: "Ryder", count: 167)
    ]
    @State private var selectedCount: Double?
    @State private var selectedSector: String?
    var body: some View {
        Chart {
            ForEach(percentageStudentsByHouse, id: \.name) { student in

                SectorMark(
                    angle: .value("Studets", student.count),
                    innerRadius: .ratio(0.65),
                    angularInset: 2.0
                )
                .foregroundStyle(by: .value("Type", student.name))
                .cornerRadius(10.0)
                .annotation(position: .overlay) {
                    Text("\(student.count)")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                .opacity(selectedSector == nil ? 1.0 : (selectedSector == student.name ? 1.0 : 0.5))
            }
        }
        .frame(height: 500)
    }
}

#Preview {
    ContentView()
}
