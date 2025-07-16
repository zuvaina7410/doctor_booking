import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:doctor_booking/screens/doctor_details.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({
    super.key,
    required this.doctorModelList,
  });

  final List<DoctorModel> doctorModelList;

  @override
  Widget build(BuildContext context) {
    return Expanded(       
        child: ListView.builder(
          itemCount: doctorModelList.length,
          itemBuilder: (context,index){
            final filterDoctor = doctorModelList[index];
            return GestureDetector(
              onTap: () {
                Get.to(()=>DoctorDetails(doctorModel: filterDoctor,));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                        color: mainColor,
                       borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                        BoxShadow(
                      //  color: Colors.grey.withOpacity(0.9),
                      color: Color.fromRGBO(158, 158, 158, 0.9),
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],),
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(filterDoctor.image,
                              height: 115,
                              width: 115,
                              ),
                            ),
                          ),
                          Expanded(                              
                            child: Padding(
                              padding: const EdgeInsets.only(top: 18.0,bottom: 10.0,left: 5.0,right: 5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(text: filterDoctor.name,
                                  size: 18.0,
                                  color: Colors.black,
                                  weight: FontWeight.bold,
                                  count: 1,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                   customText(text: filterDoctor.department,
                                  size: 13.0,
                                  color: Colors.black,
                                  weight: FontWeight.w600,
                                  count: 1,
                                  ),
                                  customText(text: "Gender : ${filterDoctor.gender}",
                                  size: 13.0,
                                  color: Colors.black,
                                  weight: FontWeight.normal,
                                  count: 1
                                  ),
                                  SizedBox(height: 13,),
                                  customText(text: "Time : ${filterDoctor.time}",
                                  size: 13.0,
                                  color: Colors.black,
                                  weight: FontWeight.normal,
                                  count: 1,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                   customText(text: "Location : ${filterDoctor.location}",
                                  size: 13.0,
                                  color: Colors.black,
                                  weight: FontWeight.normal,
                                  count: 1,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  Divider(height: 2,color: buttonColor,)
                ],
              ),
            );
          }
          ),
      );
  }
}