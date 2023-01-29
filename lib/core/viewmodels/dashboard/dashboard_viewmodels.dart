import 'dart:developer';

import 'package:flutter/material.dart';

class DashboardViewmodel extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;

  List<String> _zoneToShow = [];
  List<String> get zoneToShow => _zoneToShow;
  set zoneToShow(List<String> val) {
    _zoneToShow = val;
    notifyListeners();
  }

  List<List> _buildingsAndTaxToShow = [];
  List<List> get buildingsAndTaxToShow => _buildingsAndTaxToShow;
  set buildingsAndTaxToShow(List<List> val) {
    _buildingsAndTaxToShow = val;
    log(_buildingsAndTaxToShow.toString());
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void setZoneList() {
    switch (selectedZone) {
      case 'Zone A':
        zoneToShow = zoneALgas;

        buildingsAndTaxToShow = zoneABuildingTaxRates;
        break;
      case 'Zone B':
        buildingsAndTaxToShow = zoneBBuildingTaxRates;

        break;
      case 'Zone C':
        zoneToShow = zoneCLgas;

        buildingsAndTaxToShow = zoneCBuildingTaxRates;

        break;
      default:
        zoneToShow = zoneALgas;
        buildingsAndTaxToShow = zoneABuildingTaxRates;
    }
  }

  String selectedZone = 'Zone A';

  List<String> zones = ['Zone A', 'Zone B', 'Zone C'];
  List<String> zoneALgas = [
    'Ilorin South',
    'Ilorin West',
    'Ilorin East',
    'Ilorin North'
  ];
  List<String> zoneBLgas = ['Zone A', 'Zone B', 'Zone C'];
  List<String> zoneCLgas = ['Shaare', 'Ekiti', 'Omu-Aran'];
  List<List> zoneABuildingTaxRates = [
    [
      'flat',
      'office block',
      'super markets',
      '1/2 bedroom bungalow',
      '3/4 bedroom bungalow',
      'Above 4 bedroom bungalow'
    ],
    ['1000', '2500', '3000', '1500', '2000', '2500'],
  ];

  List<List> zoneBBuildingTaxRates = [
    [
      'flat',
      'office block',
      'super markets',
      '1/2 bedroom bungalow',
      '3/4 bedroom bungalow',
      'Above 4 bedroom bungalow'
    ],
    ['500', '1500', '2000', '1000', '1500', '2500'],
  ];
  List<List> zoneCBuildingTaxRates = [
    [
      'flat',
      'office block',
      'super markets',
      '1/2 bedroom bungalow',
      '3/4 bedroom bungalow',
      'Above 4 bedroom bungalow'
    ],
    ['300', '1000', '1100', '500', '1000', '1500'],
  ];
}
