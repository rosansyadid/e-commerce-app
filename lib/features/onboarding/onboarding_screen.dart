// Lokasi: lib/features/onboarding/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/screen/home_screen/home_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Asumsi path aset, sesuaikan jika perlu
class MainAssets {
  static const String onboarding1 = 'assets/images/onboarding1.png';
  static const String onboarding2 = 'assets/images/onboarding2.png';
  static const String onboarding3 = 'assets/images/onboarding3.png';
}

class OnboardingContent {
  final String image;
  final String title;
  final String description;
  final Color backgroundColor;
  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _onboardingData = [
    OnboardingContent(
      image: MainAssets.onboarding1,
      title: 'Maintain Your\nDaily Food!',
      description:
          '"Transform your lifestyle, one bite at a time. Welcome to HealthHub, where healthy habits meet achievable goals.',
      backgroundColor: const Color(0xFF55D883),
    ),
    OnboardingContent(
      image: MainAssets.onboarding2,
      title: 'Make Healthy\nLiving Simpler!',
      description:
          '"Discover the power of nutritious choices with our intuitive diet app. Start your wellness journey today!"',
      backgroundColor: const Color(0xFF55D883),
    ),
    OnboardingContent(
      image: MainAssets.onboarding3,
      title: 'Achieve Your\nHealth Goals',
      description:
          '“Reach your health goals The Track Calorie feature helps you make wiser food choices."',
      backgroundColor: const Color(0xFF55D883),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // =======================================================================
          // PERUBAHAN UTAMA DI SINI
          // =======================================================================
          Expanded(
            flex: 7, // <-- DIUBAH dari 6. Memberi 70% ruang untuk konten atas.
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _onboardingData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (_, index) {
                return _buildPageContent(_onboardingData[index]);
              },
            ),
          ),
          Expanded(
            flex:
                3, // <-- DIUBAH dari 4. Bagian bawah sekarang lebih ramping (30%).
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  // Kita buat Spacer lebih kecil agar tombol tidak terlalu ke bawah
                  // const Spacer(flex: 5),
                  const SizedBox(height: 160),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => _buildPageIndicator(index),
                    ),
                  ),
                  const Spacer(flex: 2),
                  // const SizedBox(height: 38,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3ED47A),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      shadowColor: const Color(0xFF3ED47A).withOpacity(0.5),
                    ),
                    onPressed: () async {
                      if (_currentPage < _onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('hasSeenOnboarding', true);
                        if (mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  // SizedBox(height: 36,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Kita tetap pakai versi yang sudah dikecilkan agar lebih aman
  Widget _buildPageContent(OnboardingContent content) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          // Proporsi ini sekarang relatif terhadap 70% tinggi layar, jadi lebih lega
          height: screenHeight * 0.48,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: content.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 100),
                    bottomRight: Radius.elliptical(200, 100),
                  ),
                ),
              ),
              Center(
                child: Image.asset(content.image, height: screenHeight * 0.28),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
          child: Column(
            children: [
              AutoSizeText(
                content.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                content.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator(int index) {
    bool isActive = _currentPage == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        height: 10,
        width: isActive ? 24 : 10,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF3ED47A) : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
