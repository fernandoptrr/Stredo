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

    enum ExerciseEnum: String {
        case neckRotR = "Right Neck Rotation"
        case neckRotL = "Left Neck Rotation"
        case neckStretchR = "Right Neck Stretch"
        case neckStretchL = "Left Neck Stretch"
        case ssbR = "Right Standing Side Bend"
        case ssbL = "Left Standing Side Bend"
        case flexor = "Shoulder Rotations"
        case fb = "Forward Bend"
        case co = "Chest Opener"
    }
}

extension Exercise {
    static let exercises = [
        Exercise(
            name: ExerciseEnum.neckRotR.rawValue,
            duration: 5,
            images: ["neckRot_1", "neckRot_2"]
        ),
        Exercise(
            name: ExerciseEnum.neckRotL.rawValue,
            duration: 5,
            images: ["neckRot_1", "neckRot_3"]
        ),
        Exercise(
            name: ExerciseEnum.neckStretchR.rawValue,
            duration: 5,
            images: ["neckStretch_1", "neckStretch_2"]
        ),
        Exercise(
            name: ExerciseEnum.neckStretchL.rawValue,
            duration: 5,
            images: ["neckStretch_3", "neckStretch_4"]
        ),
        Exercise(
            name: ExerciseEnum.flexor.rawValue,
            duration: 5,
            images: ["flexor_1", "flexor_2"]
        ),
        Exercise(
            name: ExerciseEnum.ssbR.rawValue,
            duration: 5,
            images: ["ssb_1"]
        ),
        Exercise(
            name: ExerciseEnum.ssbL.rawValue,
            duration: 5,
            images: ["ssb_2"]
        ),
        Exercise(
            name: ExerciseEnum.fb.rawValue,
            duration: 5,
            images: ["fb"]
        ),
        Exercise(
            name: ExerciseEnum.co.rawValue,
            duration: 5,
            images: ["co"]
        ),
    ]
}

