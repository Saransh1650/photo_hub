import 'package:assignment_app/View/Components/Grid/custom_grid_view.dart';
import 'package:assignment_app/View/Components/List%20Tab/list_tabs_view.dart';
import 'package:assignment_app/View/Components/People%20Story/story_list.dart';
import 'package:assignment_app/View/Components/bottom%20nav%20bar/custom_bottom_nav_bar.dart';
import 'package:assignment_app/View/Search/search_view.dart';
import 'package:assignment_app/ViewModel/api_calling.dart';
import 'package:assignment_app/ViewModel/bottomTabState.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:get/instance_manager.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    ApiCalling controller = Get.put(ApiCalling());
    BottomTabState tabController = Get.put(BottomTabState());
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: AnimatedBottomBar(
            currentIcon: tabController.bottomTab.value,
            icons: const [Icon(Icons.feed), Icon(Icons.search)]),
        appBar: AppBar(
          title: const Text('PhotoHUB', style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,
        ),
        body: tabController.bottomTab.value == 0
            ? Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  children: [ListTabView(), StoryList(), CustomGridView()],
                ),
              )
            : const SearchScreen(),
      );
    });
  }
}
