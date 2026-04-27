import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Services/shared_prefrs_singelton.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Features/OnBoarding/Presentation/Views/onboarding_view.dart';
import 'package:fruit_app/consts.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  void executeNavigation() async {
    bool hasSeenOnBoarding = SharedPrefrsSingelton.getbool(
      key: kIsSeenOnBoarding,
    );
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (hasSeenOnBoarding) {
      context.go('/${OnboardingView.routeName}');
    } else {
      context.go('/${OnboardingView.routeName}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: AlignmentGeometry.topLeft,
          child: SvgPicture.asset(Assets.assetsImagesPlant),
        ),
        Center(child: SvgPicture.asset(Assets.assetsImagesLogo)),
        SvgPicture.asset(Assets.assetsImagesCircels, fit: BoxFit.fill),
      ],
    );
  }
}
