import 'package:flutter/material.dart';
import 'package:greengrocer/src/configs/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/views/components/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.item});

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Content
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(0, 2)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              widget.item.itemName,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          )
                        ],
                      ),
                      Text(widget.item.price.toString(),
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor,
                          )),

                      // Description

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: TextStyle(
                                  height: 1.5, color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.customSwatchColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          label: const Text(
                            'Adicionar ao carrinho',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios),
              color: CustomColors.customSwatchColor,
              iconSize: 32,
            )),
          )
        ],
      ),
    );
  }
}
