# react-native-explore-youtube

## Getting started

`$ npm install react-native-explore-youtube --save`

### Mostly automatic installation

`$ react-native link react-native-explore-youtube`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-explore-youtube` and add `RNExploreYoutube.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNExploreYoutube.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import org.explore.RNExploreYoutubePackage;` to the imports at the top of the file
  - Add `new RNExploreYoutubePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-explore-youtube'
  	project(':react-native-explore-youtube').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-explore-youtube/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-explore-youtube')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNExploreYoutube.sln` in `node_modules/react-native-explore-youtube/windows/RNExploreYoutube.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Explore.Youtube.RNExploreYoutube;` to the usings at the top of the file
  - Add `new RNExploreYoutubePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNExploreYoutube from 'react-native-explore-youtube';

// TODO: What to do with the module?
RNExploreYoutube;
```
  