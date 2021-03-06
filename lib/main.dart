import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app_state.dart';
import 'src/adaptive_playlists.dart';

// From https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw
const youTubeChannelId = 'UCwXdFgeE9KYzlDdR7TG9cMw';

// ignore: todo
// TODO: Replace with your YouTube API Key
const youTubeApiKey = 'AIzaNotAnApiKey';

void main() {
  if (youTubeApiKey == 'AIzaNotAnApiKey') {
    // ignore: avoid_print
    print('youTubeApiKey has not been configured.');
    exit(1);
  }

  runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
    create: (BuildContext context) => FlutterDevPlaylists(
      youTubeChannelId: youTubeChannelId,
      youTubeApiKey: youTubeApiKey,
    ),
    child: const PlaylistsApp(),
  ));
}

class PlaylistsApp extends StatelessWidget {
  const PlaylistsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDev Playlists',
      theme: FlexColorScheme.light(scheme: FlexScheme.blue).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.red).toTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const AdaptivePlaylists(),
    );
  }
}
