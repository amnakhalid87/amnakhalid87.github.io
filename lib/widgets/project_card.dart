import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String githubLink;
  final List<String> techStack;

  const ProjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.githubLink,
    required this.techStack,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: isMobile ? double.infinity : 400,
        constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 400),
        margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 10,
          vertical: isMobile ? 12 : 16,
        ),
        transform: Matrix4.translationValues(
          0,
          isHovered && !isMobile ? -8 : 0,
          0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A1A), Color(0xFF252525)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered && !isMobile
                ? Colors.amber.withOpacity(0.5)
                : Colors.white24,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered && !isMobile
                  ? Colors.amber.withOpacity(0.2)
                  : Colors.black.withOpacity(0.3),
              blurRadius: isHovered && !isMobile ? 20 : 10,
              offset: Offset(0, isHovered && !isMobile ? 12 : 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    widget.image,
                    width: double.infinity,
                    height: isMobile ? 180 : 250,
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                ),
                // GitHub Button
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () => _launchURL(widget.githubLink),
                    child: Container(
                      padding: EdgeInsets.all(isMobile ? 10 : 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.amber, Colors.amber.shade700],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.4),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: isMobile ? 16 : 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 17 : 20,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: isMobile ? 10 : 12),

                  // Description
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isMobile ? 13 : 14,
                      height: 1.6,
                    ),
                    maxLines: isMobile ? 6 : 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isMobile ? 12 : 16),

                  // Tech Stack Tags
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: widget.techStack.map((tech) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 8 : 10,
                          vertical: isMobile ? 4 : 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.amber.withOpacity(0.15),
                              Colors.amber.withOpacity(0.08),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.amber.withOpacity(0.4),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          '#$tech',
                          style: TextStyle(
                            color: Colors.amber.shade300,
                            fontSize: isMobile ? 9 : 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
