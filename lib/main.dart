import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<PageWidget> _pages = [
    const PageWidget(
        title: 'Calculate', child: Center(child: Text('Calculate'))),
    const PageWidget(title: 'History', child: Center(child: Text('History'))),
    const PageWidget(title: 'Settings', child: Center(child: Text('Settings'))),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Scheduler',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_currentIndex].title),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.calculate),
              label: _pages[0].title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history),
              label: _pages[1].title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: _pages[2].title,
            ),
          ],
        ),
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  const PageWidget({Key? key, required this.title, required this.child})
      : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}