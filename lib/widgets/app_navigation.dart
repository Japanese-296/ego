import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// V3 Liquid Glass bottom navigation — LOCKED: BackdropFilter blur + animated pill

class _TabSpec {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int? branchIndex;
  const _TabSpec({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.branchIndex,
  });
}

class AppNavigation extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const AppNavigation({required this.navigationShell, super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _pillController;

  final List<_TabSpec> _tabs = const [
    _TabSpec(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: 'Home',
      branchIndex: 0,
    ),
    _TabSpec(
      icon: Icons.menu_book_outlined,
      selectedIcon: Icons.menu_book_rounded,
      label: 'Learn',
      branchIndex: 1,
    ),
    _TabSpec(
      icon: Icons.auto_awesome_outlined,
      selectedIcon: Icons.auto_awesome_rounded,
      label: 'AI',
      branchIndex: 2,
    ),
    _TabSpec(
      icon: Icons.bar_chart_outlined,
      selectedIcon: Icons.bar_chart_rounded,
      label: 'Analytics',
      branchIndex: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pillController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _pillController.dispose();
    super.dispose();
  }

  void _onTabTap(int visualIndex) {
    final tab = _tabs[visualIndex];
    if (tab.branchIndex == null) return;
    _pillController.forward(from: 0);
    widget.navigationShell.goBranch(
      tab.branchIndex!,
      initialLocation: tab.branchIndex == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomPad = MediaQuery.of(context).padding.bottom;
    final currentIndex = widget.navigationShell.currentIndex;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPad + 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          // LOCKED: BackdropFilter blur — core technique of V3 Liquid Glass
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xCC1A1025) : const Color(0xEEFFFFFF),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: isDark
                    ? const Color(0x4DA855F7)
                    : const Color(0x33A855F7),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xFF7C3AED,
                  ).withOpacity(isDark ? 0.3 : 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_tabs.length, (i) {
                final tab = _tabs[i];
                final isSelected = i == currentIndex;
                return GestureDetector(
                  onTap: () => _onTabTap(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF7C3AED).withAlpha(38)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            isSelected ? tab.selectedIcon : tab.icon,
                            key: ValueKey(isSelected),
                            size: 22,
                            color: isSelected
                                ? const Color(0xFF7C3AED)
                                : (isDark
                                      ? const Color(0xFF9D8EC4)
                                      : const Color(0xFF6B5B8E)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: isSelected ? 4 : 0,
                          width: isSelected ? 4 : 0,
                          margin: EdgeInsets.only(top: isSelected ? 2 : 0),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7C3AED),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
