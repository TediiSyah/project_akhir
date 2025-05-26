import 'package:flutter/material.dart';
import 'package:project_akhir/screen/history_detail_screen.dart';
import 'package:project_akhir/screen/profile_user_screen.dart';
import 'package:project_akhir/screen/scan_screen';
import 'package:project_akhir/screen/splash_screen.dart'; // Tambahkan impor untuk SplashScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> scanHistory = [
    {
      'id': 1,
      'item_type': 'ikan',
      'result': 'Segar',
      'confidence': 0.95,
      'created_at': '2025-05-24',
    },
    {
      'id': 2,
      'item_type': 'sayuran',
      'result': 'Cukup Segar',
      'confidence': 0.85,
      'created_at': '2025-05-24',
    },
    {
      'id': 3,
      'item_type': 'ikan',
      'result': 'Tidak Segar',
      'confidence': 0.75,
      'created_at': '2025-05-24',
    },
  ];

  double _fabScale = 1.0;
  bool _refreshing = false;

  Future<void> _refresh() async {
    setState(() => _refreshing = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _refreshing = false);
  }

  void _goToProfile() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => const ProfileUserScreen(),
      transitionsBuilder: (_, anim, __, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 400),
    ));
  }

  void _goToHistoryDetail(Map<String, dynamic> data) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => HistoryScanScreen(data: data),
      transitionsBuilder: (_, anim, __, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 400),
    ));
  }

  void _goToScanScreen() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => const ScanScreen(),
      transitionsBuilder: (_, anim, __, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 400),
    ));
  }

  void _logout() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (_, __, ___) => const SplashScreen(),
      transitionsBuilder: (_, anim, __, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0288D1), Color(0xFFFAFAFA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    "Riwayat Scan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.black),
                  onPressed: _goToProfile,
                  tooltip: "Profil",
                ),
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.black),
                  onPressed: _logout, // Navigasi ke SplashScreen saat logout
                  tooltip: "Logout",
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: const Color(0xFF26A69A),
          onRefresh: _refresh,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: scanHistory.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history,
                            size: 60, color: const Color(0xFF26A69A)),
                        const SizedBox(height: 16),
                        const Text(
                          "Belum ada riwayat scan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF424242),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: scanHistory.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final item = scanHistory[i];
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 400 + i * 100),
                        builder: (context, value, child) => AnimatedSlide(
                          offset: Offset(0, 0.2 * (1 - value)),
                          duration: const Duration(milliseconds: 400),
                          child: child!,
                        ),
                        child: GestureDetector(
                          onTap: () => _goToHistoryDetail(item),
                          child: Card(
                            elevation: 6,
                            shadowColor: Colors.black.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    item['item_type'] == 'ikan'
                                        ? Icons.set_meal
                                        : Icons.local_florist,
                                    color: const Color(0xFF26A69A),
                                    size: 40,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${item['item_type'] == 'ikan' ? 'Ikan' : 'Sayuran'}: ${item['result']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF424242),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Confidence: ${(item['confidence'] * 100).toStringAsFixed(0)}%",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF424242),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _formatDate(item['created_at']),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF424242),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTapDown: (_) => setState(() => _fabScale = 1.1),
        onTapUp: (_) => setState(() => _fabScale = 1.0),
        onTapCancel: () => setState(() => _fabScale = 1.0),
        onTap: _goToScanScreen, // Navigasi ke ScanScreen saat FAB diklik
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: 64,
          height: 64,
          transform: Matrix4.identity()..scale(_fabScale),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0288D1), Color(0xFFFAFAFA)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.camera_alt, color: Colors.white, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  String _formatDate(String date) {
    try {
      final dt = DateTime.parse(date);
      const bulan = [
        '',
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ];
      return '${dt.day} ${bulan[dt.month]} ${dt.year}';
    } catch (_) {
      return date;
    }
  }
}
