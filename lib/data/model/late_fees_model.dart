class LateFeesModel{
 late final String? lateFeesType;
 late final String? lateFeesTypeDescription;


 LateFeesModel({
  required this.lateFeesType,
   this.lateFeesTypeDescription
});


 LateFeesModel.fromJson(Map<dynamic,dynamic>json){
  lateFeesType= json['lateFeesType'];
  lateFeesTypeDescription=json["lateFeesTypeDescription"];
 }

}