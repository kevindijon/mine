import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: currentScreen(),
      borderRadius: 30,
      showShadow: true,
      angle: -10.0,
      slideWidth: 200,
      menuBackgroundColor: const Color.fromARGB(255, 70, 65, 27),
    );
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen(
          title: "Notifications",
        );

      case 1:
        return const HomeScreen(
          title: "Inbox",
        );
      case 2:
        return const HomeScreen(
          title: "Sent",
        );
      case 3:
        return const HomeScreen(
          title: "Documents",
        );
      case 4:
        return const HomeScreen(
          title: "Favorite",
        );
      case 5:
        return const HomeScreen(
          title: "Payment",
        );
      case 6:
        return const HomeScreen(
          title: "Spam Riders",
        );
      default:
        return const HomeScreen();
    }
  }
}

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: const DrawerWidget(),
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 65, 27),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(15, -179),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/images/cute2.jpg'),
              radius: 60,
            ),
          ),
          const SizedBox(height: 8),
          Transform.translate(
            offset: Offset(20, -179), // Adjust the offset as needed
            child: Text(
              'Ouma Bileh',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          drawerList(Icons.notifications, "Notifications", 0),
          drawerList(Icons.mail, "Inbox", 1),
          drawerList(Icons.send, "Sent", 2),
          drawerList(Icons.edit_document, "Documents", 3),
          drawerList(Icons.favorite, "Favorite", 4),
          drawerList(Icons.payment, "Payments", 5),
          drawerList(Icons.block, "Spam Riders", 6),
        ],
      ),
    );
  }

  Widget drawerList(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(Icons.menu),
    );
  }
}
