import type { StyleProp, TextStyle, ViewStyle } from "react-native";

export type ReactNativeAnimatedNumberViewProps = {
  /**
   * The number to be displayed. This can be positive or negative.
   */
  number: number;

  /**
   * A flag indicating whether numbers should display with decimal places.
   *
   * - `true`: Shows numbers with decimals (e.g., 1.0).
   * - `false`: Shows numbers without decimals (e.g., 1).
   */
  displayDecimal?: boolean;
  /**
   * The unit to display alongside the number (e.g., %, lbs, kg).
   */
  unit?: string;

  /**
   * Style applied to the outer container that wraps the number and unit.
   */
  style?: StyleProp<ViewStyle>;

  /**
   * Style applied to the text displaying the number.
   */
  numberStyle?: StyleProp<TextStyle>;

  /**
   * Style applied to the text displaying the unit.
   */
  unitStyle?: StyleProp<TextStyle>;
};
