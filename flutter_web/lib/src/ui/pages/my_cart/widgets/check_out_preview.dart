import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_controllers/my_cart_controller.dart';
import 'package:ui_ux/src/utils/colors.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class CheckOutPreview extends StatelessWidget {
  const CheckOutPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MyCartController>();
    if (!controller.hasItems) return Container(height: 0);

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15).copyWith(top: 30),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Table(
              children: [
                _buildTableRow("Subtotal", "\$${controller.subtotal}"),
                _buildTableRow("Tax & fee", "\$${controller.taxAndFee}"),
                _buildTableRow("Delivery", "\$${controller.delivery}"),
                _buildTableRow("Total", "\$${controller.total}"),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: () {},
                color: Colors.white,
                child: Text(
                  "CHECKOUT",
                  style: FontStyles.title.copyWith(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Text(
          label,
          style: FontStyles.regular.copyWith(color: Colors.white),
        ),
        Text(
          value,
          style: FontStyles.title.copyWith(
            color: Colors.white,
            fontSize: 15,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
