import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_demo_ui/screen_three/controller/form_controller.dart';
import 'package:task_demo_ui/screen_three/ui/widgets/ChecKBokWidget.dart';
import 'package:task_demo_ui/screen_three/ui/widgets/FormInputField.dart';
import 'package:task_demo_ui/screen_three/ui/widgets/ImageSelectoWidget.dart';
import 'package:task_demo_ui/utils/three_styles.dart';

class FormScreen extends StatelessWidget {
  final FormController formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('店舗プロフィール編集'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormInputField(
                labelText: '店舗名*',
                controller: formController.storeNameController,
                decoration: kInputDecoration,
              ),
              FormInputField(
                labelText: '代表担当者名*',
                controller: formController.representativeNameController,
                decoration: kInputDecoration,
              ),
              FormInputField(
                labelText: '店舗電話番号*',
                controller: formController.phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: kInputDecoration,
              ),
              FormInputField(
                labelText: '店舗住所*',
                controller: formController.storeAddressController,
                decoration: kInputDecoration,
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200,
                color: Colors.grey[200],
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(35.6895, 139.6917),
                    zoom: 14.0,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              ImageSelectorWidget(
                controller: formController.imagePickerController1,
                title: '店舗写真*',
                subtitle: '店舗の写真をアップロードしてください',
              ),
              SizedBox(height: 8.0),
              ImageSelectorWidget(
                controller: formController.imagePickerController2,
                title: '店舗写真*',
                subtitle: '店舗の写真をアップロードしてください',
              ),
              SizedBox(height: 8.0),
              ImageSelectorWidget(
                controller: formController.imagePickerController3,
                title: '店舗写真*',
                subtitle: '店舗の写真をアップロードしてください',
              ),
              _buildBusinessHoursSection(formController),
              SizedBox(height: 16),
              _buildBusinessDays(formController: formController),
              SizedBox(height: 16),
              FormInputField(
                labelText: 'キャッチコピー*',
                controller: formController.storeAddressController,
                decoration: kInputDecoration,
              ),
              SizedBox(height: 16),
              FormInputField(
                labelText: '座席数*',
                controller: formController.storeAddressController,
                decoration: kInputDecoration,
              ),
              SizedBox(height: 16),
              _buildSmokingZoneSection(formController),
              SizedBox(height: 16),
              _buildParkingSection(formController),
              SizedBox(height: 16),
              _buildGift(formController),
              SizedBox(height: 16),
              ImageSelectorWidget(
                controller: formController.imagePickerController2,
                title: '',
                subtitle: '',
              ),
              SizedBox(height: 16),
              FormInputField(
                labelText: '来店プレゼント名*',
                controller: formController.storeAddressController,
                decoration: kInputDecoration,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: kButtonStyle,
                  onPressed: formController.submitForm,
                  child: Text(
                    '編集を保存',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmokingZoneSection(FormController formController) {
    return CheckBoxWidget(
        toggleCheckbox: (index) {
          formController.toggleSmoking(index);
        },
        title: '喫煙席',
        list: formController.smokingZone);
  }

  Widget _buildParkingSection(FormController formController) {
    return CheckBoxWidget(
        toggleCheckbox: (index) {
          formController.toggleparking(index);
        },
        title: '駐車場',
        list: formController.parkingZone);
  }

  Widget _buildGift(FormController formController) {
    return CheckBoxWidget(
        toggleCheckbox: (index) {
          formController.toggleGift(index);
        },
        title: '来店プレゼント',
        list: formController.giftZone);
  }
}

class _buildBusinessDays extends StatefulWidget {
  _buildBusinessDays({super.key, required this.formController});
  final FormController formController;

  @override
  State<_buildBusinessDays> createState() => _buildBusinessDaysState();
}

class _buildBusinessDaysState extends State<_buildBusinessDays> {
  @override
  Widget build(BuildContext context) {
    return CheckBoxWidget(
        toggleCheckbox: (index) {
          widget.formController.toggledays(index);
        },
        title: '営業日',
        list: widget.formController.days);
  }
}

Widget _buildBusinessHoursSection(FormController formController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('営業時間', style: kSectionTitleTextStyle),
      SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: Obx(
              () => _buildTimeDropdown(
                selectedTime: formController.openingTime,
                onChanged: (value) => formController.openingTime.value = value!,
              ),
            ),
          ),
          Text('〜'),
          Expanded(
            child: Obx(
              () => _buildTimeDropdown(
                selectedTime: formController.closingTIme,
                onChanged: (value) => formController.closingTIme.value = value!,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTimeDropdown({
  required RxString selectedTime,
  required ValueChanged<String?> onChanged,
}) {
  List<String> times =
      List.generate(24, (index) => '${index.toString().padLeft(2, '0')}:00');

  return Container(
    height: 50,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: kContainerDecoration,
    child: DropdownButton<String>(
      isExpanded: true,
      value: selectedTime.value,
      items: times.map((time) {
        return DropdownMenuItem<String>(
          value: time,
          child: Text(time),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}
