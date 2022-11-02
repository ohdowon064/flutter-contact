# contact

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 플러터의 기본 위젯
- 위젯 짜집기
- 모든 것이 위젯
- 기본 위젯
  - 글자위젯: Text("텍스트")
  - 아이콘위젯: Icon(Icons.아이콘이름)
  - 이미지위젯: Image.asset("경로")
    - 이미지는 pubspec.yaml에 등록 필요
  - 박스위젯: Container(), SizedBox()
- flutter에서 단위는 lp
  - 50lp == 1.2cm
- Center(): 자식 위젯의 기준점을 중앙으로 설정

## 플러터 커스터마이징
- MaterialApp(): 구글 스타일
- CupertinoApp(): 애플 스타일
- 커스터마이징 -> MeterialApp을 쓰자.
  - 훨씬 간단하다.
- 상중하로 나눠주는 Scaffold 위젯
  - 상: appBar
  - 중: body
  - 하: bottomNavigationBar
- Row(children: []): 위젯 가로로 배치
- Column(children: []): 위젯 세로로 배치
  - mainAxisAlignment: MainAxisAlignment.정렬방식 -> 메인축 정렬(Row -> 가로, Column -> 세로)
  - crossAxisAlignment: CrossAxisAlignment.정렬방식 -> 메인의 반대축 정렬(Row -> 세로, Column -> 가로)
- margin, hegith 등 설정이 안되면 Container()로 감싸서 설정
  - Container()는 좀 무겁다. 
  - width, hegith만 필요하면 가벼운 SizedBox()로 사용 가능