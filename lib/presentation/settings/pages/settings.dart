import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/presentation/settings/widgets/my_favorites_tile.dart';
import 'package:flutter_ecommerce_app/presentation/settings/widgets/my_orders_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false, title: Text("Settings")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [MyFavoritesTile(), SizedBox(height: 15), MyOrdersTile()],
        ),
      ),
    );
  }
}
