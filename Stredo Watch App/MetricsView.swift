//
//  MetricsView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI
import HealthKit

struct MetricsView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    
    var formattedStandTime: String {
        let minutes = Int(stretchingManager.standTime) / 60
        let seconds = Int(stretchingManager.standTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        TimelineView(
            MetricsTimelineSchedule(
                from: stretchingManager.builder?.startDate ?? Date(),
                isPaused: stretchingManager.session?.state == .paused))
        { context in
            VStack(alignment: .leading) {
                ElapsedTimeView(elapsedTime: stretchingManager.builder?.elapsedTime(at: context.date) ?? 0, showSubseconds: context.cadence == .live)
                    .foregroundStyle(.yellow)
                Text(Measurement(value: stretchingManager.activeEnergy, unit: UnitEnergy.kilocalories)
                    .formatted(.measurement(width: .abbreviated, usage: .workout, numberFormatStyle: .number.precision(.fractionLength(0)))))
                Text(stretchingManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
                Text(stretchingManager.standTime.formatted(.number.precision(.fractionLength(0))))
            }
            .font(.system(.title, design: .rounded).monospacedDigit().lowercaseSmallCaps())
            .frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea(edges: .bottom)
            .scenePadding()
        }
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView().environmentObject(StretchingManager())
    }
}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date
    var isPaused: Bool
    
    init(from startDate: Date, isPaused: Bool) {
        self.startDate = startDate
        self.isPaused = isPaused
    }
    
    func entries(from startDate: Date, mode: TimelineScheduleMode) -> AnyIterator<Date> {
        var baseSchedule = PeriodicTimelineSchedule(from: self.startDate,
                                                    by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
        
        return AnyIterator<Date> {
            guard !isPaused else { return nil }
            return baseSchedule.next()
        }
    }
}
