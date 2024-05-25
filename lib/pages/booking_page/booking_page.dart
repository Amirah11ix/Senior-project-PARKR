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
final CollectionReference bookingorder =FirebaseFirestore.instance.collection('bookingorder');
late String dateorder;


DateTime? selectedDate;  
class BookingPage extends StatelessWidget {
  final String slotName;
  final String slotId;
  
  const BookingPage({super.key, required this.slotId, required this.slotName});
  Future<void> addorder(String name,String car_plate,String data,String paytotal) {
    return bookingorder.add({
      'name': name,
      'car_plate': car_plate,
      'data': data,
      'paytotal': paytotal,
      'state':"false",
      'timestamp': Timestamp.now(),
    });
  }
  @override
  Widget build(BuildContext context)  {
    
    ParkingController parkingController = Get.put(ParkingController());
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "Booking Confirm",
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
                    "Book Now 😊",
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
                    "Enter your name ",
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: parkingController.name,
                      decoration: const InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: blueColor,
                        ),
                        hintText: "user name",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter Vehical Number ",
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: parkingController.vehicalNumber,
                      decoration: const InputDecoration(
                        fillColor: lightBg,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.car_rental,
                          color: blueColor,
                        ),
                        hintText: "",
                      ),
                    ),
                  )
                ],
              ),
 SizedBox(height: 20),
                Row(
                children: [
                  Expanded(
                    child: DateTimeFormField(
  decoration: const InputDecoration(
    labelText: 'Enter Date',
  ),
  firstDate: DateTime.now().add(const Duration(days: 10)),
  lastDate: DateTime.now().add(const Duration(days: 40)),
  initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
  onChanged: (DateTime? value) {
    selectedDate = value;

  },
  onSaved: (value) {
    selectedDate = value; // Save the selected date
  },

),
                  )
                ],
              ),




              SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Choose Slot Time (in Hours)",
                  )
                ],
              ),
              SizedBox(height: 10),
             Obx(() => Slider(
              mouseCursor: MouseCursor.defer,
                  thumbColor: blueColor,
                  activeColor: blueColor,
                  inactiveColor: lightBg,
                  label: "${parkingController.parkingTimeInMin.value} min",
                  value: parkingController.parkingTimeInMin.value,
                  onChanged: (v) {
                    parkingController.parkingTimeInMin.value = v;
                    if(v<=30)
                    {
                       parkingController.parkingAmount.value=30;
                    }
                    else{
                      parkingController.parkingAmount.value = 60;
                    }
                    //  parkingController.parkingAmount.value = (parkingController.parkingTimeInMin.value * 10).round();
                  },
                  divisions: 5,
                  min: 10,
                  max: 60,
                ),),
           const   Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("0.5"),
                    Text("1"),
                    Text("2"),
                    Text("4"),
                    Text("6"),
                    Text("8"),
                  ],
                ),
              ),
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
              SizedBox(height: 20),
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
                  InkWell(
                    onTap: () {
             
                   dateorder=selectedDate?.toString() ?? '';
                   addorder(parkingController.name.text.toString(),parkingController.vehicalNumber.value.text.toString(),dateorder,parkingController.parkingAmount.value.toString());
                       Navigator.push(context, MaterialPageRoute(
                          builder: (context) => bookingdetails(name:parkingController.name.text.toString(),vehicalNumber:parkingController.vehicalNumber.text.toString(), selectedDate: dateorder,Amount:parkingController.parkingAmount.value.toString(),slotName:slotName,slotId:slotId)));  
                     
               
               
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Confirm payment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}


