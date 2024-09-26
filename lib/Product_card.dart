
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled/model_class.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              widget.product.image,
              height: 70,
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 10),
            RatingBarIndicator(
              rating: widget.product.rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
            SizedBox(height: 10),
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAddedToCart = !isAddedToCart;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isAddedToCart ? Icons.remove_shopping_cart : Icons.shopping_cart,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(isAddedToCart ? 'Remove from Cart' : 'Add to Cart'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
