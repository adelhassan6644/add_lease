class MyLeasesModel{
  late final String? title;
  late final String? subTitle;
  late final String? status;
  late final String? leaseType;
  late final String? price;
  late final DateTime? startDate;
  late final DateTime? endDate;
  late final DateTime? lastBilling;

  MyLeasesModel({
    required this.title,
    required this.subTitle,
    required this.status,
    required this.leaseType,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.lastBilling
});

  MyLeasesModel.fromJson(Map<dynamic,dynamic>json){
    title=json["title"];
    subTitle=json["subTitle"];
    status=json["status"];
    leaseType=json["leansType"];
    price=json["price"];
    startDate=json["startDate"];
    endDate=json["endDate"];
    lastBilling=json["lastBilling"];
  }






}