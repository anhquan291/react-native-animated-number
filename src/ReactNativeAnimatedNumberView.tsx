import { requireNativeView } from "expo";
import * as React from "react";

import { ReactNativeAnimatedNumberViewProps } from "./ReactNativeAnimatedNumber.types";

const NativeView: React.ComponentType<ReactNativeAnimatedNumberViewProps> =
  requireNativeView("ReactNativeAnimatedNumber");

export default function ReactNativeAnimatedNumberView(
  props: ReactNativeAnimatedNumberViewProps,
) {
  return <NativeView {...props} />;
}
