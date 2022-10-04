import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/main_model.dart';

class EngineController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData() async {
    final url = Uri.parse(
        'https://api.unsplash.com/search/photos?page=1&query=art?&client_id=vn8VdttRASysjGWXKMcy-ALde7_vXFSHDOrQ2fnAZ3I');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return Welcome.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('error', e.toString());
      }
    }
  }
}
