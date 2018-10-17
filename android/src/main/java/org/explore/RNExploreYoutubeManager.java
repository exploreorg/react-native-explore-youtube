package org.explore;

import android.support.annotation.NonNull;
import android.util.Log;

import com.facebook.infer.annotation.Assertions;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.pierfrancescosoffritti.androidyoutubeplayer.player.YouTubePlayer;
import com.pierfrancescosoffritti.androidyoutubeplayer.player.YouTubePlayerView;
import com.pierfrancescosoffritti.androidyoutubeplayer.player.listeners.AbstractYouTubePlayerListener;
import com.pierfrancescosoffritti.androidyoutubeplayer.player.listeners.YouTubePlayerInitListener;

import java.util.Map;

import javax.annotation.Nullable;

public class RNExploreYoutubeManager extends SimpleViewManager {
    public static final int COMMAND_TOGGLE_FULLSCREEN = 1;
    public static final String REACT_CLASS = "RNExploreYoutube";


    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    public YouTubePlayerView createViewInstance(ThemedReactContext context) {
        return new YouTubePlayerView(context);
        //return new RNExploreYoutubeView(context);
    }

    @ReactProp(name = "identifier")
    public void setIdentifier(YouTubePlayerView view, @Nullable final String identifier) {
        Log.d("wtf", "setting id: "+ identifier);
        view.initialize(new YouTubePlayerInitListener() {
            @Override
            public void onInitSuccess(@NonNull final YouTubePlayer initializedYouTubePlayer) {
                initializedYouTubePlayer.addListener(new AbstractYouTubePlayerListener() {
                    @Override
                    public void onReady() {
                        String videoId = identifier;
                        initializedYouTubePlayer.loadVideo(videoId, 0);
                    }
                });
            }
        }, true);
    }

    @Override
    public Map<String, Integer> getCommandsMap() {
        return MapBuilder.of(
                "toggleFullscreen",
                COMMAND_TOGGLE_FULLSCREEN
        );
    }

    public void receiveCommand(YouTubePlayerView view, int commandType, @Nullable ReadableArray args) {
        Assertions.assertNotNull(view);
        Assertions.assertNotNull(args);
        switch (commandType) {
            case COMMAND_TOGGLE_FULLSCREEN: {
                Log.d("wtf", "Toggling");
                view.toggleFullScreen();
                return;
            }
            default:
                throw new IllegalArgumentException(String.format(
                        "Unsupported command %d received by %s.",
                        commandType,
                        getClass().getSimpleName()));
        }
    }
}
