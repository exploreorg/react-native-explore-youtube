package org.explore;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.pierfrancescosoffritti.androidyoutubeplayer.player.YouTubePlayer;
import com.pierfrancescosoffritti.androidyoutubeplayer.player.YouTubePlayerView;
import com.pierfrancescosoffritti.androidyoutubeplayer.player.listeners.AbstractYouTubePlayerListener;

public class YoutubeFragment extends Fragment {
    private String videoId = "6JYIGclVQdw";
    private YouTubePlayer initializedYouTubePlayer;

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        ViewGroup view = (ViewGroup) inflater.inflate(R.layout.youtube_player_view, container, false);

        YouTubePlayerView youTubePlayerView = view.findViewById(R.id.youtube_player_view);

        getLifecycle().addObserver(youTubePlayerView);
        //youTubePlayerView.getPlayerUIController().showFullscreenButton(false);

        youTubePlayerView.initialize(initializedYouTubePlayer -> {
            initializedYouTubePlayer.addListener(new AbstractYouTubePlayerListener() {
                @Override
                public void onReady() {
                    initializedYouTubePlayer.cueVideo(videoId, 0);
                    YoutubeFragment.this.initializedYouTubePlayer = initializedYouTubePlayer;
                }
            });
        }, true);

        return view;
    }
}
