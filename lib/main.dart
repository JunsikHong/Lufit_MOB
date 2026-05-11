// main.dart
import 'package:flutter/material.dart';
import 'package:lufit_mob/layouts/main_layout.dart';
// 1. 홈 스크린을 가져옵니다.
import 'features/home/screens/home_screen.dart';

void main() {
  runApp(const Lufit());
}

class Lufit extends StatelessWidget {
  const Lufit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lufit',
      debugShowCheckedModeBanner: false, // 오른쪽 상단 'Debug' 띠 숨기기
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF9F9FA),
        useMaterial3: true, // 최신 안드로이드 스타일 적용
      ),
      // 2. 앱이 켜질 때 처음 보여줄 위젯(페이지)을 설정합니다.
      home: const MainLayout(),
    );
  }
}