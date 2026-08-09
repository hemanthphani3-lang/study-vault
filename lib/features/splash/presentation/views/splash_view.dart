import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/animations/fade_slide_transition.dart';
import '../../../../core/animations/pulse_animation.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_durations.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../providers/splash_provider.dart';

/// Animated Splash entrance screen for StudyVault.
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    ref.listen<SplashStatus>(splashProvider, (SplashStatus? previous, SplashStatus next) {
      if (next == SplashStatus.ready) {
        context.goNamed(AppRoutes.homeName);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: <Widget>[
          // Cosmic Backdrop Glowing Orbs
          Positioned(
            top: -100,
            left: -60,
            child: Container(
              width: 340,
              height: 340,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: <Color>[
                    Color(0x338B7DFF),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -90,
            right: -70,
            child: Container(
              width: 320,
              height: 320,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: <Color>[
                    Color(0x2863F2E8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Central Animated Brand Emblem & Typography
          Center(
            child: FadeSlideTransition(
              duration: AppDurations.slow,
              offsetY: 28,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PulseAnimation(
                    child: Container(
                      width: 104,
                      height: 104,
                      decoration: const BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: AppRadius.rXxl,
                        boxShadow: AppShadows.primaryGlow,
                      ),
                      child: const Center(
                        child: Icon(
                          AppIcons.library,
                          color: AppColors.background,
                          size: 52,
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.gapH24,
                  Text(
                    AppConstants.appName,
                    style: AppTypography.displayMedium.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.8,
                    ),
                  ),
                  AppSpacing.gapH8,
                  Text(
                    AppConstants.appTagline,
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.secondary,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.gapH32,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: AppRadius.rFull,
                      border: Border.fromBorderSide(
                        BorderSide(color: AppColors.glassBorderSubtle),
                      ),
                    ),
                    child: Text(
                      'v${AppConstants.appVersion}',
                      style: AppTypography.labelSmall.copyWith(
                        fontFamily: 'Inter',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.hint,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Node Initialization Status
          Positioned(
            bottom: AppSpacing.massive,
            left: 0,
            right: 0,
            child: Center(
              child: FadeSlideTransition(
                delay: const Duration(milliseconds: 600),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.successGlow,
                      ),
                    ),
                    AppSpacing.gapW8,
                    Text(
                      'Initializing decentralized node...',
                      style: AppTypography.caption.copyWith(color: AppColors.hint),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
