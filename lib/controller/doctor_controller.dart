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

  void fetchFilterDoctors() async{

    try {
      isLoading(true);

      var filterDoctor = await Webservice().fetchFilterDoctorsList();

      if(filterDoctor!=null){
      //  doctorList.value = filterDoctor;
        filteredList.value=filterDoctor;
      }
    } finally {
      isLoading(false);
    }


  }



  // filter({String gender = '', String time = ''}) {
  //   filteredList.value = doctorList.where((doc) {
  //     final genderMatch = gender.isEmpty || doc.gender == gender;
  //     final timeMatch = time.isEmpty || doc.time.contains(time);
  //     return genderMatch && timeMatch;
  //   }).toList();
  // }

}