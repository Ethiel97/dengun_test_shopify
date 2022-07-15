import 'package:flutter/material.dart';
import 'package:shopify_dengun_test/models/product.dart' as pd;
import 'package:shopify_dengun_test/utils/text_styles.dart';
import 'package:shopify_dengun_test/view_models/product_view_model.dart';

class ProductCard extends StatelessWidget {
  final ProductViewModel productViewModel;
  final pd.Product product;
  const ProductCard({
    Key? key,
    required this.productViewModel,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                blurRadius: 32,
                color: Colors.blueGrey.withOpacity(.04),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image.src,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                product.title,
                style: TextStyles.textStyle.apply(
                  fontSizeDelta: -4,
                  fontWeightDelta: 5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: '${product.variants.length}',
                  style: TextStyles.textStyle.apply(
                    fontSizeDelta: 1,
                    color: Colors.orangeAccent,
                    fontWeightDelta: 9,
                  ),
                  children: [
                    TextSpan(
                      text: '  variants',
                      style: TextStyles.textStyle.apply(
                        fontSizeDelta: -2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
