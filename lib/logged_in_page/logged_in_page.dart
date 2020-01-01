import 'package:flutter/material.dart';

class LoggedInPage extends StatefulWidget {
  @override
  _LoggedInPageState createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text("Main Page", style: TextStyle(color: Colors.black), ),
      ),
      backgroundColor: Colors.white,

      body: new PageView(
        children: [
          new RaffleDrawScreen(),
          new RaffleDrawWinnersScreen(),
          UserScreen()
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.black,
            ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Home",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            new BottomNavigationBarItem(
      
                icon: new Icon(
                  Icons.people,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Top Winners",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
                new BottomNavigationBarItem(
      
                icon: new Icon(
                  Icons.person,
                  color: const Color(0xFFFFFFFF),
                ),
                title: new Text(
                  "Profile",
                  style: new TextStyle(
                    color: const Color(0xFFFFFFFF),
                  ),
                )),
            ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
    
  }
}

class UserScreen extends StatelessWidget {
 
 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      body: new Center(child: Text("User Screen"),)
    );
}
}

class RaffleDrawScreen extends StatelessWidget {
 
 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      body: new Center(child: Text("RAFFLE DRAWS"),)
    );
}
}

class RaffleDrawWinnersScreen extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Scaffold(body: Center(child: Text("RAFFLE DRAWS TOP WINNERS"),));
 }
}