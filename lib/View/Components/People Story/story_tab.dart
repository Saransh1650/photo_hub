import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StoryTab extends StatelessWidget {
  final String pic;
  const StoryTab({super.key, required this.pic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.snackbar("No Functionality", "Not implemented these for now");
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/$pic.jpg",
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
