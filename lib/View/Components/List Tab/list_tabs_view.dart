import 'package:assignment_app/View/Components/List%20Tab/list_tabs.dart';
import 'package:flutter/material.dart';

class ListTabView extends StatelessWidget {
  const ListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ListTabs(
            title: "Flowers",
            index: 0,
          ),
          ListTabs(
            title: "Toys",
            index: 1,
          ),
          ListTabs(
            title: "Nature",
            index: 2,
          ),
          ListTabs(
            title: "Food",
            index: 3,
          ),
          ListTabs(
            title: "Gym",
            index: 4,
          ),
          ListTabs(title: "Games", index: 5),
          ListTabs(
            title: "Books",
            index: 6,
          )
        ],
      ),
    );
  }
}
