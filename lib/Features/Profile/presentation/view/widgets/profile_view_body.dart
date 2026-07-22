import 'package:flutter/material.dart';
import 'package:fruit_app/Features/Profile/presentation/view/widgets/logout_button.dart';
import 'package:fruit_app/Features/Profile/presentation/view/widgets/profile_header.dart';
import 'package:fruit_app/Features/Profile/presentation/view/widgets/profile_list_tile.dart';
import 'package:fruit_app/Features/Profile/presentation/view/widgets/section_header.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isNotificationsEnabled = false;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Sliver AppBar
                const SliverAppBar(
                  floating: true,
                  pinned: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    'حسابي',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                // Main Content List
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Profile Header
                      const ProfileHeader(
                        name: 'أحمد ياسر',
                        email: 'mail@mail.com',
                      ),
                      const SizedBox(height: 10),

                      // Section 1: العام
                      const SectionHeader(title: 'عام'),
                      ProfileListTile(
                        leadingIcon: Icons.person_outline,
                        title: 'الملف الشخصي',
                        onTap: () {},
                      ),
                      ProfileListTile(
                        leadingIcon: Icons.inventory_2_outlined,
                        title: 'طلباتي',
                        onTap: () {},
                      ),
                      ProfileListTile(
                        leadingIcon: Icons.account_balance_wallet_outlined,
                        title: 'المدفوعات',
                        onTap: () {},
                      ),
                      ProfileListTile(
                        leadingIcon: Icons.favorite_border,
                        title: 'المفضلة',
                        onTap: () {},
                      ),
                      ProfileListTile(
                        leadingIcon: Icons.notifications_none_outlined,
                        title: 'الإشعارات',
                        trailing: Switch(
                          value: isNotificationsEnabled,
                          activeThumbColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              isNotificationsEnabled = val;
                            });
                          },
                        ),
                      ),
                      ProfileListTile(
                        leadingIcon: Icons.language_outlined,
                        title: 'اللغة',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'العربية',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ProfileListTile(
                        leadingIcon: Icons.auto_awesome_outlined,
                        title: 'الوضع',
                        trailing: Switch(
                          value: isDarkMode,
                          activeThumbColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              isDarkMode = val;
                            });
                          },
                        ),
                      ),

                      // Section 2: المساعدة
                      const SectionHeader(title: 'المساعدة'),
                      ProfileListTile(
                        leadingIcon: Icons.info_outline,
                        title: 'من نحن',
                        onTap: () {},
                      ),
                      LogoutButton(
                        onTap: () {
                          // Logout Logic
                        },
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),

          // Fixed Logout Button at Bottom
        ],
      ),
    );
  }
}
