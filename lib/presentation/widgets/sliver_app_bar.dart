import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text("Weather App"),
        centerTitle: true,
        background: Image.network(
          "https://nordicapis.com/wp-content/uploads/5-Best-Free-and-Paid-Weather-APIs-2019-e1587582023501.png",
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.search))
      ],
    );
  }
}
