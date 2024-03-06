import 'package:flutter/material.dart';

import '../models/Gpu.dart';

class GpuTile extends StatelessWidget {
  final Gpu gpu;
  final void Function()? onTap;

  const GpuTile({super.key, required this.gpu, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Image.asset(
              gpu.imagePath,
              height: 140,
            ),

            // text
            Text(
              gpu.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // price + rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    "\$ ${gpu.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  //rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      Text(
                        gpu.rating,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
