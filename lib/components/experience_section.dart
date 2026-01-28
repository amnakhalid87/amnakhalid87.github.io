import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Column(
      children: [
        Center(
          child: Text(
            'Experience',
            style: TextStyle(
              color: Colors.white,
              fontSize: mobile ? 25 : 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: mobile ? 40 : 50),
        _item(
          context,
          right: true,
          mobile: mobile,
          title: "Junior Flutter Developer — Freelance",
          duration: "Oct 2025 – Dec 2025",
          description:
              "Played a key role in developing a video streaming application with real-time voice chat room features . "
              "Led API integration efforts including testing, model creation, and seamless backend connectivity. "
              "Ensured responsive UI/UX across multiple screen sizes and collaborated with senior developers using Git for efficient version control.",
        ),
        _item(
          context,
          right: false,
          mobile: mobile,
          title: "Flutter Developer Intern — SkillifyZone",
          duration: "Jul 2025 – Aug 2025",
          description:
              "Developed Android applications with emphasis on modern UI design patterns and RESTful API integration. "
              "Actively participated in debugging sessions, feature enhancements, and performance optimization. "
              "Applied industry-standard coding practices to deliver maintainable and scalable solutions.",
        ),
        _item(
          context,
          right: true,
          mobile: mobile,
          title: "Android Developer Intern — DEN",
          duration: "Jul 2025 – Sep 2025",
          description:
              "Completed a comprehensive virtual internship focusing on practical Android development. "
              "Built multiple projects including Firebase Authentication systems, Quiz Apps, Quotes Apps, and implemented Google AdMob for monetization. "
              "Designed responsive UI components and resolved critical bugs to enhance overall app stability and user experience.",
        ),
        _item(
          context,
          right: false,
          mobile: mobile,
          title: "Online Programming Instructor — Ehana Tuitions",
          duration: "Jul 2025 – Sep 2025",
          description:
              "Delivered comprehensive online instruction in Python and Flutter development to diverse student groups. "
              "Provided personalized mentorship in core programming concepts including OOP and algorithm design. "
              "Designed hands-on exercises and real-world projects that helped students build strong foundational skills in both Python and Flutter frameworks. Also teach Assembly language basics",
        ),
        SizedBox(height: mobile ? 40 : 50),
      ],
    );
  }

  Widget _item(
    BuildContext context, {
    required bool right,
    required bool mobile,
    required String title,
    required String duration,
    required String description,
  }) {
    // Mobile pe single card centered layout
    if (mobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: _card(mobile, title, duration, description),
      );
    }

    // Desktop pe zigzag layout
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: !right
                ? _card(mobile, title, duration, description)
                : const SizedBox(),
          ),
          Expanded(
            child: right
                ? _card(mobile, title, duration, description)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _card(bool mobile, String title, String duration, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mobile ? 0 : 12),
      padding: EdgeInsets.all(mobile ? 16 : 22),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.orange,
              fontSize: mobile ? 15 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            duration,
            style: TextStyle(color: Colors.grey, fontSize: mobile ? 12 : 14),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.white70,
              fontSize: mobile ? 13 : 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
