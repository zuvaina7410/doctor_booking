import 'dart:convert';

List<DoctorModel> doctorFromJson(String str)=>List<DoctorModel>.from(
  json.decode(str).map((x)=>DoctorModel.fromJson(x)));

class DoctorModel {
   String id;
  String name;
  String image;
  String gender;
  String time;
  String location;
  String department;

    DoctorModel({
       required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.time,
    required this.location,
    required this.department,
    });

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
     
        id: json["id"],
        name: json["name"],
        image: json["image"],
        gender: json["gender"],
        time: json["time"],
        location: json["location"],
        department: json["department"],
    );

    Map<String, dynamic> toJson() => {
        
        "id": id,
        "name": name,
        "image": image,
        "gender":gender,
        "time":time,
        "location":location,
        "department":department,

    };
}


