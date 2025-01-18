//
//  Color.swift
//  Pods
//
//  Created by Quan Nguyen on 16/1/25.
//

import SwiftUI

extension Color {
    static func from(string colorString: String?) -> Color {
        guard let colorString = colorString else {
            return Color.black // Default fallback color
        }

        // Check for basic color names ("black", "blue", "red", etc.)
        if let basicColor = systemColor(for: colorString) {
            return basicColor
        }

        // Check if the string is a valid HEX color ("#423424")
        if let hexColor = Color(hex: colorString) {
            return hexColor
        }

        // Fallback to black if parsing fails
        return Color.black
    }

    // Map predefined color names to system colors
    private static func systemColor(for name: String) -> Color? {
        switch name.lowercased() {
        case "transparent": return .clear
        case "black": return .black
        case "white": return .white
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        case "yellow": return .yellow
        case "gray", "grey": return .gray
        default: return nil // If not found, return nil
        }
    }

    // HEX-to-Color converter (parses hex strings and converts to RGB)
    init?(hex: String) {
        var hexString = hex

        // Remove '#' prefix if present
        if hex.hasPrefix("#") {
            hexString = String(hex.dropFirst())
        }

        // Ensure the hex string is valid (6 characters)
        guard hexString.count == 6 else {
            return nil
        }

        // Convert the hex string to RGB values
        let scanner = Scanner(string: hexString)
        var hexInt: UInt64 = 0
        guard scanner.scanHexInt64(&hexInt) else {
            return nil
        }

        let r = Double((hexInt & 0xFF0000) >> 16) / 255.0
        let g = Double((hexInt & 0x00FF00) >> 8) / 255.0
        let b = Double(hexInt & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
