import ExpoModulesCore
import SwiftUI
import UIKit

@available(iOS 17.0, *)
class ReactNativeAnimatedNumberView: ExpoView {
  // Observable object handles the number, unit, color, and styles
  private let viewModel = AnimatedNumberViewModel()

  // SwiftUI host for rendering the AnimatedNumberContentView
  private var hostingController: UIHostingController<AnimatedNumberContentView>?

  // Initialize and render the SwiftUI View within the native view
  required init(appContext: AppContext? = nil) {
    super.init(appContext: appContext)

    let contentView = AnimatedNumberContentView(viewModel: self.viewModel)
    hostingController = UIHostingController(rootView: contentView)

    if let hostingView = hostingController?.view {
      addSubview(hostingView)
    }
  }

  override func layoutSubviews() {
    // Ensure the hosted view takes up the full bounds of the native view
    hostingController?.view.frame = bounds
  }

  // MARK: - Props

  // Update the `number` property of the viewModel
  func setNumber(_ number: Double) {
    DispatchQueue.main.async {
      withAnimation { // Apply animation on the Swift side when value changes
        self.viewModel.number = number
      }
    }
  }

  // Update the `setDisplayDecimal` property of the viewModel
  func setDisplayDecimal(_ displayDecimal: Bool) {
    DispatchQueue.main.async {
      self.viewModel.displayDecimal = displayDecimal
    }
  }

  // Update the `unit` property of the viewModel
  func setUnit(_ unit: String?) {
    DispatchQueue.main.async {
      self.viewModel.unit = unit ?? ""
    }
  }

  // Update the `style` for the container
  func setStyle(_ style: [String: Any]?) {
    DispatchQueue.main.async {
      self.viewModel.style = style ?? ["backgroundColor": "transparent"]
    }
  }

  // Update the `numberStyle` for the number text
  func setTextStyle(_ textStyle: [String: Any]?) {
    DispatchQueue.main.async {
      self.viewModel.numberStyle = textStyle
    }
  }

  // Update the `unitStyle` for the unit text
  func setUnitStyle(_ unitStyle: [String: Any]?) {
    DispatchQueue.main.async {
      self.viewModel.unitStyle = unitStyle
    }
  }
}
