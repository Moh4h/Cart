import 'package:cart_example/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              spacing: 8,
              children: [
                Text(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  "Count: ${context.watch<Cart>().getItemCount}",
                ),
                Text(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  "Total: ${context.watch<Cart>().getPrice}\$",
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent,
        title: Text("Check out"),
      ),
      body: ListView.builder(
        itemCount: context.watch<Cart>().getItemCount,
        itemBuilder: (context, index) {
          var items = context.watch<Cart>().getItem;
          return Card(
            child: ListTile(
              leading: Text(
                items[index].name.toString(),
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              title: Text(
                items[index].price.toString() + "\$",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  context.read<Cart>().removeItem(items[index]);
                },
                icon: Icon(Icons.remove_circle),
              ),
            ),
          );
        },
      ),
    );
  }
}
