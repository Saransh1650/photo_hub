import 'package:assignment_app/ViewModel/bottomTabState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<Icon> icons;
  
  const AnimatedBottomBar({
    super.key,
    required this.currentIcon,
  
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    BottomTabState controller = Get.put(BottomTabState());
    return Container(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons
              .map(
                (icon) => GestureDetector(
                  onTap: () => {
                    controller.bottomTab.value = icons.indexOf(icon)
                  },
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      icon.icon,
                      size: controller.bottomTab.value == icons.indexOf(icon) ? 28 :23,
                      color: controller.bottomTab.value == icons.indexOf(icon) ? Colors.orange :
                           Colors.black,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
