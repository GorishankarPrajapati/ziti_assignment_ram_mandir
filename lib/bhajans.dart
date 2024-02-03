import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ziti_task/bhajansModel.dart';

class Bhajans extends StatefulWidget {
  const Bhajans({super.key});

  @override
  State<Bhajans> createState() => _BhajansState();
}

class _BhajansState extends State<Bhajans> {
  AudioPlayer audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  var lastIndex = -1;
  final List<DataModel> songs = [
    DataModel(
        title: 'Mere Ghar Ram Aaye Hain',
        singer: "Jubin Nautiyal",
        audioPath: 'audio/Ram_Aaye_Hain.mp3',
        imageAssets: "images/mereghar.jpg",
        isPlaying: false),
    DataModel(
        title: 'Ram Aayenge',
        singer: "Vishal Mishra",
        audioPath: 'audio/RamAayenge.mp3',
        imageAssets: "images/RamAayenge.jpg",
        isPlaying: false),
    DataModel(
        title: 'Jai Shree Ram',
        singer: "Hansraj Raghuvanshi",
        audioPath: 'audio/Jai_Shree_Ram.mp3',
        imageAssets: "images/jaiShreeRam.webp",
        isPlaying: false),
    DataModel(
        title: 'Meri Jhopdi Ke Bhag Aaj Khul Jaynge Ram Aayenge',
        singer: "Swati Mishra",
        audioPath: 'audio/Meri_Jhopdi.mp3',
        imageAssets: "images/meriJhopdi.jpg",
        isPlaying: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ZITI Assignment"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (songs[index].isPlaying == false) {
                              playAudio(songs[index].audioPath.toString());
                              setState(() {
                                lastIndex != -1
                                    ? songs[lastIndex].isPlaying = false
                                    : songs[index].isPlaying = true;
                                songs[index].isPlaying = true;
                                lastIndex = index;
                              });
                            } else {
                              audioPlayer.pause();
                              setState(() {
                                songs[index].isPlaying = false;
                              });
                            }
                          },
                          child:
                              Image.asset(songs[index].imageAssets.toString())),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${songs[index].title}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Singer :- ${songs[index].singer}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                if (songs[index].isPlaying == false) {
                                  playAudio(songs[index].audioPath.toString());
                                  setState(() {
                                    lastIndex != -1
                                        ? songs[lastIndex].isPlaying = false
                                        : songs[index].isPlaying = true;
                                    songs[index].isPlaying = true;
                                    lastIndex = index;
                                  });
                                } else {
                                  audioPlayer.pause();
                                  setState(() {
                                    songs[index].isPlaying = false;
                                  });
                                }
                              },
                              icon: songs[index].isPlaying == false
                                  ? const Icon(
                                      Icons.play_arrow,
                                      color: Colors.deepOrange,
                                      size: 50,
                                    )
                                  : const Icon(
                                      Icons.pause,
                                      color: Colors.deepOrange,
                                      size: 50,
                                    )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]);
              }),
        ),
      ),
    );
  }

  Future<void> playAudio(String audioPath) async {
    await audioPlayer.play(AssetSource(audioPath));
  }
}
