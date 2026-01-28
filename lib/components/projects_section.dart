import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Column(
      children: [
        Center(
          child: Text(
            'Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 25 : 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 30 : 40),
        Wrap(
          children: [
            ProjectCard(
              image: 'assets/banner.png',
              title: 'Crime Analytics-ML based Crime Rate Prediction App',
              description:
                  "Developed a Flutter application for route safety prediction powered by a self-trained Random Forest ML model. "
                  "Integrated OpenStreetMap, Firebase Authentication for secure user management.",

              githubLink: 'https://github.com/amnakhalid87/crime-analytics-fyp',
              techStack: [
                'firebase-auth',
                'http',
                'Open-Street-Map',
                'pandas',
                'sciket-learn',
                'flask',
              ],
            ),
            ProjectCard(
              image: 'assets/banner3.png',
              title: 'ChatHub- A Real-Time Chat Application',
              description:
                  "Engineered chat app featuring user authentication, Gmail authentication, and real-time messaging."
                  "Implemented user search,text andimages messages based chat with persistent chat history, and a complete user onboarding flow.  ",
              githubLink: 'https://github.com/amnakhalid87/chat-app',
              techStack: [
                'flutter',
                'supabase',
                'dart',
                'Gmail-authentication',
                'supabase-storage',
                'real-time updates',
              ],
            ),
            ProjectCard(
              title: "News Application",
              image: 'assets/banner2.png',
              description:
                  "Developed a feature-rich news application using Flutter and News API integration. "
                  "Implemented an intuitive onboarding experience, hottest news feed, trending news section, and category-based news browsing. "
                  "Integrated WebView for seamless in-app article reading and utilized HTTP package for efficient API communication and real-time news data fetching.",

              techStack: ["flutter", "dart", "news-api.org", "HTTP", "WebView"],

              githubLink: 'https://github.com/amnakhalid87/news-app',
            ),
          ],
        ),
      ],
    );
  }
}
