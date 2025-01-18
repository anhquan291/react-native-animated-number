import React from "react";
import { Button, SafeAreaView, Text, View } from "react-native";
import { ReactNativeAnimatedNumberView } from "react-native-animated-number";

export default function App() {
  const [number, setNumber] = React.useState(0);
  return (
    <SafeAreaView style={[styles.container]}>
      <Text style={styles.header}>Module API Example</Text>

      <View
        style={{
          flex: 1,
          justifyContent: "center",
        }}
      >
        <View>
          <ReactNativeAnimatedNumberView
            number={number}
            unit="%"
            style={{
              paddingHorizontal: 20,
              borderRadius: 10,
            }}
          />
          <View style={{ height: 30 }} />
          <Button
            title="Update Number"
            onPress={() => {
              setNumber(Math.floor(Math.random() * 124));
            }}
          />
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = {
  header: {
    fontSize: 30,
    margin: 20,
  },

  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
  view: {
    flex: 1,
    height: 200,
  },
};
