class BannerModel {
  bool? status;
  dynamic message;
  List<BannerData>? data;

  BannerModel({this.status, this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(new BannerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerData {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  BannerData({this.id, this.image, this.category, this.product});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['category'] = category;
    data['product'] = product;
    return data;
  }
}