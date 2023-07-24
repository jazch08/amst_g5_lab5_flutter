import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amstg5_flutter/constants/colors.dart';
import 'package:amstg5_flutter/models/cart.dart';

class CartView extends StatefulWidget {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text("${demoCarts.getLenght()} items",
              style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
      elevation: 0,
    );
  }

  Widget _body(context) {
    return _itemListPromo(context);
  }

  ListView _itemListPromo(context) {
    return ListView.builder(
        itemExtent: 80,
        itemCount: demoCarts.getLenght(),
        itemBuilder: (context, index) => Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              key: Key(demoCarts.getItem(index).product.id.toString()),
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(color: Color(0xFFFFE6E6)),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              child: ListTile(
                leading: Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child:
                          Image.asset(demoCarts.getItem(index).product.image)),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      demoCarts.getItem(index).product.title,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text("\$${demoCarts.getItem(index).product.price}")
                  ],
                ),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Cantidad",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text("${demoCarts.getItem(index).numOfItems}"),
                    ]),
              ),
            ));
  }

  Widget _bottomNavBar(context) {
    return Container(
      height: 174,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: Colors.black.withOpacity(0.05))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total:",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text("\$ ${demoCarts.getTotal()}",
                  style: const TextStyle(color: Colors.white, fontSize: 28))
            ],
          ),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor, backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)))),
              onPressed: () => {},
              child: const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text(
                  "Check Out",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ))
        ],
      ),
    );
  }
}
