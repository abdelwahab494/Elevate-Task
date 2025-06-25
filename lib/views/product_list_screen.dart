import 'package:elevate_task/models/product_model.dart';
import 'package:elevate_task/view_model/cart_viewmodel.dart';
import 'package:elevate_task/view_model/likes_viewmodel.dart';
import 'package:elevate_task/view_model/product_viewmodel.dart';
import 'package:elevate_task/views/cart_screen.dart';
import 'package:elevate_task/views/liked_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = Provider.of<ProductViewModel>(context);
    final cartVM = Provider.of<CartViewModel>(context);
    final likesVM = Provider.of<LikesViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
        leading: GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LikedScreen()),
              ),
          child: Icon(Icons.favorite, color: Color(0xff004081)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => CartScreen()),
                  ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Icon(Icons.shopping_cart, color: Color(0xff004081)),
                  ),
                  if (cartVM.cart.isNotEmpty)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            cartVM.cart.length.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: productVM.productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff004081)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(
                  color: Color(0xff004081),
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            );
          } else {
            final products = productVM.filterProducts(snapshot.data!);
            return SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            productVM.categoriesList.length,
                            (index) {
                              final category = productVM.categoriesList[index];
                              return GestureDetector(
                                onTap: () => productVM.setCategory(category),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff004081),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        productVM.selectedCategory == category
                                            ? Color(0xff004081)
                                            : Colors.white,
                                  ),
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color:
                                          productVM.selectedCategory == category
                                              ? Colors.white
                                              : Color(0xff004081),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.537,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xff004081),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 200,
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: Image.network(
                                            product.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap:
                                            () => likesVM.toggleLike(product),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            shape: BoxShape.circle,
                                          ),
                                          child:
                                              likesVM.likes.contains(product)
                                                  ? Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )
                                                  : Icon(
                                                    Icons.favorite_border,
                                                    color: Color(0xff004081),
                                                  ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Gap(10),
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                          color: Color(0xff332e6e),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Gap(5),
                                      Text(
                                        product.description,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Gap(6),
                                      Text(
                                        "EGP ${product.price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Review (${product.rating.rate})",
                                            style: TextStyle(
                                              color: Color(0xff332e6e),
                                            ),
                                          ),
                                          Gap(5),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFFFD61E),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap:
                                                () => cartVM.addToCart(product),
                                            child: Icon(
                                              CupertinoIcons.add_circled_solid,
                                              color: Color(0xff004081),
                                              size: 38,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
