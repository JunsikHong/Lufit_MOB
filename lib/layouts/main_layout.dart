import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart'; // [cite: 171]
import '../../features/home/screens/home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // 현재 선택된 인덱스 (나중에 메뉴 등을 통해 변경 가능)
  final int _currentIndex = 0;

  // 각 페이지 리스트 - const를 붙여 최적화합니다. [cite: 107, 155]
  final List<Widget> _pages = const [
    HomeScreen(),
    Center(child: Text('건강 기록 페이지')),
    Center(child: Text('루틴 관리 페이지')),
    Center(child: Text('포인트 상점 페이지')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색 설정 (React의 bg-gray-50 느낌) [cite: 143]
      backgroundColor: const Color(0xFFF8F9FA),

      // 1. 상단 앱바 구현 (DefaultHeader 대응) [cite: 167, 172]
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // 그림자 제거 [cite: 172]
        centerTitle: false, // 제목 왼쪽 정렬 [cite: 173]
        title: const Text(
          'LUFIT',
          style: TextStyle(
            color: Color(0xFF22C55E), // green-500 [cite: 164]
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -1, // tracking-tight [cite: 164]
          ),
        ),
        actions: [
          // 오른쪽 알림 및 메뉴 버튼 [cite: 173]
          IconButton(
            icon: const Icon(LucideIcons.bell, color: Colors.black87),
            onPressed: () => print('알림 클릭'),
          ),
          IconButton(
            icon: const Icon(LucideIcons.menu, color: Colors.black87),
            onPressed: () => print('메뉴 클릭'),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. 본문 영역 [cite: 169]
      // SingleChildScrollView로 여기서 감싸지 말고, IndexedStack만 둡니다. [cite: 220, 224]
      // 실제 스크롤은 HomeScreen 내부에서 처리해야 에러가 나지 않습니다. [cite: 227]
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}