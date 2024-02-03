import 'package:flutter/material.dart';

class DataModel {
  final String? title;
  final String? singer;
  final String? audioPath;

  final String? imageAssets;
  bool? isPlaying;

  DataModel(
      {required this.title,
      required this.singer,
      required this.audioPath,
      required this.imageAssets,
      required this.isPlaying});
}
