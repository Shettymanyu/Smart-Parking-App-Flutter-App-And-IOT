import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerTile extends StatelessWidget {
  final RxString fromTime;
  final RxString toTime;

  const TimerTile({
    super.key,
    required this.fromTime,
    required this.toTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From Time",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  fromTime.value = time.format(context);
                  print(fromTime.value);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer_sharp,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Obx(
                      () => Text(fromTime.value,
                          style: Theme.of(context).textTheme.bodyLarge),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To Time",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  toTime.value = time.format(context);
                  print(toTime.value);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer_sharp,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Obx(
                      () => Text(toTime.value,
                          style: Theme.of(context).textTheme.bodyLarge),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
