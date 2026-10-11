import 'package:car_parking_system/Controller/AuthController.dart';
import 'package:car_parking_system/Controller/ParkingController.dart';
import 'package:car_parking_system/Models/ParkingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/IotController.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ParkingController parkingController = Get.find();
    ParkingController1 parkingController1 = Get.find();
    parkingController.personalBooking();
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProfilePage"),
        actions: [
          IconButton(
            onPressed: () {
              parkingController.personalBooking();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder(
          stream: parkingController.getUserBookingAsync(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              List<ParkingModel> yourBooking = snapshot.data!;
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              "Assets/Photos/Profile.png",
                              width: 150,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Root User",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              "${authController.auth.currentUser!.email}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Your Bookings",
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: yourBooking
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "Assets/Photos/car.png",
                                            width: 150,
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("SLOT NO: ${e.slotNumber}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium),
                                              const SizedBox(height: 10),
                                              Text("${e.name}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Time : ${e.totalTime!} Mint"),
                                          Text("Amout : ${e.totalAmount!} Rs")
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              parkingController1
                                                  .checkout(e.slotNumber!);
                                            },
                                            icon: const Icon(Icons.done),
                                            label: const Text("Check Out"),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            } else {
              return Text("no data");
            }
          },
        ),
      ),
    );
  }
}
