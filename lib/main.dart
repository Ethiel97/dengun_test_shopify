import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_dengun_test/network/api_provider.dart';
import 'package:shopify_dengun_test/screens/tag_screen.dart';
import 'package:shopify_dengun_test/utils/text_styles.dart';
import 'package:shopify_dengun_test/view_models/product_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiProvider>(
          create: (context) => ApiProvider(),
        ),
        ChangeNotifierProvider<ProductViewModel>(
          create: (context) => ProductViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: TextStyles.textStyle.fontFamily,
        ),
        home: const TagScreen(),
      );
}
