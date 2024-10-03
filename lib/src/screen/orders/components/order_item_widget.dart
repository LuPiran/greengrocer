import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    Key? key,
    required this.orderItem,
    required this.utilsServices,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity}${orderItem.item.unit} ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
            ),
          ),
          Text(
            utilsServices.pricetoCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
