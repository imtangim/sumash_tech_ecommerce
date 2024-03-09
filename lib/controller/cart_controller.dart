// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sumash_tech_project/Data/models/user/cart_model.dart';
import 'package:sumash_tech_project/Data/models/user/cartdata_model.dart';
import 'package:sumash_tech_project/Data/models/user/user.dart';
import 'package:sumash_tech_project/Data/network_caller/network_caller.dart';
import 'package:sumash_tech_project/Data/network_caller/network_response.dart';
import 'package:sumash_tech_project/Data/utils/urls.dart';
import 'package:sumash_tech_project/controller/shared_preference_controller.dart';
import 'package:sumash_tech_project/widgets/snackabr.dart';

class CartController extends GetxController {
  bool isloading = false;
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  Future<void> addToCart(
    String productID,
    String? variantID,
    String quantity,
    BuildContext context,
  ) async {
    isloading = true;
    update();
    bool alreadyInCart = sharedPreferenceController.user!.cartData!.any((item) {
      return item.productID == int.parse(productID);
    });

    if (alreadyInCart) {
      isloading = false;
      update();
      showSnackMessage(context, "Product already in cart", Colors.orange);
      return;
    } else {
      try {
        final NetworkResponse cartResponse = await NetworkCaller().postRequest(
          "${Urls.cart}/",
          body: {
            "product": productID,
            "variant": null,
            "quantity": quantity,
          },
        );
        if (cartResponse.isSuccess) {
          CartDataModel model = CartDataModel(
            productID: cartResponse.jsonResponse!["product"],
            quantity: cartResponse.jsonResponse!["quantity"],
            variantID: cartResponse.jsonResponse?["variant"],
          );
          sharedPreferenceController.user!.cartData!.add(model);

          sharedPreferenceController.saveUserInformation(UserModel(
            cartData: sharedPreferenceController.user!.cartData,
            customerId: sharedPreferenceController.user!.customerId,
            dateOfBirth: sharedPreferenceController.user!.dateOfBirth,
            dateOfBirthUpdated:
                sharedPreferenceController.user!.dateOfBirthUpdated,
            district: sharedPreferenceController.user!.district,
            genderText: sharedPreferenceController.user!.genderText,
            name: sharedPreferenceController.user!.name,
            phoneNumber: sharedPreferenceController.user!.phoneNumber,
            point: sharedPreferenceController.user!.point,
            profilePhoto: sharedPreferenceController.user!.profilePhoto,
            referralCode: sharedPreferenceController.user!.referralCode,
            status: sharedPreferenceController.user!.status,
          ));
          sharedPreferenceController.cartItem.add(model);
          sharedPreferenceController.count.value =
              sharedPreferenceController.cartItem.length;

          showSnackMessage(context, "Added to cart", Colors.green);
        } else {
          throw "Api error";
        }
      } catch (e) {
        log(e.toString());
      } finally {
        isloading = false;
        update();
      }
    }
  }

  Future<List<CartModel>> fetchProducts() async {
    try {
      final http.Response cartResponse = await http.get(
        Uri.parse(Urls.cart),
        headers: sharedPreferenceController.token != null
            ? {
                "Content-type": "Application/json",
                "Authorization":
                    "Bearer ${sharedPreferenceController.token ?? ""}"
              }
            : {
                "Content-type": "Application/json",
              },
      );

      if (cartResponse.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(cartResponse.body);

        // Convert JSON data to List<CartModel>
        List<CartModel> products = jsonData.map((item) {
          return CartModel.fromJson(item);
        }).toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      log('Error fetching products: $e');
      rethrow;
    }
  }

  Future<void> deleteCartItem(
      String cartId, BuildContext context, String productID) async {
    final String apiUrl = 'https://api.sumashtech.com/api/cart/$cartId';

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${sharedPreferenceController.token}',
        },
      );
      if (response.statusCode == 301) {
        // The server has redirected to a new location
        final String newLocation = response.headers['location'] ?? '';
        if (newLocation.isNotEmpty) {
          log("${Urls.main} $newLocation");
          final newResponse = await http.delete(
            Uri.parse("${Urls.main}$newLocation"),
            headers: {
              'Authorization': 'Bearer ${sharedPreferenceController.token}',
            },
          );
          if (newResponse.statusCode == 204) {
            sharedPreferenceController.user!.cartData!.removeWhere(
              (element) {
                log("${element.productID} == ${int.parse(productID)}");
                return element.productID == int.parse(productID);
              },
            );

            sharedPreferenceController.saveUserInformation(UserModel(
              cartData: sharedPreferenceController.user!.cartData,
              customerId: sharedPreferenceController.user!.customerId,
              dateOfBirth: sharedPreferenceController.user!.dateOfBirth,
              dateOfBirthUpdated:
                  sharedPreferenceController.user!.dateOfBirthUpdated,
              district: sharedPreferenceController.user!.district,
              genderText: sharedPreferenceController.user!.genderText,
              name: sharedPreferenceController.user!.name,
              phoneNumber: sharedPreferenceController.user!.phoneNumber,
              point: sharedPreferenceController.user!.point,
              profilePhoto: sharedPreferenceController.user!.profilePhoto,
              referralCode: sharedPreferenceController.user!.referralCode,
              status: sharedPreferenceController.user!.status,
            ));
            update();
            showSnackMessage(context, "Removed to cart", Colors.red);
          } else {
            log(newResponse.body);
          }
        }
      }
    } catch (e) {
      log('Error deleting cart item: $e');
    }
  }
}
