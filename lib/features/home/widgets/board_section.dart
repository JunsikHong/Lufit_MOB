import 'package:flutter/material.dart';

class BoardSection extends StatelessWidget {
  const BoardSection({super.key});

  // 데이터 샘플 (React의 boards, notices 배열 대체)
  final List<Map<String, String>> boards = const [
    {'title': '오늘 운동 뭐하셨나요?', 'date': '04.22'},
    {'title': '식단 공유해요', 'date': '04.21'},
    {'title': '헬스장 추천 부탁', 'date': '04.20'},
    {'title': '다이어트 시작!', 'date': '04.19'},
    {'title': '단백질 보충제 질문', 'date': '04.18'},
  ];

  final List<Map<String, String>> notices = const [
    {'title': '서비스 점검 안내', 'date': '04.22'},
    {'title': '신규 기능 업데이트', 'date': '04.20'},
    {'title': '이벤트 안내', 'date': '04.18'},
    {'title': '약관 변경 안내', 'date': '04.15'},
    {'title': '공지 테스트', 'date': '04.10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. 게시판 (커뮤니티) 섹션
        _buildBoardCard('커뮤니티', boards),
        const SizedBox(height: 12), // gap-3 효과
        // 2. 공지사항 섹션
        _buildBoardCard('공지사항', notices),
      ],
    );
  }

  // 게시판 형태의 카드 위젯을 만드는 헬퍼 함수 (중복 제거)
  Widget _buildBoardCard(String title, List<Map<String, String>> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          // 헤더 영역 (제목 + 더보기 버튼)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // justify-between [cite: 74, 79]
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // React의 navigate('/community') 역할
                  print('$title 더보기 클릭');
                },
                child: const Text(
                  '더보기',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 리스트 영역 (React의 .map 역할)
          Column(
            children: items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['title']!,
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis, // truncate 효과
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item['date']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}