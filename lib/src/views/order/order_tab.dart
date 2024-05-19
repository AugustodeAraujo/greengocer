import 'package:flutter/material.dart';
import 'package:greengrocer/src/configs/custom_colors.dart';
import 'package:greengrocer/src/configs/app_data.dart' as app_data;
import 'package:greengrocer/src/views/order/components/order_tile.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        elevation: 0,
        title: const Text.rich(TextSpan(
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
                text: 'Pedidos',
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        )),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
        itemCount: app_data.orders.length,
      ),
    );
  }
}
