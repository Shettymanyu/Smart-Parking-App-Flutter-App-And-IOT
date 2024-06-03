
class ParkingModel {
  String? id;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? price;
  String? status;
  String? bookingTime;
  String? parkingTime;
  String? vehicalNumber;
  String? slotNumber;
  String? parkingFromTime;
  String? parkingToTime;
  String? totalTime;
  String? totalRemainingTime;
  String? totalAmount;
  String? parkingStatus;
  String? liveVideoUrl;
  String? checkOutTime;

  ParkingModel({this.id, this.name, this.address, this.latitude, this.longitude, this.price, this.status, this.bookingTime, this.parkingTime, this.vehicalNumber, this.slotNumber, this.parkingFromTime, this.parkingToTime, this.totalTime, this.totalRemainingTime, this.totalAmount, this.parkingStatus, this.liveVideoUrl, this.checkOutTime});

  ParkingModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    price = json["price"];
    status = json["status"];
    bookingTime = json["bookingTime"];
    parkingTime = json["parkingTime"];
    vehicalNumber = json["vehicalNumber"];
    slotNumber = json["slotNumber"];
    parkingFromTime = json["parkingFromTime"];
    parkingToTime = json["parkingToTime"];
    totalTime = json["totalTime"];
    totalRemainingTime = json["totalRemainingTime"];
    totalAmount = json["totalAmount"];
    parkingStatus = json["parkingStatus"];
    liveVideoUrl = json["liveVideoUrl"];
    checkOutTime = json["checkOutTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["address"] = address;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["price"] = price;
    data["status"] = status;
    data["bookingTime"] = bookingTime;
    data["parkingTime"] = parkingTime;
    data["vehicalNumber"] = vehicalNumber;
    data["slotNumber"] = slotNumber;
    data["parkingFromTime"] = parkingFromTime;
    data["parkingToTime"] = parkingToTime;
    data["totalTime"] = totalTime;
    data["totalRemainingTime"] = totalRemainingTime;
    data["totalAmount"] = totalAmount;
    data["parkingStatus"] = parkingStatus;
    data["liveVideoUrl"] = liveVideoUrl;
    data["checkOutTime"] = checkOutTime;
    return data;
  }
}