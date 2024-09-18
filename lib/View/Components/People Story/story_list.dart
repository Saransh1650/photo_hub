import 'package:assignment_app/View/Components/People%20Story/story_tab.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
         StoryTab(pic: "1"),
         StoryTab(pic: "2"),
         StoryTab(pic: "3"),
         StoryTab(pic: "4"),
         StoryTab(pic: "5"),
         StoryTab(pic: "6"),

        ],
      ),
    );
    
  }
}