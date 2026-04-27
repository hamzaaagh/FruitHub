import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/Core/Services/shared_prefrs_singelton.dart';
import 'package:fruit_app/Core/Widgets/custom_button.dart';
import 'package:fruit_app/Core/utils/app_assets.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:fruit_app/Features/Auth/Presentation/Views/login_view.dart';
import 'package:fruit_app/consts.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.vectorcolor,
    required this.midleimage,
    required this.title,
    required this.description,
    required this.currentpage,
  });

  final Color vectorcolor;
  final String midleimage;
  final Widget title;
  final String description;

  final int currentpage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الصورة الخلفية
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.assetsImagesVector,
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(vectorcolor, BlendMode.srcIn),
                ),
              ),
              // زر تخط
              Visibility(
                visible: currentpage == 0,
                child: Positioned(
                  top: 40,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      context.go("/${LoginView.routeName}");
                    },
                    child: GestureDetector(
                      onTap: () {
                        SharedPrefrsSingelton.setbool(
                          key: kIsSeenOnBoarding,
                          value: true,
                        );
                        context.go("/${LoginView.routeName}");
                      },
                      child: const Text(
                        "تخط",
                        style: TextStyle(
                          color: Color(0xff949D9E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // الصورة في المنتصف تماماً
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: SvgPicture.asset(midleimage, height: 200),
              ),
            ],
          ),
        ),

        // 2. الـ Column الأخير الذي يحتوي على النصوص، النقاط، والزر
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // النصوص (العنوان والوصف)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    title,
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 37),
                      child: Text(
                        description,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: AppStyles.semiBold16.copyWith(
                          color: Color(0xff4E5556),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 30),
                  ],
                ),

                // النقاط والزر في أسفل الـ Column
                Column(
                  children: [
                    DotsIndicator(
                      dotsCount: 2,
                      // position: currentPage,
                      decorator: DotsDecorator(
                        color: currentpage == 0
                            ? AppColors.secondarycolor
                            : AppColors.primarycolor, // Inactive color
                        activeColor: AppColors.primarycolor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: currentpage == 1,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: CustomButton(
                          onPressed: () {
                            SharedPrefrsSingelton.setbool(
                              key: kIsSeenOnBoarding,
                              value: true,
                            );
                            context.go("/${LoginView.routeName}");
                          },
                          title: "ابدأ الآن",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
