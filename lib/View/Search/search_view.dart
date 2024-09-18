import 'package:assignment_app/View/Components/Grid/custom_grid_view.dart';
import 'package:assignment_app/ViewModel/api_calling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiCalling controller = Get.put(ApiCalling());
    TextEditingController text = TextEditingController();
    return Obx(() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width * 5 / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 194, 192, 192)),
              child: Center(
                  child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    controller: text,
                    onChanged: (value) {
                      controller.request(text.text);
                    },
                    decoration:
                        const InputDecoration.collapsed(hintText: "Search"),
                  )),
                ],
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            controller.data.value!.hits.isEmpty
                ? const Text(
                    "Try Searching something else",
                    style: TextStyle(color: Colors.black),
                  )
                : const CustomGridView()
          ],
        ),
      );
    });
  }
}
