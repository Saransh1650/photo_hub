import 'package:assignment_app/Model/data.dart';
import 'package:assignment_app/View/Components/Video/video_view.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Tile extends StatelessWidget {
  final Hit hits;
  const Tile({super.key, required this.hits});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> VideoView(videoUrl: hits.videos.large.url,title: hits.user,hits: hits,), transition: Transition.zoom);
      },
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(hits.videos.large.thumbnail, fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, exception, stackTrace) {
                return Image.asset(
                  "assets/error.jpg",
                  fit: BoxFit.fill,
                  
                  width: double.infinity,
                );
              },

            )),
      ),
    );
  }
}