import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final int _selectedModuleIndex = 0;

  final List<Map<String, dynamic>> _modules = [
    {
      'title': 'Vocabulary',
      'icon': Icons.abc_rounded,
      'color': const Color(0xFF7C3AED),
      'bgColor': const Color(0xFFEDE9FE),
      'progress': 0.72,
      'total': 500,
      'done': 360,
    },
    {
      'title': 'Grammar',
      'icon': Icons.edit_note_rounded,
      'color': const Color(0xFFEAB308),
      'bgColor': const Color(0xFFFEF9C3),
      'progress': 0.55,
      'total': 80,
      'done': 44,
    },
    {
      'title': 'Reading',
      'icon': Icons.menu_book_rounded,
      'color': const Color(0xFF06B6D4),
      'bgColor': const Color(0xFFCFFAFE),
      'progress': 0.40,
      'total': 60,
      'done': 24,
    },
    {
      'title': 'Listening',
      'icon': Icons.headphones_rounded,
      'color': const Color(0xFFEC4899),
      'bgColor': const Color(0xFFFCE7F3),
      'progress': 0.30,
      'total': 40,
      'done': 12,
    },
    {
      'title': 'Speaking',
      'icon': Icons.mic_rounded,
      'color': const Color(0xFF059669),
      'bgColor': const Color(0xFFD1FAE5),
      'progress': 0.20,
      'total': 30,
      'done': 6,
    },
    {
      'title': 'Writing',
      'icon': Icons.draw_rounded,
      'color': const Color(0xFFF97316),
      'bgColor': const Color(0xFFFFEDD5),
      'progress': 0.15,
      'total': 25,
      'done': 4,
    },
  ];

  final List<Map<String, dynamic>> _dailyLessons = [
    {
      'title': 'Business English Essentials',
      'subtitle': 'Professional vocabulary & phrases',
      'duration': '15 min',
      'xp': 50,
      'level': 'B1',
      'type': 'Vocabulary',
      'color': const Color(0xFF7C3AED),
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_18e9dc4dd-1772257639814.png',
      'imageLabel':
          'Business professionals in a meeting room discussing documents',
      'completed': false,
    },
    {
      'title': 'Conditional Sentences',
      'subtitle': 'If clauses — Types 1, 2 & 3',
      'duration': '20 min',
      'xp': 60,
      'level': 'B1',
      'type': 'Grammar',
      'color': const Color(0xFFEAB308),
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_14e06e3dd-1772190978929.png',
      'imageLabel': 'Student writing grammar notes in a notebook with pencil',
      'completed': true,
    },
    {
      'title': 'News Article: Climate Change',
      'subtitle': 'Advanced reading comprehension',
      'duration': '25 min',
      'xp': 70,
      'level': 'B2',
      'type': 'Reading',
      'color': const Color(0xFF06B6D4),
      'image':
          'https://images.unsplash.com/photo-1689421754396-a9d40abc07e5',
      'imageLabel': 'Person reading newspaper at a cafe with coffee cup',
      'completed': false,
    },
    {
      'title': 'TED Talk: Power of Habit',
      'subtitle': 'Listening & note-taking skills',
      'duration': '18 min',
      'xp': 55,
      'level': 'B1',
      'type': 'Listening',
      'color': const Color(0xFFEC4899),
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1ce6161a5-1779641246609.png',
      'imageLabel': 'Speaker presenting on stage with microphone at conference',
      'completed': false,
    },
    {
      'title': 'Describe Your Hometown',
      'subtitle': 'Fluency & descriptive language',
      'duration': '12 min',
      'xp': 45,
      'level': 'A2',
      'type': 'Speaking',
      'color': const Color(0xFF059669),
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1402f1a59-1770595238434.png',
      'imageLabel': 'Young woman speaking confidently in front of a group',
      'completed': false,
    },
  ];

  final List<Map<String, dynamic>> _flashcards = [
    {
      'word': 'Eloquent',
      'phonetic': '/ˈel.ə.kwənt/',
      'meaning': 'Fluent or persuasive in speaking or writing',
      'example': 'She gave an eloquent speech at the ceremony.',
      'hindi': 'वाक्पटु',
      'level': 'B2',
    },
    {
      'word': 'Resilient',
      'phonetic': '/rɪˈzɪl.i.ənt/',
      'meaning': 'Able to recover quickly from difficulties',
      'example': 'Children are remarkably resilient.',
      'hindi': 'लचीला',
      'level': 'B1',
    },
    {
      'word': 'Pragmatic',
      'phonetic': '/præɡˈmæt.ɪk/',
      'meaning': 'Dealing with things sensibly and realistically',
      'example': 'We need a pragmatic approach to this problem.',
      'hindi': 'व्यावहारिक',
      'level': 'B2',
    },
    {
      'word': 'Ephemeral',
      'phonetic': '/ɪˈfem.ər.əl/',
      'meaning': 'Lasting for a very short time',
      'example': 'Fame can be ephemeral.',
      'hindi': 'क्षणभंगुर',
      'level': 'C1',
    },
    {
      'word': 'Ubiquitous',
      'phonetic': '/juːˈbɪk.wɪ.təs/',
      'meaning': 'Present, appearing, or found everywhere',
      'example': 'Smartphones have become ubiquitous.',
      'hindi': 'सर्वव्यापी',
      'level': 'C1',
    },
  ];

  int _currentFlashcard = 0;
  bool _showFlashcardBack = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0D0A1A)
          : const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(isDark),
            _buildTabBar(isDark),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildModulesTab(isDark),
                  _buildLessonsTab(isDark),
                  _buildFlashcardsTab(isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Learning Hub',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: isDark
                        ? const Color(0xFFE8E0FF)
                        : const Color(0xFF1A1A2E),
                  ),
                ),
                Text(
                  'B1 Level • 14 day streak 🔥',
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    color: isDark
                        ? const Color(0xFF9D8EC4)
                        : const Color(0xFF6B5B8E),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFFA855F7)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bolt_rounded, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Text(
                  '2,840 XP',
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1025) : const Color(0xFFEDE9FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: const Color(0xFF7C3AED),
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: isDark
            ? const Color(0xFF9D8EC4)
            : const Color(0xFF6B5B8E),
        labelStyle: GoogleFonts.outfit(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.outfit(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'Modules'),
          Tab(text: 'Lessons'),
          Tab(text: 'Flashcards'),
        ],
      ),
    );
  }

  Widget _buildModulesTab(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Progress',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isDark ? const Color(0xFFE8E0FF) : const Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemCount: _modules.length,
            itemBuilder: (context, i) => _buildModuleCard(_modules[i], isDark),
          ),
          const SizedBox(height: 24),
          Text(
            'CEFR Roadmap',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isDark ? const Color(0xFFE8E0FF) : const Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 14),
          _buildCefrRoadmap(isDark),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildModuleCard(Map<String, dynamic> module, bool isDark) {
    final color = module['color'] as Color;
    final bgColor = module['bgColor'] as Color;
    final progress = module['progress'] as double;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1535) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0x33A855F7) : const Color(0x22A855F7),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(20),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDark ? color.withAlpha(51) : bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(module['icon'] as IconData, color: color, size: 20),
              ),
              const Spacer(),
              Text(
                '${(progress * 100).toInt()}%',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            module['title'] as String,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isDark ? const Color(0xFFE8E0FF) : const Color(0xFF1A1A2E),
            ),
          ),
          Text(
            '${module['done']}/${module['total']}',
            style: GoogleFonts.outfit(
              fontSize: 11,
              color: isDark ? const Color(0xFF9D8EC4) : const Color(0xFF6B5B8E),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: isDark
                  ? const Color(0xFF2D1B4E)
                  : const Color(0xFFEDE9FE),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCefrRoadmap(bool isDark) {
    final levels = [
      {'level': 'A1', 'name': 'Beginner', 'done': true, 'current': false},
      {'level': 'A2', 'name': 'Elementary', 'done': true, 'current': false},
      {'level': 'B1', 'name': 'Intermediate', 'done': false, 'current': true},
      {'level': 'B2', 'name': 'Upper-Int.', 'done': false, 'current': false},
      {'level': 'C1', 'name': 'Advanced', 'done': false, 'current': false},
      {'level': 'C2', 'name': 'Mastery', 'done': false, 'current': false},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1535) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0x33A855F7) : const Color(0x22A855F7),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: levels.map((l) {
          final done = l['done'] as bool;
          final current = l['current'] as bool;
          return Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done
                      ? const Color(0xFF7C3AED)
                      : current
                      ? const Color(0xFFEDE9FE)
                      : (isDark
                            ? const Color(0xFF2D1B4E)
                            : const Color(0xFFF5F3FF)),
                  border: current
                      ? Border.all(color: const Color(0xFF7C3AED), width: 2)
                      : null,
                  boxShadow: current
                      ? [
                          BoxShadow(
                            color: const Color(0xFF7C3AED).withAlpha(102),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: done
                      ? const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 18,
                        )
                      : Text(
                          l['level'] as String,
                          style: GoogleFonts.outfit(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: current
                                ? const Color(0xFF7C3AED)
                                : (isDark
                                      ? const Color(0xFF9D8EC4)
                                      : const Color(0xFF6B5B8E)),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l['name'] as String,
                style: GoogleFonts.outfit(
                  fontSize: 9,
                  fontWeight: current ? FontWeight.w700 : FontWeight.w400,
                  color: current
                      ? const Color(0xFF7C3AED)
                      : (isDark
                            ? const Color(0xFF9D8EC4)
                            : const Color(0xFF6B5B8E)),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLessonsTab(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Today\'s Lessons',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? const Color(0xFFE8E0FF)
                        : const Color(0xFF1A1A2E),
                  ),
                ),
              ),
              Text(
                '2/5 done',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: const Color(0xFF7C3AED),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ..._dailyLessons.map((lesson) => _buildLessonCard(lesson, isDark)),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildLessonCard(Map<String, dynamic> lesson, bool isDark) {
    final color = lesson['color'] as Color;
    final completed = lesson['completed'] as bool;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1535) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: completed
              ? const Color(0xFF059669).withAlpha(77)
              : (isDark ? const Color(0x33A855F7) : const Color(0x22A855F7)),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              lesson['image'] as String,
              width: 80,
              height: 90,
              fit: BoxFit.cover,
              semanticLabel: lesson['imageLabel'] as String,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 90,
                color: color.withAlpha(51),
                child: Icon(Icons.image_outlined, color: color),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withAlpha(38),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          lesson['type'] as String,
                          style: GoogleFonts.outfit(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF2D1B4E)
                              : const Color(0xFFEDE9FE),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          lesson['level'] as String,
                          style: GoogleFonts.outfit(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7C3AED),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    lesson['title'] as String,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? const Color(0xFFE8E0FF)
                          : const Color(0xFF1A1A2E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    lesson['subtitle'] as String,
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      color: isDark
                          ? const Color(0xFF9D8EC4)
                          : const Color(0xFF6B5B8E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 13,
                        color: isDark
                            ? const Color(0xFF9D8EC4)
                            : const Color(0xFF6B5B8E),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        lesson['duration'] as String,
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          color: isDark
                              ? const Color(0xFF9D8EC4)
                              : const Color(0xFF6B5B8E),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.bolt_rounded,
                        size: 13,
                        color: Color(0xFFEAB308),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '+${lesson['xp']} XP',
                        style: GoogleFonts.outfit(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFEAB308),
                        ),
                      ),
                      const Spacer(),
                      completed
                          ? const Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF059669),
                              size: 20,
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Start',
                                style: GoogleFonts.outfit(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
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
      ),
    );
  }

  Widget _buildFlashcardsTab(bool isDark) {
    final card = _flashcards[_currentFlashcard];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flashcards',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? const Color(0xFFE8E0FF)
                      : const Color(0xFF1A1A2E),
                ),
              ),
              Text(
                '${_currentFlashcard + 1} / ${_flashcards.length}',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: const Color(0xFF7C3AED),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () =>
                setState(() => _showFlashcardBack = !_showFlashcardBack),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _showFlashcardBack
                      ? [const Color(0xFF7C3AED), const Color(0xFF06B6D4)]
                      : [const Color(0xFF1E1535), const Color(0xFF2D1B4E)],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7C3AED).withAlpha(77),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: _showFlashcardBack
                  ? _buildCardBack(card)
                  : _buildCardFront(card),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tap card to reveal meaning',
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: isDark ? const Color(0xFF9D8EC4) : const Color(0xFF6B5B8E),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFlashcardButton(
                icon: Icons.close_rounded,
                color: const Color(0xFFDC2626),
                label: 'Hard',
                onTap: () => setState(() {
                  _showFlashcardBack = false;
                  _currentFlashcard =
                      (_currentFlashcard + 1) % _flashcards.length;
                }),
              ),
              const SizedBox(width: 20),
              _buildFlashcardButton(
                icon: Icons.check_rounded,
                color: const Color(0xFF059669),
                label: 'Easy',
                onTap: () => setState(() {
                  _showFlashcardBack = false;
                  _currentFlashcard =
                      (_currentFlashcard + 1) % _flashcards.length;
                }),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'All Flashcards',
            style: GoogleFonts.outfit(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: isDark ? const Color(0xFFE8E0FF) : const Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: _flashcards.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final fc = _flashcards[i];
                return GestureDetector(
                  onTap: () => setState(() {
                    _currentFlashcard = i;
                    _showFlashcardBack = false;
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: i == _currentFlashcard
                          ? const Color(0xFF7C3AED).withAlpha(26)
                          : (isDark ? const Color(0xFF1E1535) : Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: i == _currentFlashcard
                            ? const Color(0xFF7C3AED).withAlpha(102)
                            : (isDark
                                  ? const Color(0x33A855F7)
                                  : const Color(0x22A855F7)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fc['word'] as String,
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: isDark
                                      ? const Color(0xFFE8E0FF)
                                      : const Color(0xFF1A1A2E),
                                ),
                              ),
                              Text(
                                fc['meaning'] as String,
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  color: isDark
                                      ? const Color(0xFF9D8EC4)
                                      : const Color(0xFF6B5B8E),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7C3AED).withAlpha(26),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            fc['level'] as String,
                            style: GoogleFonts.outfit(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF7C3AED),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildCardFront(Map<String, dynamic> card) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            card['word'] as String,
            style: GoogleFonts.outfit(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            card['phonetic'] as String,
            style: GoogleFonts.outfit(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              card['level'] as String,
              style: GoogleFonts.outfit(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBack(Map<String, dynamic> card) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card['meaning'] as String,
            style: GoogleFonts.outfit(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '"${card['example']}"',
            style: GoogleFonts.outfit(
              fontSize: 13,
              color: Colors.white.withAlpha(204),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.translate_rounded,
                color: Colors.white70,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                card['hindi'] as String,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlashcardButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 56,
        decoration: BoxDecoration(
          color: color.withAlpha(26),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withAlpha(77)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
