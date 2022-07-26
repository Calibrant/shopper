import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../models/newmodel/cart_model.dart';
import '../../models/newmodel/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = context.watch<ProfileModel>().profiles;
    var cart = context.watch<CartModel>();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotoProfile(profile: profile),
            const SizedBox(height: 40.0),
            const Text('История покупок', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20.0),
            PurchaseHistory(profile: profile, cart: cart),
            const SizedBox(height: 20.0),
            PurchaseHistory(profile: profile, cart: cart),
            const SizedBox(height: 20.0),
            PurchaseHistory(profile: profile, cart: cart),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({
    Key? key,
    required this.profile,
    required this.cart,
  }) : super(key: key);

  final List<Profile> profile;
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.grey[200]),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Заказ №${profile.elementAt(0).order}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Text('${cart.totalPrice} ₽',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(cart.items[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      Text('${cart.items[index].price}₽',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final List<Profile> profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(profile.elementAt(0).image),
        const SizedBox(width: 8.0),
        Text(
          '${profile.elementAt(0).firstName}'
          '\n'
          '${profile.elementAt(0).secondName}',
          style: const TextStyle(
            color: Color(0xff1F1F1F),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
