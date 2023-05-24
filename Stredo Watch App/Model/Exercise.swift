//
//  Exercise.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import Foundation

struct Exercise {
    let name: String
    let duration: TimeInterval
    let images: [String]
    let desc: String

    enum ExerciseEnum: String {
        case neckRotR = "Right Neck Rotation"
        case neckRotL = "Left Neck Rotation"
        case neckStretchR = "Right Neck Stretch"
        case neckStretchL = "Left Neck Stretch"
        case ssbR = "Right Standing Side Bend"
        case ssbL = "Left Standing Side Bend"
        case fabR = "Right Forearm Bend"
        case fabL = "Left Forearm Bend"
        case fb = "Forward Bend"
        case co = "Chest Opener"

        var description: String {
            switch self {
            case .neckRotR:
                return "Gently rotate your neck to the right."
            case .neckRotL:
                return "Gently rotate your neck to the left."
            case .neckStretchR:
                return "Stretch your neck muscles on the right side."
            case .neckStretchL:
                return "Stretch your neck muscles on the left side."
            case .ssbR:
                return "Bend to the right side while standing."
            case .ssbL:
                return "Bend to the left side while standing."
            case .fabR:
                return "Bend your right wrist up and down to stretch the forearm."
            case .fabL:
                return "Bend your left wrist up and down to stretch the forearm."
            case .fb:
                return "Bend forward at your waist with a straight back."
            case .co:
                return "Open up your chest by stretching your arms wide."
            }
        }
    }
}


extension Exercise {
    static let exercises = [
        Exercise(
            name: ExerciseEnum.neckRotR.rawValue,
            duration: 8,
            images: ["neckRot_1", "neckRot_2"],
            desc: ExerciseEnum.neckRotR.description
        ),
        Exercise(
            name: ExerciseEnum.neckRotL.rawValue,
            duration: 8,
            images: ["neckRot_1", "neckRot_3"],
            desc: ExerciseEnum.neckRotL.description
        ),
        Exercise(
            name: ExerciseEnum.neckStretchR.rawValue,
            duration: 8,
            images: ["neckStretch_1", "neckStretch_2"],
            desc: ExerciseEnum.neckStretchR.description
        ),
        Exercise(
            name: ExerciseEnum.neckStretchL.rawValue,
            duration: 8,
            images: ["neckStretch_3", "neckStretch_4"],
            desc: ExerciseEnum.neckStretchL.description
        ),
        Exercise(
            name: ExerciseEnum.fabR.rawValue,
            duration: 16,
            images: ["flexor_1", "flexor_2"],
            desc: ExerciseEnum.fabR.description
        ),
        Exercise(
            name: ExerciseEnum.fabL.rawValue,
            duration: 16,
            images: ["flexor_1", "flexor_2"],
            desc: ExerciseEnum.fabL.description
        ),
        Exercise(
            name: ExerciseEnum.ssbR.rawValue,
            duration: 8,
            images: ["ssb_1"],
            desc: ExerciseEnum.ssbR.description
        ),
        Exercise(
            name: ExerciseEnum.ssbL.rawValue,
            duration: 8,
            images: ["ssb_2"],
            desc: ExerciseEnum.ssbL.description
        ),
        Exercise(
            name: ExerciseEnum.fb.rawValue,
            duration: 16,
            images: ["fb"],
            desc: ExerciseEnum.fb.description
        ),
        Exercise(
            name: ExerciseEnum.co.rawValue,
            duration: 16,
            images: ["co"],
            desc: ExerciseEnum.co.description
        ),
    ]
}
