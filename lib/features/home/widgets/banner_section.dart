import 'package:flutter/material.dart';
import 'dart:async';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  // 1. 배너 슬라이드를 제어하기 위한 컨트롤러 (viewportFraction으로 1.2 효과 구현)
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, String>> _banners = [
    {'title': '오늘의 건강 팁', 'desc': '물 2L 마시기 챙기셨나요?', 'emoji': '💧'},
    {'title': '수면 체크', 'desc': '어제 7시간 이상 주무셨나요?', 'emoji': '😴'},
    {'title': '운동 추천', 'desc': '가볍게 10분 스트레칭 해보세요', 'emoji': '🧘‍♂️'},
    {'title': '영양 보충', 'desc': '오늘은 채소 많이 드셨나요?', 'emoji': '🥗'},
    {'title': '스트레스 관리', 'desc': '심호흡 한 번 해보세요', 'emoji': '🫁'},
    {'title': '걸음 수 체크', 'desc': '오늘 5,000보 걸으셨나요?', 'emoji': '👟'},
  ];

  @override
  void initState() {
    super.initState();
    // 2. React Swiper의 Autoplay 기능 구현 (3초마다 전환) [cite: 179]
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // 배너의 고정 높이 설정 [cite: 180]
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          // 무한 루프를 위해 인덱스 계산
          final banner = _banners[index % _banners.length];

          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              return Center(
                child: FractionallySizedBox(
                  widthFactor: 0.95, // 카드 사이의 간격(spaceBetween) 효과
                  child: child,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // 3. React의 bg-gradient-to-r 효과 구현
                gradient: const LinearGradient(
                  colors: [Color(0xFFDCFCE7), Color(0xFFBBF7D0)], // green-100 to green-200
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16), // rounded-2xl
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // items-center justify-between [cite: 185]
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner['title']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4), // mt-1
                        Text(
                          banner['desc']!,
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    banner['emoji']!,
                    style: const TextStyle(fontSize: 32), // text-3xl
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}