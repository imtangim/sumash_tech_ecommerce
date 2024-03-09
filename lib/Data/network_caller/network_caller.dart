import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sumash_tech_project/Data/network_caller/network_response.dart';

import 'package:sumash_tech_project/controller/shared_preference_controller.dart';

class NetworkCaller {
  final SharedPreferenceController _sharedPreferenceController =
      Get.put(SharedPreferenceController());
  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body, bool islogin = false}) async {
    try {
      final http.Response response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        "Content-type": "Application/json",
        "Authorization": "Bearer ${_sharedPreferenceController.token ?? ""}"
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: jsonDecode(response.body),
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 401) {
        if (!islogin) {
          backToLogin();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> getRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: _sharedPreferenceController.token != null
            ? {
                "Content-type": "Application/json",
                "Authorization":
                    "Bearer ${_sharedPreferenceController.token ?? ""}"
              }
            : {
                "Content-type": "Application/json",
              },
      );

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: jsonDecode(response.body),
          statusCode: 200,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void backToLogin() {
    Get.find<SharedPreferenceController>().logout();
  }
}
