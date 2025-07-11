import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/controller/doctor_controller.dart';
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
        title: Padding(
          padding: const EdgeInsets.only(left: 100.0),
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
          
            }, ),
        ),
          
      ],),
      body:Obx(((){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(       
            child: ListView.builder(
              itemCount: doctorController.doctorList.length,
              itemBuilder: (context,index){
                final doctor = doctorController.doctorList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                          color: mainColor,
                         borderRadius: BorderRadius.circular(10.0)),
                        
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
                                    Text(doctor.name,
                                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                     Text(doctor.department,
                                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.normal),),
                                     Text("Gender : ${doctor.gender}",
                                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.normal),),
                                    SizedBox(height: 13,),
                                     Text("Time : ${doctor.time}",
                                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
                                     Text("Location : ${doctor.location}",
                                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,),
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
                );
              }
              ),
          ),
        );
      }))
     
    );
  }
}