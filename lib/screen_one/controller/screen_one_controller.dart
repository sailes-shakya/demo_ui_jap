// controllers/screen_one_controller.dart
import 'package:get/get.dart';

class ScreenOneController extends GetxController {
  var isFavourite = false.obs;
  var selectedDate = DateTime.now().toString().obs;

  void toggleFavourite() {
    isFavourite.value = !isFavourite.value;
  }

  void changeDate(DateTime ss) {
    selectedDate.value = ss.toString();
  }
}
