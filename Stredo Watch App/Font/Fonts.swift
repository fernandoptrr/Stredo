//
//  Fonts.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 24/05/23.
//

import SwiftUI

struct FontProvider {
    enum FontType: String {
        case nunito = "Nunito ExtraLight"
    }

    enum FontSize: CGFloat {
        case largeTitle = 34
        case title = 28
        case title2 = 22
        case title3 = 20
        case body = 17
        case callout = 16
        case subheadline = 15
        case footnote = 13
        case caption = 12
        case caption2 = 11
    }

    static func custom(_ font: FontType, size: FontSize) -> Font {
        return Font.custom(font.rawValue, size: size.rawValue)
    }

    static func custom(_ font: FontType, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
}

