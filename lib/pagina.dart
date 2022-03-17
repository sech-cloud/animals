// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animals/detalle.dart';
import 'package:animals/Principal.dart';
import '../others/others.dart';

class Pagina extends StatefulWidget {
  final dynamic song;

  const Pagina({Key? key, this.song}) : super(key: key);

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Reproductor(),
    );
  }

  Widget Reproductor() {
    var tamanio = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: tamanio.width,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.scaleDown)),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 8),
                  child: Text(
                    "Seguir",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  widget.song['title'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 500,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 200),
              child: Row(
                children: List.generate(songs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30, top: 200),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Detalle(
                                    title: songs[index]['title'],
                                    description: songs[index]['description'],
                                    img: songs[index]['img'],
                                    songUrl: songs[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale));
                        },
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: tamanio.width - 210,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                          )
                        ])),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
                children: List.generate(songAlbums.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: Detalle(
                              title: widget.song['title'],
                              description: widget.song['description'],
                              img: widget.song['img'],
                              songUrl: widget.song['song_url'],
                            ),
                            type: PageTransitionType.scale));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (tamanio.width - 60) * 0.77,
                        child: Text(
                          "${index + 1}  " + songAlbums[index]['title'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        width: (tamanio.width - 60) * 0.23,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              songAlbums[index]['duration'],
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 16,
                              )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      Feather.more_vertical,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
//safearea
    );
  }
}
