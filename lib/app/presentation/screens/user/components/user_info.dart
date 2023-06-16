import 'package:flutter/material.dart';

import '../../../theme/app_text_styles.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String website;
  final String companyName;
  final String companyBs;
  final String companyCatchPhrase;
  final String city;
  final String street;

  const UserInfoWidget({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.companyName,
    required this.companyBs,
    required this.companyCatchPhrase,
    required this.city,
    required this.street,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name: $name',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'Email: $email',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'Phone: $phone',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'Website: $website',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'Working Company',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 7),
        Text(
          'Name: $companyName',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 7),
        Text(
          'BS: $companyBs',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 7),
        Text(
          "Catch phase: '$companyCatchPhrase'",
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'Address',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 7),
        Text(
          'City: $city',
          style: AppTextStyles.bodyTextStyle,
        ),
        const SizedBox(height: 7),
        Text(
          'Street: $street',
          style: AppTextStyles.bodyTextStyle,
        ),
      ],
    );
  }
}
