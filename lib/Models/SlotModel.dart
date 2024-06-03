
class SlotModel {
  String? status;
  int? time;

  SlotModel({this.status, this.time});

  SlotModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["time"] is int) {
      time = json["time"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["time"] = time;
    return _data;
  }
}