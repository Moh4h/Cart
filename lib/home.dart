import 'package:cart_example/checkout.dart';
import 'package:cart_example/model/cart.dart';
import 'package:cart_example/model/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(name: "fdsgdfg", price: 213123),
      Item(name: "Poco F5", price: 600),
      Item(name: "IPhone 15", price: 1090),
      Item(name: "Huawei", price: 910),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Text(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  "Total: ${context.watch<Cart>().getPrice}\$",
                ),
                IconButton(
                  onPressed: () {
                    if (context.read<Cart>().getItemCount != 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Checkout()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(
                              "there must be atlaest 1 item in the cart",
                            ),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Icon(Icons.shopping_bag, size: 32),
                ),
                Consumer<Cart>(
                  builder: (context, value, child) {
                    print("test consumer on cart");
                    return Text(
                      value.getItemCount.toString(),
                      style: TextStyle(fontWeight: FontWeight.w800),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent,
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          print("card");
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
                  context.read<Cart>().addItem(items[index]);
                },
                icon: Icon(Icons.add_circle),
              ),
            ),
          );
        },
      ),
    );
  }
}
