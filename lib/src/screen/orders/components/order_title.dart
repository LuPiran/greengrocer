import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/screen/common_widgets/payment_dialog.dart';
import 'package:greengrocer/src/screen/orders/components/order_item_widget.dart';
import 'package:greengrocer/src/screen/orders/components/order_status.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderTitle extends StatelessWidget {
  final OrderModel order;
  OrderTitle({Key? key, required this.order}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pedido: ${order.id}",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //Produtos do pedido
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return OrderItemWidget(
                            orderItem: orderItem,
                            utilsServices: utilsServices,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  //Divisao
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  //Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatus(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: utilsServices.pricetoCurrency(order.total))
                ],
              ),
            ),
            //Botao de pagamento
            Visibility(
              visible: order.status == 'pending_payment',
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: CustomColors.customSwatchColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(
                          order: order,
                        );
                      },
                    );
                  },
                  icon: Image.asset(
                    "assets/app_images/pix.png",
                    height: 18,
                  ),
                  label: Text(
                    "Ver QR Code Pix",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
