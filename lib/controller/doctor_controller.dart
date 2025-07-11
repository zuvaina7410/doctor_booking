import 'package:doctor_booking/Webservice/webservice.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController{

  var isLoading = true.obs;
  var doctorList = <DoctorModel>[].obs;

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
      }
    } finally {
      isLoading(false);
    }


  }

}