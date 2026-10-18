import 'package:car_parking_system/ConstData.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "SMART CAR PARKING",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    width: 5,
                    color: Colors.orange.shade600,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(profilePath),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LeaderName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  bio,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  var url = Uri.parse(youtube);
                  await launchUrl(url);
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "Assets/Icons/youtube.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  var url = Uri.parse(linkedin);
                  await launchUrl(url);
                  if (await canLaunchUrl(url)) {
                  } else {
                    print("Could not launch $url");
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "Assets/Icons/linkeding.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  var url = Uri.parse(github);
                  await launchUrl(url);
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "Assets/Icons/github.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
