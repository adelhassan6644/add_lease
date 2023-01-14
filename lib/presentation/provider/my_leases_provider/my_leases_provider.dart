import 'package:flutter/cupertino.dart';
import '../../../data/model/lease_model.dart';

class MyLeasesProvider extends ChangeNotifier{

  List<MyLeasesModel>myLeases=[];
  bool  isLoading = false ;

  getLeasesData(){
    isLoading =true;
    notifyListeners() ;
    if(myLeases.isEmpty){
      myLeases.add(MyLeasesModel(title: "LS0041 - UN0039",
            subTitle: "ZAMZAM 1",
            status: "Pending",
            leaseType: "Part of the basement",
            price: "45,500.00",
            startDate: DateTime.now(),
            endDate:  DateTime.now(),
            lastBilling:  DateTime.now(),));
      myLeases.add(MyLeasesModel(
          title: "LS0041 - UN0040",
            subTitle: "ZAMZAM 2",
            status: "Done",
            leaseType: "Part of the basement",
            price: "45,500.00",
            startDate:  DateTime.now(),
            endDate:  DateTime.now(),
            lastBilling:  DateTime.now(),));
    }else{
      return ;
    }
    isLoading =false;
    notifyListeners();

  }


}