// Reexport the native module. On web, it will be resolved to ReactNativeAnimatedNumberModule.web.ts
// and on native platforms to ReactNativeAnimatedNumberModule.ts
export { default } from './ReactNativeAnimatedNumberModule';
export { default as ReactNativeAnimatedNumberView } from './ReactNativeAnimatedNumberView';
export * from  './ReactNativeAnimatedNumber.types';
