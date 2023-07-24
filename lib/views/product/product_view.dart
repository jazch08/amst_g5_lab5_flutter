import 'package:flutter/material.dart';
import 'package:amstg5_flutter/constants/colors.dart';
import 'package:amstg5_flutter/models/product.dart';
import 'package:amstg5_flutter/models/cart.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductView extends StatefulWidget {
  final Product product;

  const ProductView(this.product, {super.key});

  @override
  State<ProductView> createState() => _ProductView();
}

class _ProductView extends State<ProductView> {
  late Product product;
  late double _rating;

  double _initialRating = 2.0;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.text_light,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamed("/cart-view"), //Aún no está creado
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200.0, right: 70),
                        child: Hero(
                            tag: "${product.id}",
                            child: Image.asset(product.image)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100, right: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _heading('Rating product'),
                              _ratingBar(),
                              const SizedBox(height: 20.0),
                              Text(
                                'Rating: $_rating',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    ]))
                  ],
                ))),
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
            child: Column(children: [
              const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
                  ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3.0),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000),
                    onTap: () => {demoCarts.addItem(product)},
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
              )
            ]),
          ),
        )
      ],
    );
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 50.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}
