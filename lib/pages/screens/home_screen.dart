import 'package:barhawa_app/services/getx/controllers/auth_controllers/home_controller.dart';
import 'package:barhawa_app/widgets/global/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../services/models/sale_model.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildInfoSection(),
            SizedBox(height: 10.h),
            LabelText(text: "Quick Actions", style: AppTextStyles.description),
            _buildQuickActions(),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(
                  text: "Recent Sales",
                  style: AppTextStyles.description,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.showAllSales.value) {
                      Get.back(); // close modal
                      controller.showAllSales.value = false;
                    } else {
                      controller.showAllSales.value = true;
                      _showFullSalesList(context);
                    }
                  },
                  child: Obx(
                    () => Text(
                      controller.showAllSales.value ? "Hide All" : "View All",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [_buildRecentSalesList()]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.receipt_long, 'label': 'Create bill'},
      {'icon': Icons.add, 'label': 'Add Item'},
      {'icon': Icons.inventory, 'label': 'Manage Inventory'},
      {'icon': Icons.receipt, 'label': 'Order Receipt'},
      {'icon': Icons.shopping_cart, 'label': 'Recent Sales'},
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: actions.map((action) {
            return GestureDetector(
              onTap: () => controller.onQuickAction(actions.indexOf(action)),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: const Color(0xffFBE5E9),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      action['icon'] as IconData,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text.rich(
                    TextSpan(
                      children: (action['label'] as String).split(' ').map((
                        word,
                      ) {
                        return TextSpan(text: '$word\n');
                      }).toList(),
                    ),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Obx(() {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.2,
        children: [
          _buildInfoBox(
            Icons.attach_money,
            "Total Income",
            "${controller.totalIncome.value}K",
            "+0.8%",
          ),
          _buildInfoBox(
            Iconsax.box_1,
            "Total Orders",
            "${controller.totalOrders.value}",
            "+12.04%",
          ),
          _buildInfoBox(
            Iconsax.activity,
            "Inventory Items",
            "${controller.inventoryItems.value}",
            "+118%",
          ),
          _buildInfoBox(
            Icons.group,
            "Customers",
            "${controller.customers.value}",
            "+90.04%",
          ),
        ],
      );
    });
  }

  Widget _buildInfoBox(
    IconData icon,
    String title,
    String value,
    String change,
  ) {
    return Container(
      height: 136.h,
      width: 165.w,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 38.sp),
            SizedBox(height: 10.h),
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: AppTextStyles.h2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "↑$change",
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage('assets/icons/pizza.png'),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: AppTextStyles.caption.copyWith(color: AppColors.primary),
            ),
            Text("Italian Pizza", style: AppTextStyles.h3),
            Text(
              DateFormat('MMMM d, yyyy').format(DateTime.now()),
              style: AppTextStyles.overline,
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: const Color(0xffFBE5E9),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.notifications_none, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildRecentSalesList() {
    return Obx(() {
      final isExpanded = controller.showAllSales.value;
      final fullList = controller.recentSales;

      return AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: isExpanded
              ? fullList.length
              : (fullList.length > 3 ? 3 : fullList.length),
          separatorBuilder: (_, __) => SizedBox(height: 8.h),
          itemBuilder: (_, i) => _buildSaleItem(fullList[i]),
        ),
      );
    });
  }

  Widget _buildSaleItem(SaleModel sale) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffE4E7EB)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xffFBE5E9),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.receipt, color: AppColors.primary),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sale.title, style: AppTextStyles.bodyLarge),
                Text(
                  "Served by ${sale.servedBy}",
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "PKR ${sale.amount}",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(sale.time, style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }

  void _showFullSalesList(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.85,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All Sales", style: AppTextStyles.h2),
            SizedBox(height: 12.h),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.recentSales.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (_, i) =>
                      _buildSaleItem(controller.recentSales[i]),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    ).whenComplete(() => controller.showAllSales.value = false);
  }
}
