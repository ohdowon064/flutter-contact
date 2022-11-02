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

## 박스 잘그리기
- Container()
  - margin, padding, color, width, hegith, decoration 등 설정 가능
  - decoration: BoxDecoration(
      color: Colors.색상, -> Container의 color 옵션과 동시에 사용할 수 없음
      border: Border.all(color: Colors.색상, width: 1),
      borderRadius: BorderRadius.circular(10),
    )
  - EdgeInsets.all(10): 모든 방향에 10lp
  - EdgeInsets.only(left: 10, right: 10): 왼쪽, 오른쪽에 10lp
  - EdgeInsets.fromLTRB(10, 20, 30, 40): 왼쪽 10lp, 위쪽 20lp, 오른쪽 30lp, 아래쪽 40lp
  - 중앙정렬: Center(), 다른 정렬: Align으로 감싸면 정렬가능
  - 꽉차게: width: double.infinity, height: double.infinity
- 위젯을 감싸야할 때는 오른쪽에 전구를 사용하자!!

## 타이포그래피(글자디자인)
- Text()
  - style: TextStyle(
      color: Colors.색상, 또는 Color(0xFF000000) 또는 Colors.fromRGBO(0, 0, 0, 1)
      fontSize: 20,
      fontWeight: FontWeight.두께,
      fontStyle: FontStyle.기울임
    )

- 아이콘 스타일 -> color, size

## 버튼 위젯
- TextButton(), IconButton(), ElevatedButton() 중 택1

## 레이아웃 잘 만들기

