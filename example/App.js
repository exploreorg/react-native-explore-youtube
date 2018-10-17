/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Button} from 'react-native';
import RNExploreYoutubePlayer from 'react-native-explore-youtube';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

export default class App extends Component{
  render() {
    return (
      <View style={{flex: 1}}>
        <View style={{flex: 1, backgroundColor: 'powderblue'}} />
        <RNExploreYoutubePlayer identifier="eIslG97oQns" style={{flex: 2, backgroundColor: 'skyblue'}} ref={(e) => this.player = e} />
        <View style={{flex: 3, backgroundColor: 'steelblue'}}>
          <Button onPress={() => this.player.toggleFullscreen()} title="Press" style={{ flex: 1}} />
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  map: {
    width: 300,
    height: 300,
    backgroundColor: '#FF0000',
    borderRadius: 4,
    borderWidth: 0.5,
    borderColor: '#d6d7da',
    flex:1,
  }
});
