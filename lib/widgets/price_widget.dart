import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  double price;
  double oldPrice;
  double width;

  PriceWidget(
      {Key? key,
      required this.price,
      required this.oldPrice,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$price DH',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(width: 5),
          price != oldPrice
              ? Text(
                  '$oldPrice DH',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
