import 'package:flutter/material.dart';
import 'package:shopify_dengun_test/utils/text_styles.dart';
import 'package:shopify_dengun_test/view_models/product_view_model.dart';

class TagCard extends StatelessWidget {
  final ProductViewModel productViewModel;
  final String tag;
  const TagCard({
    Key? key,
    required this.productViewModel,
    required this.tag,
  }) : super(key: key);

  viewProducts(
      ProductViewModel productViewModel, String tag, BuildContext context) {
    productViewModel.selectTag(tag, context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewProducts(productViewModel, tag, context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        padding: const EdgeInsets.all(12),
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
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 30,
              child: Text(
                tag.substring(0, 1),
                style: TextStyles.textStyle.apply(
                  fontWeightDelta: 5,
                  color: Colors.white,
                  fontSizeDelta: 10,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                tag,
                style: TextStyles.textStyle.apply(
                  fontSizeDelta: 4,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            IconButton(
              onPressed: () => viewProducts(productViewModel, tag, context),
              // color: Colors.black,
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            )
          ],
        ),
      ),
    );
  }
}
