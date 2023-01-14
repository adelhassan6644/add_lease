class TenantModel {
late final int? id;
 late final String? tenantName;

 TenantModel({
  required this.id,required this.tenantName
});


 TenantModel.fromJson(Map<dynamic,dynamic> json){
   id = json['id'];
  tenantName = json['tenantName'];
 }

}