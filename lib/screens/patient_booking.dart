import 'package:doctor_booking/constants.dart';
import 'package:doctor_booking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientBooking extends StatefulWidget {
  const PatientBooking({super.key});

  @override
  State<PatientBooking> createState() => _PatientBookingState();
}

class _PatientBookingState extends State<PatientBooking> {

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: customText(
          text: "BOOK AN APPOINTMENT",
          color: customWhite,
          size: 20.0,
          weight: FontWeight.bold),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: customWhite,),
          onPressed: (){
            Get.back();
          },)
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height *2/3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customText(
                  text: "Patient Details",
                  color: mainColor,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 10,),
                Form(
                   key: _formKey,
                  child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",                                
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ],
                  
                )),

              ],
            ),
          ),
          Divider(height: 2,color: mainColor,),
          Container(
            height: MediaQuery.of(context).size.height/3,
            color: mainColor,
          ),
        ],
      ),
    );
  }
}