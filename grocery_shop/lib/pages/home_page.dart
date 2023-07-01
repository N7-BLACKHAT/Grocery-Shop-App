import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //for making cart button
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag,
        ),
      ),
      body: SafeArea(
        //avoids things to go to notch
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //good morning
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good Morning'),
            ),
            const SizedBox(
              height: 4,
            ),
            //let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh  items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                //adds horizontal dividing line
                thickness: 3,
              ),
            ),
            //fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh items",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            //grid
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //2 in each row
                      childAspectRatio: 1 / 1.3, //make rectangle shape
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index]
                            [0], //0 index listitems are name
                        itemPrice: value.shopItems[index]
                            [1], //1 index listitems are price
                        imagePath: value.shopItems[index]
                            [2], //2 index listitems are image
                        color: value.shopItems[index]
                            [3], //3 index listitems are color
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
