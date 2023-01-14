import 'dart:core';
import 'dart:developer';
import 'package:add_lease/data/model/deposit_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/model/late_fees_model.dart';
import '../../../data/model/tenant_model.dart';
import '../../add_lease_view/add_lease_views/deposits_view/units/deposit_unit.dart';

class LeaseProvider extends ChangeNotifier {
  // Lease Page View

  bool passPage = false;
  int nextStep = 0;

  onPassPage() {
    passPage = true;
    notifyListeners();
  }

  onFailPage() {
    passPage = false;
    notifyListeners();
  }

  previousPage({pageController}) {
    nextStep--;
    pageController.previousPage(
        duration: const Duration(microseconds: 500),
        curve: Curves.fastOutSlowIn);

    notifyListeners();
  }

  nextPage({pageController}) {
    nextStep++;
    pageController.nextPage(
        duration: const Duration(microseconds: 500),
        curve: Curves.fastOutSlowIn);

    notifyListeners();
  }

  // jumpPage({pageController,index}) {
  //   pageController.animateToPage(index,
  //       duration: const Duration(microseconds: 500),
  //       curve: Curves.fastOutSlowIn);
  //   notifyListeners();
  // }

  //Info Page View

  final GlobalKey<FormState> _infoFormKey = GlobalKey<FormState>();
  final TextEditingController _rentAmountControllerOfInfo =
      TextEditingController();
  final TextEditingController _forProposeActivityTypeOfInfo =
      TextEditingController();

  GlobalKey<FormState> get infoFormKey => _infoFormKey;
  TextEditingController get rentAmountControllerOfInfo =>
      _rentAmountControllerOfInfo;
  TextEditingController get forProposeActivityTypeOfInfo =>
      _forProposeActivityTypeOfInfo;

  DateTime? startDateTimeOfInfo;
  DateTime? endDateTimeOfInfo;
  DateTime? selectDayOfInfo;

  List<String> propertyItemsOfInfo = ["1", "2"];
  String? selectedPropertyItemsOfInfo;
  List<String> unitsItemOfInfo = ["1", "2"];
  String? selectedUnitsItemOfInfo;
  List<String> leaseTypeItemOfInfo = ["1", "2"];
  String? selectedLeaseTypeItemOfInfo;

  onSelectedPropertyItemsOfInfo(item) {
    selectedPropertyItemsOfInfo = item!;
    notifyListeners();
  }

  onSelectedUnitsItemOfInfo(item) {
    selectedUnitsItemOfInfo = item!;
    notifyListeners();
  }

  onSelectedLeaseTypeItemOfInfo(item) {
    selectedLeaseTypeItemOfInfo = item!;
    notifyListeners();
  }

  onStartDateTimeChangedOfInfo(DateTime newStartDateTime) {
    log("Your Selected Start Date: ${newStartDateTime.day}");
    startDateTimeOfInfo = newStartDateTime;
    notifyListeners();
  }

  onEndDateTimeChangedOfInfo(DateTime newEndDateTime) {
    log("Your Selected End Date: ${newEndDateTime.day}");
    endDateTimeOfInfo = newEndDateTime;
    notifyListeners();
  }

  onSelectDateTimeChangedOfInfo(DateTime onSelectNewDay) {
    log("Your Selected End Date: ${onSelectNewDay.day}");
    selectDayOfInfo = onSelectNewDay;
    notifyListeners();
  }

  //Deposit Page View
  final GlobalKey<FormState> _depositsFormKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _offset =
      Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));

  GlobalKey<FormState> get depositsFormKey => _depositsFormKey;
  ScrollController get scrollController => _scrollController;
  GlobalKey<AnimatedListState> get listKey => _listKey;
  Tween<Offset> get offset => _offset;

  List<Widget> depositUnits = [];
  List<String> utilityNamesOfDeposit = ["1", "2"];
  List<DepositModel> depositUnitsData = [];

  addFirstUnit({index}) {
    if (depositUnits.isEmpty && depositUnitsData.isEmpty) {
      Future.delayed(const Duration(milliseconds: 200), () {
        DepositModel data = DepositModel(
            depositAmount: null, rentDepositAmount: null, utilityName: null);
        depositUnitsData.add(data);
        depositUnits.add(DepositUnit(
          depositModel: depositUnitsData[index],
        ));
        listKey.currentState?.insertItem(index);
      });
    }
  }

  addDepositUnit({index}) {
    Future.delayed(const Duration(milliseconds: 200), () {
      DepositModel data = DepositModel(
          depositAmount: null, rentDepositAmount: null, utilityName: null);
      depositUnitsData.add(data);
      depositUnits.add(DepositUnit(
        depositModel: depositUnitsData[index],
      ));
      listKey.currentState
          ?.insertItem(index, duration: const Duration(milliseconds: 200));
    });

    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 200,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  removeDepositUnit({index}) {
    Future.delayed(const Duration(milliseconds: 200), () {
      listKey.currentState?.removeItem(
          index,
          (context, animation) => SlideTransition(
                position: animation.drive(offset),
                child: const SizedBox(),
              ),
          duration: const Duration(milliseconds: 200));
      depositUnitsData.removeAt(index);
      depositUnits.removeAt(index);
    });
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  //Tenants Page View
  final GlobalKey<FormState> _tenantsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get tenantsFormKey => _tenantsFormKey;
  List<TenantModel> tenants = [
    TenantModel(id: 1, tenantName: "Adel Hassan"),
    TenantModel(id: 2, tenantName: "Ibrahim Nagy"),
    TenantModel(id: 3, tenantName: "Fouad Hassan"),
    TenantModel(id: 3, tenantName: "ss aa"),
    TenantModel(id: 3, tenantName: "Mohamed Hassan"),
    TenantModel(id: 4, tenantName: "tenant Name"),
  ];
  List<TenantModel> findTenants = [];
  List<TenantModel> selectTenants = [];

  final TextEditingController _searchForTenantController =
      TextEditingController();
  TextEditingController get searchForTenantController =>
      _searchForTenantController;

  onSearchForTenant() {
    if (searchForTenantController.text.isEmpty) {
      findTenants = tenants;
      notifyListeners();
    } else {
      findTenants = tenants.where((tenant) => tenant.tenantName!.toLowerCase()
          .contains(searchForTenantController.text.toLowerCase())).toList();
      }
      notifyListeners();

     }

  initialTenantList(){
    findTenants= tenants;
    notifyListeners();
}

  onSelectTenant({ TenantModel? tenant}) {
    if (!selectTenants.contains(tenant)) {
      selectTenants.add(tenant!);
    } else {
      selectTenants.remove(tenant);
    }
    notifyListeners();
  }

//Extra Changes Page View
  final GlobalKey<FormState> _extraChangesFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get extraChangesFormKey => _extraChangesFormKey;
  List<String> propertyItemsOfExtraChanges = ["1", "2"];
  final TextEditingController _frequentAmountController =
      TextEditingController();
  TextEditingController get frequentAmountController =>
      _frequentAmountController;
  DateTime? startDateTimeForExtraChanges;

  DateTime? endDateTimeForExtraChanges;

  bool switchValue = false;
  String? selectPropertyOfPayments;

  void onSwitchAdvanced() {
    switchValue = !switchValue;
    notifyListeners();
  }

  onSelectPropertyOfPayments(item) {
    selectPropertyOfPayments = item!;
    notifyListeners();
  }

  onStartDateTimeChangedForExtraChanges(DateTime newStartDateTime) {
    log("Your Selected Start Date: ${newStartDateTime.day}");
    startDateTimeForExtraChanges = newStartDateTime;
    notifyListeners();
  }

  onEndDateTimeChangedForExtraChanges(DateTime newEndDateTime) {
    log("Your Selected End Date: ${newEndDateTime.day}");
    endDateTimeForExtraChanges = newEndDateTime;
    notifyListeners();
  }

//Late Fees Page View
  final GlobalKey<FormState> _lateFeesFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get lateFeesFormKey => _lateFeesFormKey;
  List<dynamic> discountType = [
    "5 %",
    "10 %",
    "15 %",
    "20 %",
  ];
  String? selectedDiscountType;

  onSelectDiscountType(item) {
    selectedDiscountType = item!;
    notifyListeners();
  }

  final TextEditingController _discountAmountController =
      TextEditingController();
  TextEditingController get discountAmountController =>
      _discountAmountController;

  DateTime? generateInvoiceOnDay;

  onGenerateInvoiceOnDay(DateTime day) {
    generateInvoiceOnDay = day;
    notifyListeners();
  }

  List<LateFeesModel> lateFeesType = [
    LateFeesModel(
        lateFeesType: "Next Period Billing",
        lateFeesTypeDescription:
            "When billing, invoice period is set as next month."),
    LateFeesModel(
        lateFeesType: "Waive Penalty",
        lateFeesTypeDescription: "For this lease, do not charge penalties."),
    LateFeesModel(
        lateFeesType: "Skip Starting Period",
        lateFeesTypeDescription:
            "For this lease, do not bill the first period."),
    LateFeesModel(
      lateFeesType: "Auto Renew Activation",
    ),
  ];
  LateFeesModel? selectedLateFeesType;

  onSelectLateFeesType({LateFeesModel? lateFeesType}) {
    if (selectedLateFeesType != lateFeesType) {
      selectedLateFeesType = lateFeesType;
    } else {
      selectedLateFeesType = null;
    }
    notifyListeners();
  }
}
