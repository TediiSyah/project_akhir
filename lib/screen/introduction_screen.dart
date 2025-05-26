import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();
  int _page = 0;
  double _btnScale = 1.0;

  final List<_IntroData> _pages = [
    _IntroData(
      title: "Welcome to Scan Segar",
      description:
          "Scan tingkat kesegaran ikan & sayuran dengan mudah dan cepat.",
      icon: Icons.set_meal,
    ),
    _IntroData(
      title: "Check Freshness Easily",
      description: "Cek kesegaran ikan dan sayuran hanya dengan satu klik.",
      icon: Icons.local_florist,
    ),
    _IntroData(
      title: "Your Health, Our Priority",
      description: "Pantau makanan sehatmu setiap hari dengan Scan Segar.",
      icon: Icons.restaurant,
    ),
  ];

  void _onNext() {
    if (_page < 2) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0288D1), Color(0xFFFAFAFA)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // Decorative icons
              Positioned(
                left: 30,
                top: 80,
                child: Icon(Icons.set_meal,
                    size: 30, color: const Color(0xFF26A69A).withOpacity(0.5)),
              ),

              PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final data = _pages[i];
                  return AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 1000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            data.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Flexible(
                            child: Icon(
                              data.icon,
                              size: 80,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            data.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTapDown: (_) => setState(() => _btnScale = 1.1),
                            onTapUp: (_) {
                              setState(() => _btnScale = 1.0);
                              _onNext();
                            },
                            onTapCancel: () => setState(() => _btnScale = 1.0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              transform: Matrix4.identity()..scale(_btnScale),
                              height: 50,
                              width: width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF0288D1),
                                    Color(0xFF26A69A)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.10),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Dot indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_pages.length, (idx) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: _page == idx ? 18 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _page == idx
                                      ? const Color(0xFF26A69A)
                                      : Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroData {
  final String title;
  final String description;
  final IconData icon;
  const _IntroData({
    required this.title,
    required this.description,
    required this.icon,
  });
}
