class TimeRecord {
  String name;
  String address;
  String img;

  TimeRecord({this.name, this.address, this.img});

  TimeRecord.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['img'] = this.img;
    return data;
  }
}