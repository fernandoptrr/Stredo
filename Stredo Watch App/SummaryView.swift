//
//  SummaryView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import Foundation
import HealthKit
import SwiftUI
import WatchKit

struct SummaryView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @Environment(\.dismiss) var dismiss
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    var body: some View {
        if stretchingManager.workout == nil {
            ProgressView("Saving Exercise")
                .navigationBarHidden(true)
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    SummaryMetricView(title: "Total Time",
                                      value: durationFormatter.string(from: stretchingManager.workout?.duration ?? 0.0) ?? "")
                    .foregroundStyle(.yellow)
                    SummaryMetricView(title: "Avg. Heart Rate",
                                      value: stretchingManager.averageHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
                    .foregroundStyle(.red)

                    SummaryMetricView(title: "Total Energy",
                                      value: Measurement(value: stretchingManager.workout?.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0,
                                                         unit: UnitEnergy.kilocalories)
                                        .formatted(.measurement(width: .abbreviated,
                                                                usage: .workout,
                                                                numberFormatStyle: .number.precision(.fractionLength(0)))))
                    .foregroundStyle(.green)
                    SummaryMetricView(title: "Stand Time", value: "11:02")
                    .foregroundStyle(.pink)
                    Text("Activity Rings")
                    ActivityRingsView(healthStore: stretchingManager.healthStore)
                        .frame(width: 50, height: 50)
                    Button("Done") {
                        dismiss()
                    }
                }
                .scenePadding()
            }
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
            .environmentObject(StretchingManager())
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
            .foregroundStyle(.foreground)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        Divider()
    }
}

