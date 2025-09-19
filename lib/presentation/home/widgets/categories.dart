import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_seeAll(), SizedBox(height: 20), _categories()]);
  }

  _seeAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "See All",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }

  _categories() {
    return Container(
      height: 100,
      color: Colors.transparent,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 18),
              Text("title"),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15);
        },
        itemCount: 10,
      ),
    );
  }
}
