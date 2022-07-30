// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_test__task/generated/l10n.dart';
import 'package:flutter_test__task/view/newUI/cart_screen.dart';
import 'package:flutter_test__task/view/newUI/profile_screen.dart';
import 'package:provider/provider.dart';

import '../../models/newmodel/button_navbar_provider.dart';
import '../../models/newmodel/product_group_model.dart';

import 'appbar_title_widget.dart';
import 'catalog_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
  final List<Widget> _widgetBuildBody = [
    const HomeBodyWidget(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navbar = Provider.of<ButtonNavBarProvider>(context);

    return Scaffold(
      /* appBar: AppBarTitleWidget(
        title: 'Wish Swish',
        automaticallyImplyLeading: false,
      ), */
      body: _widgetBuildBody.elementAt(navbar.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navbar.currentIndex,
        selectedItemColor: const Color(0xFF0C40A6),
        onTap: (index) => navbar.currentIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  void initState() {
    super.initState();
    isProgress = true;
  }

  bool isProgress = false;

  Future<List<ProductGroupModel>> _getItems() async {
    if (isProgress) {
      return Future.delayed(const Duration(milliseconds: 500), () => productGroup);
    } else {
      return productGroup;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitleWidget(
        title: S.of(context).appbar_title_WS,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding:const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 20.0,
            ),
            child: Text(
              S.of(context).catalog_title,
              style:const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: FutureBuilder<List<ProductGroupModel>>(
                  future: _getItems(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                          ),
                          itemBuilder: (context, index) {
                            return ProductGroupWidget(
                              productGroup: snapshot.data![index],
                              press: () => Navigator.pushNamed(
                                  context, '/catalog',
                                  arguments: CatalogScreen(
                                      productGroup:
                                          snapshot.data!.elementAt(index))),
                            );
                          });
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductGroupWidget extends StatelessWidget {
  const ProductGroupWidget({Key? key, this.productGroup, this.press})
      : super(key: key);
  final ProductGroupModel? productGroup;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  '${productGroup!.image}',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${productGroup!.title}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff212121),
                        ),
                      ),
                      Text('${productGroup!.sum} шт.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
