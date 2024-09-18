import 'package:assignment_app/View/Components/Grid/tile.dart';
import 'package:assignment_app/ViewModel/api_calling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    ApiCalling controller = Get.put(ApiCalling());
    return Obx(() {
      return
      controller.data.value == null
          ? const CircularProgressIndicator()
          : 
       Expanded(
          child: GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 0,
                    pattern: const [
                      WovenGridTile(1),
                      WovenGridTile(
                        5 / 6,
                        crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: controller.data.value!.hits.length,
                    (context, index) => Tile(
                      hits: controller
                          .data.value!.hits[index],
                    ),
                  ),
                ));
    });
  }
}
