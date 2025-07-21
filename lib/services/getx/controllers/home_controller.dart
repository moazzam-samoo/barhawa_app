import 'package:get/get.dart';

import '../../models/sale_model.dart';

class HomeController extends GetxController {
  // Observables for stats
  RxInt totalIncome = 56.obs;
  RxInt totalOrders = 120.obs;
  RxInt inventoryItems = 45.obs;
  RxInt customers = 110.obs;
  var showAllSales = false.obs;

  // List of recent sales
  RxList<SaleModel> recentSales = <SaleModel>[
    SaleModel(
      title: "Order #1110",
      servedBy: "Ali",
      amount: 800,
      time: "2:30 PM",
    ),
    SaleModel(
      title: "Order #1111",
      servedBy: "Zara",
      amount: 800,
      time: "3:15 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
    SaleModel(
      title: "Order #1112",
      servedBy: "Ahmed",
      amount: 950,
      time: "4:00 PM",
    ),
  ].obs;

  // Quick actions handler
  void onQuickAction(int index) {
    // Handle navigation or action here
    switch (index) {
      case 0:
        // Navigate to create bill
        break;
      case 1:
        // Navigate to add item
        break;
      case 2:
        // Navigate to inventory
        break;
      case 3:
        // Navigate to order receipt
        break;
      case 4:
        // Navigate to recent sales
        break;
    }
  }
}
