import 'package:flutter/material.dart';
import 'package:instagram/constant/story_json.dart';
import 'package:instagram/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Column(children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: List.generate(stories.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10, left: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            stories[index]['img'],
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    stories[index]['name'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: white),
                  ),
                )
              ],
            ),
          );
        })),
      )
    ]);
  }
}
