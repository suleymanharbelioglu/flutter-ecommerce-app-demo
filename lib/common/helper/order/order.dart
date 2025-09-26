import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_app/data/order/model/order_status.dart';

class OrdeHelper {
  static String createOrderCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    final code = List.generate(
      6,
      (index) => chars[rand.nextInt(chars.length)],
    ).join();
    return '#$code';
  }

  static List<OrderStatusModel> randomOrderStatusListCreater() {
    final rand = Random();
    const titles = [
      "Pending",
      "Processing",
      "Shipped",
      "Delivered",
      "Cancelled",
    ];

    // 2 ile 6 arasında random uzunluk
    final count = rand.nextInt(5) + 2; // 0–4 → +2 = 2–6

    return List.generate(count, (_) {
      return OrderStatusModel(
        title: titles[rand.nextInt(titles.length)],
        done: rand.nextBool(),
        createdDate: Timestamp.fromDate(
          DateTime.now().subtract(Duration(days: rand.nextInt(30))),
        ),
      );
    });
  }
}
