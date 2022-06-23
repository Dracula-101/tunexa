import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tunexa/decorations/colors.dart';
import 'package:tunexa/decorations/decoration.dart';
import 'package:tunexa/decorations/styles.dart';
import 'package:tunexa/widgets/text_widgets.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          //header title
          headerTitle('Library'),
          //search box
          InkWell(
            onTap: () async {
              try {
                await SpotifySdk.connectToSpotifyRemote(
                    clientId: "dcc905940a924e7394128452e4e0e75a",
                    redirectUrl: "https://com.example.tunexa/callback/");
                var accessToken = await SpotifySdk.getAccessToken(
                    clientId: "dcc905940a924e7394128452e4e0e75a",
                    redirectUrl: "https://com.example.tunexa/callback/",
                    scope:
                        "app-remote-control,user-modify-playback-state,playlist-read-private");
                log(accessToken.toString());
              } on Exception catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        e.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.all(kPadding),
              padding: defaultPadding,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5),
                borderRadius: defaultRadius,
              ),
              // child: TextField(
              //   decoration: InputDecoration(
              //     hintText: "Song or Artist...",
              //     prefixIcon: Icon(
              //       Icons.search,
              //       color: secondaryColor,
              //     ),
              //     focusedBorder: InputBorder.none,
              //     border: InputBorder.none,
              //   ),
              //   cursorColor: secondaryColor,
              // ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.search,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Songs or artist...',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: kPadding / 2,
              bottom: kPadding / 2,
            ),
            child: Text(
              'PlayList',
              style: normalText,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/song_image.jpg'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: purpleColor.withOpacity(0.3),
                              blurStyle: BlurStyle.normal,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(5, 5),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The index no is $index',
                            style: normalText,
                          ),
                          Text(
                            'The index no is $index',
                            style: smallText,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: kPadding / 2,
              bottom: kPadding / 2,
            ),
            child: Text(
              'Favourites',
              style: normalText,
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            itemBuilder: (context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: defaultPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Music Icon
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.music_note,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Music Title',
                                  style: normalText,
                                ),
                                Text(
                                  'Subtitle',
                                  style: smallText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        //like the song
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white30,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
