import 'package:assignment_app/ViewModel/api_calling.dart';
import 'package:assignment_app/ViewModel/tabs_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTabs extends StatelessWidget {
  final String title;
  final int index;
  const ListTabs({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    TabsState controller = Get.put(TabsState());
    ApiCalling dataController = Get.put(ApiCalling());
    return Obx(() {
      return InkWell(
        onTap: () {
          print(title);
          controller.selectedTab.value = index;
          dataController.request(title);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          decoration: BoxDecoration(
              color: controller.selectedTab.value == index
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: controller.selectedTab.value == index
                    ? Colors.white
                    : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
        ),
      );
    });
  }
}
