import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> BookedPopup(BuildContext context, String slotId, String amount,
    String name, String vehicalNumber) {
  return Get.defaultDialog(
    barrierDismissible: false,
    title: "SLOT BOOKED",
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    ),
    content: Column(
      children: [
        Lottie.asset(
          'Assets/animation/done1.json',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Slot Booked",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Name : $name",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vehical No  : $vehicalNumber ",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Amount : $amount",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Parking Slot : $slotId",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //   Image.asset("Assets/Icons/currency.png",width: 20,),
        //     Text(
        //       " $amount",
        //       style: TextStyle(
        //         fontSize: 40,
        //         fontWeight: FontWeight.w700,
        //         color: Theme.of(context).colorScheme.primary,
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Close"),
        )
      ],
    ),
  );
}
