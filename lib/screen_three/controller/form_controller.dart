import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo_ui/screen_three/controller/ImagePickerController.dart';
import 'package:task_demo_ui/screen_three/model/checkbox_model.dart';

class FormController extends GetxController {
  var storeName = ''.obs;
  var representativeName = ''.obs;
  var phoneNumber = ''.obs;
  var storeAddress = ''.obs;
  var openingTime = '01:00'.obs;
  var closingTIme = '01:00'.obs;
  var smokingZone = [
    CheckBoxModel(isChecked: false, title: '有'),
    CheckBoxModel(isChecked: false, title: '無'),
  ].obs;
  var parkingZone = [
    CheckBoxModel(isChecked: false, title: '有'),
    CheckBoxModel(isChecked: false, title: '無'),
  ].obs;
  var giftZone = [
    CheckBoxModel(isChecked: false, title: '有（最大３枚まで）'),
    CheckBoxModel(isChecked: false, title: '無'),
  ].obs;
  var days = [
    CheckBoxModel(isChecked: false, title: '月'),
    CheckBoxModel(isChecked: false, title: '火'),
    CheckBoxModel(isChecked: false, title: '水'),
    CheckBoxModel(isChecked: false, title: '木'),
    CheckBoxModel(isChecked: false, title: '金'),
    CheckBoxModel(isChecked: false, title: '月'),
    CheckBoxModel(isChecked: false, title: '日'),
    CheckBoxModel(isChecked: false, title: '祝'),
  ].obs;
  TextEditingController storeNameController = TextEditingController();
  TextEditingController representativeNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController storeAddressController = TextEditingController();
  ImagePickerController imagePickerController1 = ImagePickerController();
  ImagePickerController imagePickerController2 = ImagePickerController();
  ImagePickerController imagePickerController3 = ImagePickerController();

  @override
  void onInit() {
    super.onInit();
  }

  void toggledays(int index) {
    days.value[index].isChecked = !days[index].isChecked;
    days.refresh();
  }

  void toggleSmoking(int index) {
    smokingZone.value[index].isChecked = !smokingZone[index].isChecked;
    smokingZone.refresh();
  }

  void toggleparking(int index) {
    parkingZone.value[index].isChecked = !parkingZone[index].isChecked;
    parkingZone.refresh();
  }

  void toggleGift(int index) {
    giftZone.value[index].isChecked = !giftZone[index].isChecked;
    giftZone.refresh();
  }

  @override
  void onClose() {
    storeNameController.dispose();
    representativeNameController.dispose();
    phoneNumberController.dispose();
    storeAddressController.dispose();
    super.onClose();
  }

  void submitForm() {
    if (storeNameController.text.isEmpty) {
      Get.snackbar('Error', '店舗名を入力してください');
      return;
    }
    if (representativeNameController.text.isEmpty) {
      Get.snackbar('Error', '代表担当者名を入力してください');
      return;
    }
    if (phoneNumberController.text.isEmpty) {
      Get.snackbar('Error', '店舗電話番号を入力してください');
      return;
    }
    if (storeAddressController.text.isEmpty) {
      Get.snackbar('Error', '店舗住所を入力してください');
      return;
    }

    storeName.value = storeNameController.text;
    representativeName.value = representativeNameController.text;
    phoneNumber.value = phoneNumberController.text;
    storeAddress.value = storeAddressController.text;
    Get.snackbar('Success', 'フォームが正常に送信されました');
    print('Store Name: ${storeName.value}');
    print('Representative Name: ${representativeName.value}');
    print('Phone Number: ${phoneNumber.value}');
    print('Store Address: ${storeAddress.value}');
  }
}
