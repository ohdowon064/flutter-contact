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
- 위젯을 감싸야할 때는 좌측에 나타나는 IDE 전구를 사용하자!!

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
- onPressed: () { 로직 } -> 버튼 클릭시 실행할 함수

## 앱바 디자인
- title
- leading: IconButton(icon: Icon(Icons.아이콘이름), onPressed: () { 로직 })
    - 좌측상단 메뉴만들 때 자주쓴다.
- actions: []: 우측에 들어갈 아이콘들

## 레이아웃 잘 만들기
아래 순서를 따라가기
1. 예시 디자인(화면) 준비
2. 예시화면에 네모 그리기
   - 빈 공간 없게 네모 그리기
3. 바깐 네모부터 하나하나 위젯으로 만들기
    - 가로정렬 -> Row, 세로정렬 -> Column
4. 마무리 디자인
   - 마진, 패딩, 사이즈, 정렬 등

## Flexible, Expanded
- 박스폭을 %로 설정: Flexible()로 감싼다.
- Row안에서 박스 하나만 꽉채우고 싶으면 Expanded()
  - flex: 1가진 Flexible 박스와 동일 

## 박스 디자인이 의도와 다를 경우
1. 사이즈가 이상한 경우
2. 위치가 이상한 경우
3. DevTools로 확인하기
4. 글자와 아이콘의 크기는 작다.
   - 정렬했는데도 안 움직이면 박스크기가 너무 작은지 의심해보자.

## 커스텀 위젯
- 직접 위젯을 정의해서 사용
  - extends StatelessWidget
  - build가 있어야 위젯이 된다.
- 변수, 함수에도 담을 수 있는데 성능문제 때문에 사용하지 않는다.
  - 앱바, 하단바같이 변하지않는 애들은 변수, 함수 축약해도 됨.
- 커스텀 위젯을 자주 사용하면 state 관리가 힘들다
- 재사용이 많은 UI
- 큰 페이지는 커스텀 위젯으로 나누는게 좋다.

## ListView
- ListView -> 리스트뷰를 만들어주는 함수
- 스크롤바 생김
- contoller: ScrollController() -> 스크롤 위치를 알 수 있다.
- 메모리 절약 기능 존재
  - 유저 스크롤 위치에 따라 안 보이는 데이터 메모리 삭제해줌
- ListTile() -> 그림, 텍스트  쉽게 만든다.

## ListView.builder
- itemCount: 생성 개수
- itemBuilder: 아이템 생성 함수(context, index) { return Widget() }
  - context: 
  - index: 0부터 1씩 증가하는 정수

## 재렌더링
- state 쓰면 자동으로 재렌더링된다.
- 자료저장은 변수와 state가 있다.
  - 변수: 일반 변수
  - state: 값이 변하면 state를 쓰는 위젯들이 자동으로 재렌더링된다.
- state 만드는 법
  - StatefulWidget 만들기
  - statefulewidget안(단, 두번째클래스)에서는 변수가 state가 된다.
- state 변경하려면 setState((){여기서변경})를 써야한다.
- 자주 바뀌는 걸 state로 쓰자.

## dialog
- 모달창
- showDialog(context: context, builder: (context) { return AlertDialog() })

## flutter에서 context란?
- 부모 위젯의 정보를 담고있는 변수
  - 여기서 부모는 상속한 클래스가 아니라 이 위젯을 호출한 위젯을 의미한다.
- 어기서 씀?
  - showDialog.of(context)
  - Scaffold.of(context)
  - Navigator.of(context)
  - Theme.of(context)
- 단, MaterialApp을 포함한 context이어야 한다.
- Builder로 감싸면 context를 생성할 수 있다.

## 자식이 부모 state 사용하기
1. 전송 
   - 자식위젯(작명: 보낼state)
2. 등록
   - 자식위젯({Key? key, this.작명})
3. 사용 (read-only가 좋다.)
- 자식이 부모에게 state 전송은 안된다.