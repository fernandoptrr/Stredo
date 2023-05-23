//
//  Exercise.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import Foundation

struct Exercise {
    let name: String
    let desc: String
    let duration: TimeInterval

    enum ExerciseEnum: String {
        case neckRot = "Neck Rotation"
        case shoulderRot = "Shoulder Rotations"
        case wristNForearm = "Wrist and Forearm"
        case backwardsArch = "Backwards Arching"
        case heelRaises = "Heel Raises"

        var description: String {
            switch self {
            case .neckRot:
                return "Rotate your neck gently"
            case .shoulderRot:
                return "Rotate your shoulders in a circular motion"
            case .wristNForearm:
                return "Stretch and exercise your wrists and forearms"
            case .backwardsArch:
                return "Arch your back backwards for a stretch"
            case .heelRaises:
                return "Raise your heels off the ground and lower them back down"
            }
        }
    }
}

extension Exercise {
    static let exercises = [
        Exercise(name: ExerciseEnum.neckRot.rawValue, desc: ExerciseEnum.neckRot.description, duration: 5),
        Exercise(name: ExerciseEnum.shoulderRot.rawValue, desc: ExerciseEnum.shoulderRot.description, duration: 5),
        Exercise(name: ExerciseEnum.wristNForearm.rawValue, desc: ExerciseEnum.wristNForearm.description, duration: 5),
        Exercise(name: ExerciseEnum.backwardsArch.rawValue, desc: ExerciseEnum.backwardsArch.description, duration: 5),
        Exercise(name: ExerciseEnum.heelRaises.rawValue, desc: ExerciseEnum.heelRaises.description, duration: 5)
    ]
}

