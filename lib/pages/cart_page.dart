import "package:electronics/components/button.dart";
import "package:electronics/models/shop.dart";
import "package:electronics/pages/mobile_details.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../Themes/hyper.dart";
import "../models/Mobile.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Mobile mobile, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeToCart(mobile);
  }

  @override
  Widget build(BuildContext context) {
    // navigate mobile item details page
    void navigateToMobileDetails(Mobile mobile, BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MobileDetailsPage(
            mobile: mobile,
          ),
        ),
      );
    }

    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: primaryColor,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get mobile from cart
                  final Mobile gpu = value.cart[index];

                  // get mobile name
                  final String mobileName = gpu.name;

                  // get price
                  final String mobilePrice = gpu.price;

                  // get colors
                  final String mobileTypeRam = gpu.typeRam;

                  // get ram
                  final String mobileStorage = gpu.ram;

                  // return mobile list
                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      onTap: () => navigateToMobileDetails(gpu, context),
                      leading: Image.asset(
                        gpu.imagePath,
                        height: 200,
                      ),
                      title: Text(
                        mobileName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "\$ $mobilePrice \ncolor: $mobileTypeRam  \nstorage: $mobileStorage"
                        "gb",
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                        onPressed: () => removeFromCart(gpu, context),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
