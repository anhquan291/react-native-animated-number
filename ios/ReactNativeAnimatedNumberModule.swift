import ExpoModulesCore

@available(iOS 17.0, *)
public class ReactNativeAnimatedNumberModule: Module {
  // Each module class must implement the definition function. The definition consists of components
  // that describes the module's functionality and behavior.
  // See https://docs.expo.dev/modules/module-api for more details about available components.
  
  public func definition() -> ModuleDefinition {
    // Sets the name of the module that JavaScript code will use to refer to the module. Takes a string as an argument.
    // Can be inferred from module's class name, but it's recommended to set it explicitly for clarity.
    // The module will be accessible from `requireNativeModule('ReactNativeAnimatedNumber')` in JavaScript.
    Name("ReactNativeAnimatedNumber")

    // Enables the module to be used as a native view. Definition components that are accepted as part of the
    // view definition: Prop, Events.
    View(ReactNativeAnimatedNumberView.self) {
      // The `number` property (mandatory)
      Prop("number") { (view: ReactNativeAnimatedNumberView, number: Double) in
        view.setNumber(number)
      }

      // The `displayDecimal` property (optional, defaults to false if not provided)
      Prop("displayDecimal") { (view: ReactNativeAnimatedNumberView, displayDecimal: Bool) in
        view.setDisplayDecimal(displayDecimal)
      }

      // The `unit` property (optional, defaults to an empty string if not provided)
      Prop("unit") { (view: ReactNativeAnimatedNumberView, unit: String?) in
        view.setUnit(unit ?? "") // Default to empty string if `unit` is nil
      }

      // The `style` for the outer container (optional)
      Prop("style") { (view: ReactNativeAnimatedNumberView, style: [String: Any]?) in
        view.setStyle(style) // Pass directly as it's handled internally
      }

      // The `numberStyle` for the number text (optional)
      Prop("numberStyle") { (view: ReactNativeAnimatedNumberView, numberStyle: [String: Any]?) in
        view.setTextStyle(numberStyle ?? [:]) // Default to an empty dictionary if nil
      }

      // The `unitStyle` for the unit text (optional)
      Prop("unitStyle") { (view: ReactNativeAnimatedNumberView, unitStyle: [String: Any]?) in
        view.setUnitStyle(unitStyle ?? [:]) // Default to an empty dictionary if nil
      }
    }
  }
}
