// features/home/screens/home_screen.dart
import 'package:flutter/material.dart';
// 1. 작성한 유저 프로필 섹션 위젯을 가져옵니다.
import '../widgets/user_profile_section.dart';
import '../widgets/banner_section.dart';
import '../widgets/board_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색을 약간 회색으로 주면 하얀색 카드가 더 돋보입니다 (React의 bg-gray-50 느낌)
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          // 전체적으로 화면 끝에서 16만큼 띄워줍니다.
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // 2. 불러온 위젯을 배치합니다.
              UserProfileSection(),
              SizedBox(height: 20,),
              BannerSection(),
              SizedBox(height: 20,),
              BoardSection(),
            ],
          ),
        ),
      ),
    );
  }
}