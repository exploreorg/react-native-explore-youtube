using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Explore.Youtube.RNExploreYoutube
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNExploreYoutubeModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNExploreYoutubeModule"/>.
        /// </summary>
        internal RNExploreYoutubeModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNExploreYoutube";
            }
        }
    }
}
