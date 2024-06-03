#include <Arduino.h>
#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

#define WIFI_SSID "IOT"
#define WIFI_PASSWORD "Nitishroy7033"
#define API_KEY "AIzaSyBP4t64M2hXJlCrlIasPbXrCkOXY6PlgIc"
#define DATABASE_URL "parkingsystem-b28bb-default-rtdb.firebaseio.com/"

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

#define slot1KEY "A-0";
#define slot2KEY "A-1";
#define slot3KEY "A-2";
#define slot4KEY "A-3";
#define A1 D4
#define A2 D1
#define A3 D3
#define A4 D0
#define slot1Light D8
#define slot2Light D5
#define slot3Light D6
#define slot4Light D7
int slot1 = 2;
int slot2 = 2;
int slot3 = 2;
int slot4 = 2;


String sValue, sValue2;
bool signupOK = false;

void setup() {
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.println("-----------------");
  Serial.print("Connecting to WiFi  ");
  Serial.println(WIFI_SSID);
  Serial.println("");
  Serial.print(" Loading  ");
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(" 👉 ");
  }
  Serial.println("");
  Serial.print(" Wifi Connected !😊 With ");
  Serial.println(WIFI_SSID);
  Serial.println("-----------------");
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;
  auth.user.email = "root@gmail.com";
  auth.user.password="rootroot";
  Firebase.begin(&config, &auth);
  Serial.println("Firebase Login ! 😊 ");
  config.token_status_callback = tokenStatusCallback;  //see addons/TokenHelper.h
  Firebase.reconnectWiFi(true);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(slot1Light, OUTPUT);
  pinMode(slot2Light, OUTPUT);
  pinMode(slot3Light, OUTPUT);
  pinMode(slot4Light, OUTPUT);
  digitalWrite(slot1Light, LOW);
  digitalWrite(slot2Light, LOW);
  digitalWrite(slot3Light, LOW);
  digitalWrite(slot4Light, LOW);

}

void loop() {
  slot1 = digitalRead(A1);
  slot2 = digitalRead(A2);
  slot3 = digitalRead(A3);
  slot4 = digitalRead(A4);
  // Firebase.RTDB.getString(&fbdo, "/L1")
  
  if (slot1 == 0) {
    Serial.println("Slot : A-0 - Car parked 😍");
    digitalWrite(slot1Light, HIGH);
    Firebase.RTDB.setString(&fbdo, "A-0/status","parked");
  } else {
    Firebase.RTDB.setString(&fbdo, "A-0/status","avalible");
    digitalWrite(slot1Light, LOW);
    Serial.println("Slot : A-1 - Avalible 👌");
  }
  if (slot2 == 0) {
    Serial.println("Slot : A-2 - Car parked 😍");
    digitalWrite(slot2Light, HIGH);
    Firebase.RTDB.setString(&fbdo, "A-1/status","parked");
  } else {
    Serial.println("Slot : A-2 - Avalible 👌");
    digitalWrite(slot2Light, LOW);
    Firebase.RTDB.setString(&fbdo, "A-1/status","avalible");
  }
  if (slot3 == 0) {
    Serial.println("Slot : A-3 - Car parked 😍");
    digitalWrite(slot3Light, HIGH);
     Firebase.RTDB.setString(&fbdo, "A-2/status","parked");
  } else {
    Serial.println("Slot : A-3 - Avalible 👌");
    digitalWrite(slot3Light, LOW);
       Firebase.RTDB.setString(&fbdo, "A-2/status","avalible");
  }
  if (slot4 == 0) {
    Serial.println("Slot : A-4 - Car parked 😍");
    digitalWrite(slot4Light, HIGH);
     Firebase.RTDB.setString(&fbdo, "A-3/status","parked");
  } else {
    Serial.println("Slot : A-4 - Avalible 👌");
    digitalWrite(slot4Light, LOW);
      Firebase.RTDB.setString(&fbdo, "A-3/status","avalible");
  }
  Serial.println("-------------------------------");

  
}