import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:test2_app/core/widget/custom_cached_network_image.dart';
import 'package:test2_app/features/home/data/models/profile_model.dart';
import 'package:test2_app/features/home/presentation/views/widgets/show_edit_bottom_sheet.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({required this.profile, super.key});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    final duration = 600.ms;
    final delay = 200.ms;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            CustomProfileImage(profile: profile)
                .animate(delay: delay)
                .fadeIn(duration: duration, curve: Curves.easeInOut)
                .slideY(begin: 0.3, end: 0, curve: Curves.easeOutBack),
            const SizedBox(height: 20),
            Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showEditProfileField(
                          context: context,
                          fieldName: 'name',
                          initialValue: profile.name ?? '',
                          onSave: (name) {},
                        );
                      },
                      child: Text(
                        profile.name ?? 'No Name',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      profile.email ?? 'No Email',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                )
                .animate(delay: delay)
                .fadeIn(duration: duration, curve: Curves.easeInOut)
                .slideY(begin: 0.3, end: 0, curve: Curves.easeOutBack),
            const SizedBox(height: 30),
            CustomProfileInfoCard(profile: profile)
                .animate(delay: delay)
                .fadeIn(duration: duration, curve: Curves.easeInOut)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOutBack),
          ],
        ),
      ),
    );
  }
}

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({required this.profile, super.key});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blueAccent, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: CustomCachedNetworkImage(
          image: profile.profileImage ?? '',
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class CustomProfileInfoCard extends StatelessWidget {
  const CustomProfileInfoCard({required this.profile, super.key});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.white,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          children: [
            buildInfoRow(
              Icons.badge,
              'National ID',
              profile.nationalId ?? 'N/A',
            ),
            const Divider(height: 25),
            buildInfoRow(
              Icons.phone,
              'Phone',
              profile.phone ?? 'No phone number',
            ),
            const Divider(height: 25),
            buildInfoRow(
              Icons.male,
              'Gender',
              profile.gender?.toUpperCase() ?? 'Not specified',
            ),
            const Divider(height: 25),
            buildInfoRow(
              Icons.lock,
              'Token',
              profile.token?.substring(0, 15) ?? 'N/A',
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildInfoRow(IconData icon, String title, String value) {
  return Row(
    children: [
      Icon(icon, color: Colors.blueAccent),
      const SizedBox(width: 12),
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          value,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    ],
  );
}
