import PropTypes from 'prop-types';
import React from 'react';
import {requireNativeComponent, UIManager, findNodeHandle} from 'react-native';

class ExploreYoutubePlayer extends React.Component {
  constructor(props) {
    super(props);
    this.player = null;
  }

  getWebViewBridgeHandle() {
    return findNodeHandle(this.player);
  }

  render() {
    return <RNExploreYoutube {...this.props} ref={(e) => this.player = e} />;
  }

  toggleFullscreen() {
    UIManager.dispatchViewManagerCommand(
      this.getWebViewBridgeHandle(),
      UIManager.RNExploreYoutube.Commands.toggleFullscreen,
      null
    );
  }
}

ExploreYoutubePlayer.propTypes = {
  /**
   * A youtube video id to provide to the player
   */
  identifier: PropTypes.string,
};

const RNExploreYoutube = requireNativeComponent('RNExploreYoutube', ExploreYoutubePlayer);

module.exports = ExploreYoutubePlayer;
