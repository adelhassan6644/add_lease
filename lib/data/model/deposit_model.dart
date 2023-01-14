class DepositModel {
    String? rentDepositAmount;
    String? utilityName;
    String? depositAmount;

  DepositModel(
      {required this.depositAmount,
      required this.rentDepositAmount,
      required this.utilityName});



  DepositModel.fromJson(Map<dynamic,dynamic>json){
    rentDepositAmount = json["rentDepositAmount"];
    utilityName = json["utilityName"];
    depositAmount = json["depositAmount"];
  }
}
