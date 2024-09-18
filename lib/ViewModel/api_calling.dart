import 'package:assignment_app/Model/data.dart';
import 'package:assignment_app/Utils/constands.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class ApiCalling extends GetxController {
  @override
  void onInit() {
    request("Flowers");
    super.onInit();
  }

  var data = Rx<Data?>(null);

  final dio = Dio();

  void request(String param) async {
    var response = await dio.get('https://pixabay.com/api/videos/?key=$apiKey',
        queryParameters: {'q': param, 'image_type': 'video', 'pretty': true});
    Data result = Data.fromJson(response.data);
    data.value = result;
    print(param);
    print(data.value?.hits);
  }
}
