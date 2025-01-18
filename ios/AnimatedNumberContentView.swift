//
//  AnimatedNumberContentView.swift
//  Pods
//
//  Created by Quan Nguyen on 16/1/25.
//

import SwiftUI


@available(iOS 17.0, *)
struct AnimatedNumberContentView: View {
  @StateObject var viewModel: AnimatedNumberViewModel
  
  var body: some View {
    // Parse styles
    let styleParser = StyleParser(style: viewModel.style)
    let backgroundColor = styleParser.backgroundColor
    let cornerRadius = styleParser.cornerRadius
    let padding = styleParser.padding
      
    HStack() {
      // Styles for Number
      let numFont = TextStyle.from(viewModel.numberStyle).font ?? Font.largeTitle.bold()
      let numColor = TextStyle.from(viewModel.numberStyle).color ?? "black"
      
      // Number Text
      let num = viewModel.number.isNaN ? 0 : viewModel.number
      
      let formattedNumber = viewModel.displayDecimal ? "\(num)" : String(format: "%.0f", num)

      Text(formattedNumber)
        .font(numFont)
        .contentTransition(.numericText(value: num)) // Smooth numeric transition
        .animation(.snappy, value: num)          // Snappy animation
        .foregroundStyle(Color.from(string: numColor))
        
        // Styles for Unit
        let unitFont = TextStyle.from(viewModel.unitStyle).font ?? Font.largeTitle.bold()
        let unitColor = TextStyle.from(viewModel.unitStyle).color ?? "black"
        
        // Unit Text
        Text(viewModel.unit)
          .font(unitFont)
          .foregroundStyle(Color.from(string: unitColor))
    }
    .padding(padding) // Apply padding INSIDE the view
    .background(backgroundColor) // Background color
    .cornerRadius(cornerRadius) // Rounded corners
  }
  
  
  // Helper for parsing styles
  struct StyleParser {
    private let style: [String: Any]?
    
    init(style: [String: Any]?) {
        self.style = style
    }
    
    // Background Color
    var backgroundColor: Color {
        let bgColor = style?["backgroundColor"] as? String ?? "transparent"
        return Color.from(string: bgColor)
    }
    
    // Corner Radius
    var cornerRadius: CGFloat {
        return style?["borderRadius"] as? CGFloat ?? 0.0
    }
      
    // Padding as EdgeInsets
    var padding: EdgeInsets {
        let top = styleValue(forKey: "paddingTop", fallbackKeys: ["paddingVertical", "padding"])
        let bottom = styleValue(forKey: "paddingBottom", fallbackKeys: ["paddingVertical", "padding"])
        let left = styleValue(forKey: "paddingLeft", fallbackKeys: ["paddingHorizontal", "padding"])
        let right = styleValue(forKey: "paddingRight", fallbackKeys: ["paddingHorizontal", "padding"])
        
        return EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
      
    // Helper function to extract values
    private func styleValue(forKey key: String, fallbackKeys: [String]) -> CGFloat {
        if let value = style?[key] as? CGFloat {
            return value
        }
        for fallbackKey in fallbackKeys {
            if let value = style?[fallbackKey] as? CGFloat {
                return value
            }
        }
        return 0.0
    }
  }
  
  // Helper struct for text styles
  struct TextStyle {
    var font: Font?
    var color: String?
    
    static func from(_ style: [String: Any]?) -> TextStyle {
        guard let style = style else { return TextStyle() }
        var textStyle = TextStyle()
        
        // Parse fontSize
        if let fontSize = style["fontSize"] as? CGFloat {
            textStyle.font = Font.system(size: fontSize)
        }
        
        // Parse fontWeight
        if let fontWeight = style["fontWeight"] as? String {
            textStyle.font = textStyle.font?.weight(Self.fontWeight(from: fontWeight))
        }
        
        // Parse fontFamily (if available)
        if let fontFamily = style["fontFamily"] as? String, let fontSize = style["fontSize"] as? CGFloat {
            textStyle.font = Font.custom(fontFamily, size: fontSize)
        }
        
        // Parse color
        if let color = style["color"] as? String {
            textStyle.color = color
        }
        
        return textStyle
      }
      
      // Helper: Map fontWeight strings to SwiftUI Font.Weight
      private static func fontWeight(from weight: String) -> Font.Weight {
        switch weight.lowercased() {
        case "ultralight": return .ultraLight
        case "thin": return .thin
        case "light": return .light
        case "regular": return .regular
        case "medium": return .medium
        case "semibold": return .semibold
        case "bold": return .bold
        case "heavy": return .heavy
        case "black": return .black
        default: return .regular
        }
      }
  }
}
