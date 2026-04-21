import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Home/Presentation/Views/Widgets/offer_banner_item.dart';

class OfferBannerRow extends StatelessWidget {
  const OfferBannerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: OfferBannerItem(),
            ),
          ),
        ),
      ),
    );
  }
}