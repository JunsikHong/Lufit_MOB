import 'package:flutter/material.dart';
import 'dart:async';

class UserProfileSection extends StatefulWidget {
  const UserProfileSection({super.key});

  @override
  State<UserProfileSection> createState() => _UserProfileSectionState();
}

class _UserProfileSectionState extends State<UserProfileSection> {
  // 1. 메시지 슬라이더를 제어하기 위한 컨트롤러
  final PageController _pageController = PageController();
  final List<String> _messages = [
    '오늘도 건강 챙기고 계신가요?',
    '물 한 잔 마셔보세요 💧',
    '가볍게 스트레칭 해보세요',
    '수면은 충분하셨나요?',
  ];

  int _score = 78;
  String _grade = 'GOLD';

  @override
  void initState() {
    super.initState();
    // 2. React의 Autoplay 기능을 타이머로 구현
    Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // React의 rounded-2xl, border-gray-200, p-5 적용
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 프로필 영역 (Avatar + Name/Messages)
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text('👤', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('홍준식 님',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    // 수직 슬라이딩 메시지 (React의 Swiper 역할)
                    SizedBox(
                      height: 20,
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(), // 터치 이동 방지
                        itemBuilder: (context, index) {
                          return Text(
                            _messages[index % _messages.length],
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 점수 및 프로그레스 바 영역
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_grade, style: const TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('$_score점', style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 8),
              // 커스텀 프로그레스 바
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _score / 100,
                  minHeight: 8,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 하단 버튼 영역 (border-t 및 여백)
          Container(
            padding: const EdgeInsets.only(top:12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: const Text('크레딧 120',
                    style: TextStyle(color: Colors.grey, fontSize: 14))),
                TextButton(onPressed: () {}, child: const Text('쿠폰 / 패스',
                    style: TextStyle(color: Colors.grey, fontSize: 14))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}