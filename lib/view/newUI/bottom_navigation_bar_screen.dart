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
      body: _widgetBuildBody.elementAt(navbar.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navbar.currentIndex,
        onTap: (index) => navbar.currentIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
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
      return Future.delayed(
          const Duration(milliseconds: 500), () => productGroup);
    } else {
      return productGroup;
    }
  }

  @override
  Widget build(BuildContext context) {
    void updateProductGroups() {
      productGroup.length;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBarTitleWidget(
        title: S.of(context).appbar_title_WS,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 20.0,
            ),
            child: Text(
              S.of(context).catalog_title,
              style: Theme.of(context).textTheme.bodyText1,
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
                      return RefreshIndicator(
                        color: Colors.white,
                        backgroundColor: const Color(0xFF0C40A6),
                        onRefresh: () async {
                          await Future.delayed(
                            const Duration(seconds: 1),
                          );
                          updateProductGroups();
                        },
                        child: GridView.builder(
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
                            }),
                      );
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
                        style: Theme.of(context).textTheme.subtitle2,
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
