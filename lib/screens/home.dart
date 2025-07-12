import 'dart:developer';

import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/controller/doctor_controller.dart';
import 'package:doctor_booking/filter_method.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:doctor_booking/screens/doctor_details.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final DoctorController doctorController =Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     //   toolbarHeight: 60,
        backgroundColor: buttonColor,
        title: Center(
          child: Text("Doctors",
          style: TextStyle(color: textColor),
          ),
        ),
      centerTitle:false,
      actions: [       
         IconButton(
          icon: Icon(Icons.picture_as_pdf_sharp,color: textColor,),
          onPressed: (){

          }, ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(
            icon: Icon(Icons.tune,color: textColor,),
            onPressed: (){

              showFilterDialog();
          
            }, ),
        ),
          
      ],),
      body:
      // doctorController.doctorList.isEmpty
      //     ? Center(child: CircularProgressIndicator())
      //     :
      Obx(((){
     //   if(doctorController.doctorList!.isEmpty){
        return 
         Column(
          children: [
            Expanded(       
              child: ListView.builder(
                itemCount: doctorController.doctorList.length,
                itemBuilder: (context,index){
                  final doctor = doctorController.doctorList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>DoctorDetails(doctorModel: doctor,));
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
                                    child: Image.network(doctor.image,
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
                                        customText(text: doctor.name,
                                        size: 18.0,
                                        color: Colors.black,
                                        weight: FontWeight.bold,
                                        count: 1,
                                        overflow: TextOverflow.ellipsis,
                                        ),
                                         customText(text: doctor.department,
                                        size: 13.0,
                                        color: Colors.black,
                                        weight: FontWeight.w600,
                                        count: 1,
                                        ),
                                        customText(text: "Gender : ${doctor.gender}",
                                        size: 13.0,
                                        color: Colors.black,
                                        weight: FontWeight.normal,
                                        count: 1
                                        ),
                                        SizedBox(height: 13,),
                                        customText(text: "Time : ${doctor.time}",
                                        size: 13.0,
                                        color: Colors.black,
                                        weight: FontWeight.normal,
                                        count: 1,
                                        overflow: TextOverflow.ellipsis,
                                        ),
                                         customText(text: "Location : ${doctor.location}",
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
            ),
          ],
        );
      // }
      // else {
      //   return Center(child: CircularProgressIndicator());
      // }
      }))
     
    );
  }
}

