import 'dart:convert';
import 'package:car_parking_system/Components/ConfirmPop.dart';
import 'package:car_parking_system/Models/ParkingModel.dart';
import 'package:car_parking_system/Models/SlotModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/SlotModel.dart';

class ParkingController1 extends GetxController {
  final fb = FirebaseDatabase.instance;

  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  var parkingHours = 10.0.obs;
  var amountPay = 100.0.obs;
  var selectedFloor = "1st Floor".obs;
  TextEditingController name = TextEditingController();
  var slot1Time = "".obs;
  var slot2Time = "".obs;
  var slot3Time = "".obs;
  var slot4Time = "".obs;
  var slot5Time = "".obs;
  var slot6Time = "".obs;
  var slot7Time = "".obs;
  var slot8Time = "".obs;
  var slot0Id = "A-0";
  var slot1Id = "A-1";
  var slot2Id = "A-2";
  var slot3Id = "A-3";
  var slot4Id = "A-4";
  var slot5Id = "A-5";
  var slot6Id = "A-6";
  var slot7Id = "A-7";
  var slot8Id = "A-8";
  Rx<SlotModel> slot0 = SlotModel().obs;
  Rx<SlotModel> slot1 = SlotModel().obs;
  Rx<SlotModel> slot2 = SlotModel().obs;
  Rx<SlotModel> slot3 = SlotModel().obs;
  Rx<SlotModel> slot4 = SlotModel().obs;
  Rx<SlotModel> slot5 = SlotModel().obs;
  Rx<SlotModel> slot6 = SlotModel().obs;
  Rx<SlotModel> slot7 = SlotModel().obs;
  Rx<SlotModel> slot8 = SlotModel().obs;

  @override
  void onInit() {
    super.onInit();
    initSlot();
    startDataUpdates();
  }

  Future<void> initSlot() async {
    try {
      await fb.ref().child(slot0Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot1Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot2Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot3Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot4Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot5Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot6Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot7Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
      await fb.ref().child(slot8Id).update(
        {
          "status": "avalible",
          "time": 0,
        },
      );
    } catch (ex) {
      print(ex.toString());
    }
  }

  void amountCalculator() {
    amountPay.value = parkingHours.value * 10;
  }

  void startDataUpdates() async {
    while (true) {
      getData();
      await Future.delayed(Duration(seconds: 1));
      print("Data loaded");
    }
  }

  void getData() async {
    final DatabaseReference res0 = fb.ref().child(slot0Id);
    res0.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot0.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res1 = fb.ref().child(slot1Id);
    res1.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot1.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res2 = fb.ref().child(slot2Id);
    res2.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot2.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res3 = fb.ref().child(slot3Id);
    res3.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot3.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res4 = fb.ref().child(slot4Id);
    res4.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot4.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res5 = fb.ref().child(slot5Id);
    res5.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot5.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res6 = fb.ref().child(slot6Id);
    res6.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot6.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res7 = fb.ref().child(slot7Id);
    res7.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot7.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
    final DatabaseReference res8 = fb.ref().child(slot8Id);
    res8.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      slot8.value = SlotModel.fromJson(
        json.decode(
          json.encode(dataSnapshot.value),
        ),
      );
    });
  }

  void addCar(SlotModel car) {
    fb.ref().push().set(car.toJson());
  }

  void parkingBook() async {}

  Future<void> bookSlot(
    String name,
    String vehicalNumber,
    String slotId,
    BuildContext context,
    double time,
    String totalamount,
  ) async {
    try {
      var updatedSlot = ParkingModel(
        id: slotId,
        name: name,
        status: "booked",
        price: totalamount,
        parkingStatus: "booked",
        slotNumber: slotId,
        vehicalNumber: vehicalNumber,
        totalAmount: totalamount,
        totalTime: time.toString(),
      );

      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection("parking")
          .doc(slotId)
          .set(
            updatedSlot.toJson(),
          );
      await fb.ref().child(slotId).update(
        {
          "status": "booked",
          "time": time,
        },
      );
      BookedPopup(
        context,
        slotId,
        totalamount,
        name,
        vehicalNumber,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkout(String slotId) async {
    isLoading.value = true;

    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .delete();

    await fb.ref().child(slotId).update(
      {
        "status": "avalible",
        "time": 0,
      },
    );

    isLoading.value = false;
  }
}
