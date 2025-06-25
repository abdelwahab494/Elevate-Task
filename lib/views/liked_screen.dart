import 'package:elevate_task/view_model/likes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LikesViewModel>(
      builder: (context, likesVM, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            title: Text(
              "Liked Products",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
          ),
          body:
              (likesVM.likes.isEmpty)
                  ? Center(
                    child: Text(
                      "No liked Products yet.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: likesVM.likes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = likesVM.likes[index];
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff004081),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 90,
                              child: Image.network(
                                product.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => likesVM.toggleLike(product),
                              child: Icon(Icons.favorite, color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
        );
      },
    );
  }
}
