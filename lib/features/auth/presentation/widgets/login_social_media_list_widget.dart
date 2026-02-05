import 'package:flouka/features/auth/presentation/widgets/social_media_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class LoginSocialMediaListWidget extends StatelessWidget {
  const LoginSocialMediaListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of(context);
    return Column(
      children: List.generate(
        authProvider.authImages.length,
        (index) => SocialMediaIconButton(socialAuthEntity: authProvider.authImages[index]),
      ),
    );
  }
}
