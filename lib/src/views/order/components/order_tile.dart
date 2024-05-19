import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:greengrocer/src/configs/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/orders_model.dart';
import 'package:greengrocer/src/views/order/components/order_status.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, //
                children: [
                  Text(
                    'Pedido: ${order.id}',
                    style: TextStyle(
                      color: CustomColors.customSwatchColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text('Data: ${order.createdDateTime}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 150,
                          child: ListView(
                            children: order.items.map((orderItem) {
                              return _OrderItemWidget(
                                orderItem: orderItem,
                              );
                            }).toList(),
                          ),
                        )),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                        flex: 2,
                        child: OrderStatusWidget(
                          status: order.status,
                          isOverdue:
                              order.overdueDateTime.isBefore(DateTime.now()),
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.orderItem,
  });

  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${orderItem.quantity.toString()} ${orderItem.item.unit} ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Expanded(
            child: Text(
              orderItem.item.itemName,
              style: const TextStyle(),
            ),
          ),
          Text(orderItem.totalPrice().toString())
        ],
      ),
    );
  }
}
