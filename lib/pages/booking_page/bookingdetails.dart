// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_car_parking/controller/PakingController.dart';
import '../../config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:date_field/date_field.dart';

import 'package:smart_car_parking/pages/booking_page/bookingdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseFirestore db = FirebaseFirestore.instance;



late  String selectedDate; 
class bookingdetails extends StatelessWidget {
final String slotName;
final String slotId;
final String name;
final String vehicalNumber;
final String selectedDate;
String Amount;
  bookingdetails({super.key,required this.name, required this.vehicalNumber, required this.selectedDate,required this.Amount ,required this.slotId, required this.slotName});
  
  @override
  Widget build(BuildContext context)  {
    
    ParkingController parkingController = Get.put(ParkingController());
    // WithoutFirebase withoutFirebase = Get.put(WithoutFirebase());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "Booking detials",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                ],
              ),
              SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: blueColor,
              ),
              SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "your name ",
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child:  TextFormField(
                      enabled: false, 
                      decoration: InputDecoration(
                        fillColor: lightBg,
                        filled: false,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: blueColor,
                        ),
                        
                        hintText:name,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Vehical Number ",
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                     enabled: false,
                      decoration:  InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.car_rental,
                          color: blueColor,
                        ),
                        hintText:vehicalNumber,
                      ),
                    ),
                  )
                ],
              ),
 SizedBox(height: 20),
                
 const Row(
                children: [
                  Text(
                    "Date ",
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.car_rental,
                          color: blueColor,
                        ),
                        hintText: selectedDate,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 20),
              
             
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Cabinate",
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        slotName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Amount to Be Pay"),
                        ],
                      ),
                      Row(
                        children: [
                         Text("SAR"),
                         Obx(() => Text(
                              "${parkingController.parkingAmount.value}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: blueColor,
                              ),
                            ),)
                        ],
                      ),
                    ],
                  ),
                 
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
