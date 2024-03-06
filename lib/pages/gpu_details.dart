import 'package:electronics/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/Gpu.dart';
import '../models/shop.dart';

class GpuDetailsPage extends StatefulWidget {
  final Gpu gpu;
  const GpuDetailsPage({super.key, required this.gpu});

  @override
  State<GpuDetailsPage> createState() => _GpuDetailsPageState();
}

class _GpuDetailsPageState extends State<GpuDetailsPage> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.gpu, quantityCount);
      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[700],
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(
              onPressed: () {
                // pop once to remove dialog box
                Navigator.pop(context);

                // pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of mobile details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.gpu.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // rating
                  Row(
                    children: [
                      // star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // rating number
                      Text(
                        widget.gpu.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  // name mobile
                  Text(
                    widget.gpu.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 25),
                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.gpu.description.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // price + quantity + add cart
          Container(
            color: Colors.grey[700],
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      "\$ ${widget.gpu.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // quntity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400], shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () => decrementQuantity(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // count quantity
                        SizedBox(
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // plus  button
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400], shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () => incrementQuantity(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                //add cart
                MyButton(
                  text: "Add to Cart",
                  onTap: addToCart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
