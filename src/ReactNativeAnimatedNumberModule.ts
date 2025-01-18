import { requireNativeModule } from "expo";

declare class ReactNativeAnimatedNumberModule {}

// This call loads the native module object from the JSI.
export default requireNativeModule<ReactNativeAnimatedNumberModule>(
  "ReactNativeAnimatedNumber",
);
