import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/widgets/destinations.dart';
import 'package:travel/widgets/hotels.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  int _selectedState = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
  ];

  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedState = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: (_selectedState == index)
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Icon(
          _icons[index],
          color: (_selectedState == index)
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 30.0,
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 100,
              ),
              child: Text(
                "What would you like to do?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcons(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarosel(),
            SizedBox(
              height: 20.0,
            ),
            HotelsCarosel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 25.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.pizzaSlice,
              size: 25.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/gDWVX1g/photo.jpg',
              ),
              radius: 20,
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
