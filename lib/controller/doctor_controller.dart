import 'package:doctor_booking/Webservice/webservice.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  RxList<DoctorModel> allDoctors = <DoctorModel>[].obs;
  RxList<DoctorModel> filteredDoctors = <DoctorModel>[].obs;

   final RxString selectedGender = ''.obs;
    final RxString selectedTiming = ''.obs;
    RxBool isFiltered = false.obs;

    // var selectedGender = ''.obs;
  //var selectedTimeSlot = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() async {
    // Fetch from API
    var result = await Webservice().fetchDoctorsList(); // Replace with your API call

    if(result!=null){
    allDoctors.value = result;
    filteredDoctors.value = result;
    isFiltered.value = false;
    }

  }

  void filterDoctors({String? gender, String? timing}) {
    filteredDoctors.value = allDoctors.where((doc) {
      final genderMatch = gender == null || doc.gender == gender;
      final timeMatch = timing == null || doc.time == timing;
      return genderMatch && timeMatch;
    }).toList();
    isFiltered.value = true;
  }

 void clearFilter() {
    filteredDoctors.value = allDoctors;
    isFiltered.value = false;
  }


}