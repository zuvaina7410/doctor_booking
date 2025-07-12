import 'dart:developer';

import 'package:doctor_booking/Webservice/webservice.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController{

  var isLoading = true.obs;
  var doctorList = <DoctorModel>[].obs;
  var filteredList = <DoctorModel>[].obs;

  @override
  void onInit() {
    fetchDoctors();
    super.onInit();
  }

  void fetchDoctors() async{

    try {
      isLoading(true);

      var doctors = await Webservice().fetchDoctorsList();

      if(doctors!=null){
        doctorList.value = doctors;
      //  filteredList.value=doctors;
      }
    } finally {
      isLoading(false);
    }


  }



List<DoctorModel> filterDoctors({String gender = '', String time = ''}) {
  final filtered = doctorList.where((doc) {
    final matchGender = gender.isEmpty || doc.gender == gender;
    final matchTime = time.isEmpty || doc.time == time;
    return matchGender && matchTime;
  }).toList();
for (var doc in doctorList) {
  log("Doctor: ${doc.name}, Gender: ${doc.gender}, Time: ${doc.time}");
}
  filteredList.value = filtered;
  return filtered;
}

}