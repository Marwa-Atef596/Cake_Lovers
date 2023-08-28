import 'package:flutter/material.dart';

class OnboardingPage1 extends StatefulWidget {
  @override
  _OnboardingPage1State createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      image: 'images/cake.jpg',
      title: 'Welcome to Cake Lovers',
      description: '',
    ),
    OnboardingItem(
      image: 'images/delicious-pink-cream-cupcakes.jpg',
      title:
          ' we believe that a cake is not just a \ndessert its a centerpiece of celebration',
      description: '',
    ),
    OnboardingItem(
      image: 'images/top-view-donuts-chopping-board-with-wooden-spoon.jpg',
      title:
          'its not just about the taste our cakes\n are also a feast for the eyes',
      description: '',
    ),
  ];

  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingItems.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return OnboardingScreen(
                item: _onboardingItems[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: _buildPageIndicator(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentPage != _onboardingItems.length - 1)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: EdgeInsets.only(right: 40),
                                    backgroundColor: Color(0xffd24685),
                                    fixedSize: Size(110, 40)),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: "json"),
                                ),
                              ),
                            if (_currentPage == _onboardingItems.length - 1)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    //padding: EdgeInsets.only(right: 40),
                                    backgroundColor: Color(0xffd24685),
                                    fixedSize: Size(110, 40)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "login");
                                },
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(fontFamily: "json"),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "login");
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontFamily: "json"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _onboardingItems.length; i++) {
      indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 12.0,
      width: isActive ? 40.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xffd24685) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingScreen({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: "danco"),
            ),
            //SizedBox(height: 16),
            Text(
              item.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
