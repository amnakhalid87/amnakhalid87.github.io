import 'package:flutter/material.dart';
import 'package:portfolio_web/backgroung%20animation/particle_animation.dart';
import 'package:portfolio_web/components/about_section.dart';
import 'package:portfolio_web/components/contact_section.dart';
import 'package:portfolio_web/components/experience_section.dart';
import 'package:portfolio_web/components/projects_section.dart';
import 'package:portfolio_web/components/techstack_Section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    final ScrollController _scrollController = ScrollController();

    final GlobalKey aboutKey = GlobalKey();
    final GlobalKey experienceKey = GlobalKey();
    final GlobalKey projectsKey = GlobalKey();
    final GlobalKey contactKey = GlobalKey();
    void scrollTo(GlobalKey key) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 14, top: 14),
          child: Row(
            children: [
              Container(
                height: isMobile ? 25 : 30,
                width: isMobile ? 25 : 30,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(isMobile ? 25 : 30),
                ),
                child: Center(
                  child: Text('A', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: isMobile ? 8 : 12),
              Text(
                'Amna ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 16 : 20,
                ),
              ),
              Text(
                '| Code with Amna ',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 16 : 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          isMobile
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(right: 14, top: 14),
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white38, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => scrollTo(aboutKey),
                          child: Text(
                            'About',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        TextButton(
                          onPressed: () => scrollTo(experienceKey),
                          child: Text(
                            'Experience',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        TextButton(
                          onPressed: () => scrollTo(projectsKey),
                          child: Text(
                            'Projects',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),

                        TextButton(
                          onPressed: () => scrollTo(contactKey),
                          child: Text(
                            'Contact',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
        ],
      ),
      body: Stack(
        children: [
          const ParticleBackground(),
          SingleChildScrollView(
            controller: _scrollController,

            child: Column(
              children: [
                SizedBox(height: isMobile ? 80 : 120),
                Container(key: aboutKey, child: AboutSection()),
                SizedBox(height: isMobile ? 70 : 100),

                Container(key: experienceKey, child: ExperienceSection()),

                Center(
                  child: Text(
                    'My Tech Stack',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 25 : 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 30 : 40),

                TechstackSection(),
                SizedBox(height: isMobile ? 30 : 40),

                Container(key: projectsKey, child: ProjectsSection()),
                SizedBox(height: isMobile ? 40 : 80),

                Container(key: contactKey, child: ContactSection()),
                SizedBox(height: isMobile ? 30 : 40),
                Container(
                  height: isMobile ? 60 : 100,
                  width: screenWidth,
                  decoration: BoxDecoration(color: Colors.white24),
                  child: Center(
                    child: Text(
                      'CopyRight 2026 ©Code with Amna',
                      style: TextStyle(color: Colors.amber.shade600),
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
