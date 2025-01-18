//
//  AnimatedNumberViewModel.swift
//  Pods
//
//  Created by Quan Nguyen on 16/1/25.
//

import SwiftUI

class AnimatedNumberViewModel: ObservableObject {
    @Published var number: Double = 0.0 // The number to display
    @Published var displayDecimal: Bool = false // The number to display
    @Published var unit: String = "" // The unit string (e.g., kg, lbs, %)
    @Published var style: [String: Any]? = nil // Outer container styling
    @Published var numberStyle: [String: Any]? = nil // Number-specific styling
    @Published var unitStyle: [String: Any]? = nil // Unit-specific styling
}
