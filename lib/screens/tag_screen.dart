import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_dengun_test/utils/text_styles.dart';
import 'package:shopify_dengun_test/view_models/product_view_model.dart';
import 'package:shopify_dengun_test/widgets/tag_card.dart';

import '../views/base_view.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({Key? key}) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  viewProducts(ProductViewModel productViewModel, String tag) {}

  @override
  Widget build(BuildContext context) => BaseView<ProductViewModel>(
        key: UniqueKey(),
        vmBuilder: (context) => Provider.of<ProductViewModel>(context),
        builder: buildScreen,
      );

  Widget buildScreen(
          BuildContext buildContext, ProductViewModel productViewModel) =>
      Scaffold(
        backgroundColor: const Color(0xfff5f6f7),
        appBar: AppBar(
          title: const Text(
            "Tags List",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          itemCount: productViewModel.tags.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
            color: Colors.blueGrey.withOpacity(.1),
          ),
          itemBuilder: (context, index) => TagCard(
            productViewModel: productViewModel,
            tag: productViewModel.tags.toList()[index],
          ),
        ),
      );
}
