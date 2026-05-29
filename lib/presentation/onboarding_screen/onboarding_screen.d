
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import './widgets/onboarding_particles_widget.dart';
import './widgets/onboarding_progress_widget.dart';
import './widgets/onboarding_step_four_widget.dart';
import './widgets/onboarding_step_one_widget.dart';
import './widgets/onboarding_step_three_widget.dart';
import './widgets/onboarding_step_two_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  String _selectedCefr = 'B1';
  final List<String> _selectedGoals = [];
  int _studyMinutes = 20;

  // TODO: Replace with Riverpod for production
  late AnimationController _bgController;
  late Animation<double> _bgAnimation;

  final List<String> _cefrLevels = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];
  final List<Map<String, dynamic>> _goals = [
    {'label': 'Conversation', 'icon': Icons.chat_bubble_outline_rounded},
    {'label': 'Business English', 'icon': Icons.business_center_outlined},
    {'label': 'Travel', 'icon': Icons.flight_outlined},
    {'label': 'Exam Prep', 'icon': Icons.school_outlined},
    {'label': 'Academic Writing', 'icon': Icons.edit_outlined},
    {'label': 'Pronunciation', 'icon': Icons.record_voice_over_outlined},
  ];

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
    _bgAnimation = CurvedAnimation(
      parent: _bgController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeOutCubic,
      );
    } else {
      context.go(AppRoutes.homeDashboardScreen);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Animated gradient background
          AnimatedBuilder(
            animation: _bgAnimation,
            builder: (_, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            Color.lerp(
                              const Color(0xFF0D0A1A),
                              const Color(0xFF1A0A2E),
                              _bgAnimation.value,
                            )!,
                            Color.lerp(
                              const Color(0xFF1A0A2E),
                              const Color(0xFF0D0A1A),
                              _bgAnimation.value,
                            )!,
                          ]
                        : [
                            Color.lerp(
                              const Color(0xFFF5F3FF),
                              const Color(0xFFEDE9FE),
                              _bgAnimation.value,
                            )!,
                            Color.lerp(
                              const Color(0xFFFAF5FF),
                              const Color(0xFFF0FDF4),
                              _bgAnimation.value,
                            )!,
                          ],
                  ),
                ),
              );
            },
          ),
          // Floating particles
          const OnboardingParticlesWidget(),
          // Content
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OnboardingProgressWidget(
                        currentStep: _currentStep,
                        totalSteps: 4,
                      ),
                      if (_currentStep < 3)
                        TextButton(
                          onPressed: () =>
                              context.go(AppRoutes.signUpLoginScreen),
                          child: Text(
                            'Skip',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Page content
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isTablet ? 520 : double.infinity,
                      ),
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (i) => setState(() => _currentStep = i),
                        children: [
                          OnboardingStepOneWidget(onNext: _nextStep),
                          OnboardingStepTwoWidget(
                            cefrLevels: _cefrLevels,
                            selectedCefr: _selectedCefr,
                            onCefrSelected: (v) =>
                                setState(() => _selectedCefr = v),
                            onNext: _nextStep,
                            onBack: _prevStep,
                          ),
                          OnboardingStepThreeWidget(
                            goals: _goals,
                            selectedGoals: _selectedGoals,
                            onGoalToggled: (g) {
                              setState(() {
                                if (_selectedGoals.contains(g)) {
                                  _selectedGoals.remove(g);
                                } else {
                                  _selectedGoals.add(g);
                                }
                              });
                            },
                            onNext: _nextStep,
                            onBack: _prevStep,
                          ),
                          OnboardingStepFourWidget(
                            studyMinutes: _studyMinutes,
                            onMinutesChanged: (v) =>
                                setState(() => _studyMinutes = v),
                            onComplete: _nextStep,
                            onBack: _prevStep,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
