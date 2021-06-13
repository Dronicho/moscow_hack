import 'package:flutter/material.dart';
import 'package:moscow/modules/home/screens/main_view.dart';
import 'package:moscow/modules/home/screens/notifications_view.dart';
import 'package:moscow/modules/home/screens/profile/profile_page.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int _index = 0;

  final _pages = <Widget>[ProfilePage(), MainView(), NotificationView()];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: PageView.builder(
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              _index = index;
              return _pages[index];
            },
            controller: _controller,
            allowImplicitScrolling: false,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
            _controller.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Профиль'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets), label: 'Сервисы'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Уведомления'),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
