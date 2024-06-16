import 'package:get/get.dart';

class StampController extends GetxController {
  var stamps =
      List<bool>.filled(15, true).obs; // Mock data for stamps (true = acquired)
  var currentPage = 1.obs; // Mock data for current page
  var totalStamps = 30.obs;

  void toggleStamp(int index) {
    stamps[index] = !stamps[index];
    if (stamps[index]) {
      totalStamps.value++;
    } else {
      totalStamps.value--;
    }
  } // Mock data for total stamps
}
