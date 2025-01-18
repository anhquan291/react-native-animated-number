# @quanna/react-native-animated-number

A React Native component for displaying animated numbers, written in SwiftUI for seamless and super-smooth animations when changing numeric values.

## Animations

The animations are handled natively using **SwiftUI**, ensuring smooth transitions when changing numbers. Animations are built into the number transitions, requiring no additional setup.

---

## Features

- **Super smooth animations** for changing numbers.
- Support for integers and decimal numbers.
- Display units such as `%`, `kg`, or any custom label.
- Fully customizable styles for numbers and units.
- Easy integration with React Native projects.

---

## Installation

You can install the package using either **Bun** or **Yarn**:

### Using Bun
```bash
bun add @quanna/react-native-animated-number
```

### Using Yarn
```bash
yarn add @quanna/react-native-animated-number
```

---

## Usage

Here's an example of how to use `@quanna/react-native-animated-number` in your React Native project:

### Example
```tsx
import React, { useState } from 'react';
import { View, Button, StyleSheet } from 'react-native';
import ReactNativeAnimatedNumberView from '@quanna/react-native-animated-number';

export default function App() {
  const [number, setNumber] = useState(42.5);
  const [displayDecimal, setDisplayDecimal] = useState(false);

  return (
    <View style={styles.container}>
      <ReactNativeAnimatedNumberView
        number={number}
        unit="%"
        displayDecimal={displayDecimal} // Toggle decimals (true or false)
        style={styles.animatedNumberContainer}
        numberStyle={styles.numberText}
        unitStyle={styles.unitText}
      />
      <View style={{ marginVertical: 10 }} />
      <Button
        title="Change Number"
        onPress={() => setNumber(Math.random() * 100)} // Update number dynamically
      />
      <Button
        title={displayDecimal ? 'Show Integers' : 'Show Decimals'}
        onPress={() => setDisplayDecimal(!displayDecimal)} // Toggle decimals
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f7f7f7',
  },
  animatedNumberContainer: {
    backgroundColor: 'green',
    padding: 10,
    borderRadius: 8,
  },
  numberText: {
    fontSize: 24,
    fontWeight: 'bold',
    color: 'white',
  },
  unitText: {
    fontSize: 16,
    color: 'yellow',
  },
});
```

---

## Properties

| Prop              | Type                        | Default | Description                                                                 |
| ----------------- | --------------------------- | ------- | --------------------------------------------------------------------------- |
| `number`          | `number`                   | `0`     | The numeric value to be displayed. Can be positive or negative.             |
| `displayDecimal`  | `boolean`                  | `false` | Whether to display the number with decimals.                                |
| `unit`            | `string`                   | `""`    | Unit to display next to the number (e.g., `%`, `kg`, `lbs`).                |
| `style`           | `StyleProp<ViewStyle>`     | `null`  | Custom styles for the container wrapping the number and unit.               |
| `numberStyle`     | `StyleProp<TextStyle>`     | `null`  | Custom styles for the number text.                                          |
| `unitStyle`       | `StyleProp<TextStyle>`     | `null`  | Custom styles for the unit text.                                            |

---

## Customization

You can style the component to match your design using the following props:

### Outer Container Styles
Use the `style` prop to customize the container view:

```tsx
<ReactNativeAnimatedNumberView
  style={{
    backgroundColor: 'black',
    borderRadius: 10,
    padding: 10,
  }}
/>
```

### Number and Unit Styles
Use `numberStyle` and `unitStyle` props to style the number and unit text:

```tsx
<ReactNativeAnimatedNumberView
  numberStyle={{
    fontSize: 30,
    fontWeight: 'bold',
    color: 'white',
  }}
  unitStyle={{
    fontSize: 18,
    color: 'gray',
  }}
/>
```

---


## License

This library is licensed under the [MIT License](LICENSE). Feel free to use it in your projects.

---

Happy coding! 🚀
