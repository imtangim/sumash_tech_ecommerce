import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 1;


  void increaseCounter() {
    counter++;
    update();
  }

  void decreaseCounter() {
    counter != 1 ? counter-- : counter = 1;
    update();
  }
  
}
