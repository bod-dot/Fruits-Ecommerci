import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/feautres/on_bording/perseontation/widgets/on_bording_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = '/onBording';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBordingViewBody()),
    );
  }
}
