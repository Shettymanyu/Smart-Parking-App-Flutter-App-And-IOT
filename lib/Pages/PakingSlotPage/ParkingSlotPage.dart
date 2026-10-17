import 'package:car_parking_system/ConstData.dart';
import 'package:car_parking_system/Pages/PakingSlotPage/Widgets/ParkingSlot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ParkingController.dart';
import '../../Controller/IotController.dart';

class ParkingSlotPage extends StatelessWidget {
  const ParkingSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    ParkingController1 parkingController1 = Get.put(ParkingController1());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PARKING SLOTS",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [Text("ENTRY"), Icon(Icons.keyboard_arrow_down)],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot0.value.status!,
                    slotName: "A-0",
                    slotId: "A-0",
                    time: parkingController1.slot0.value.time.toString(),
                  ),
                )),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot1.value.status!,
                    slotName: "A-1",
                    slotId: "A-1",
                    time: parkingController1.slot1.value.time.toString(),
                  ),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot2.value.status!,
                    slotName: "A-2",
                    slotId: "A-2",
                    time: parkingController1.slot2.value.time.toString(),
                  ),
                )),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot3.value.status!,
                    slotName: "A-3",
                    slotId: "A-3",
                    time: parkingController1.slot3.value.time.toString(),
                  ),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot4.value.status!,
                    slotName: "A-4",
                    slotId: "A-4",
                    time: parkingController1.slot4.value.time.toString(),
                  ),
                )),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot5.value.status!,
                    slotName: "A-5",
                    slotId: "A-5",
                    time: parkingController1.slot5.value.time.toString(),
                  ),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Obx(
                  () => ParkingSlot(
                    parkingStatus: parkingController1.slot6.value.status!,
                    slotName: "A-6",
                    slotId: "A-6",
                    time: parkingController1.slot6.value.time.toString(),
                  ),
                )),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ParkingSlot(
                      parkingStatus: parkingController1.slot7.value.status!,
                      slotName: "A-7",
                      slotId: "A-7",
                      time: parkingController1.slot7.value.time.toString(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [Text("EXIT"), Icon(Icons.keyboard_arrow_down)],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Made By ❤️ : $LeaderName",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
