import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
