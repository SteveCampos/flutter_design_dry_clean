import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //SystemChrome.setEnabledSystemUIOverlays([]);
    var headerHeight = screenSize.height * 0.5;
    var containerHeight = screenSize.height * 0.65;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 0, horizontal: screenSize.width * 0.08),
            height: headerHeight,
            color: Colors.white,
            child: _buildHeader(context),
          ),
          Positioned(
              top: screenSize.height - containerHeight,
              child: Container(
                height: containerHeight,
                width: screenSize.width,
                color: Colors.black12,
                child: _buildContent(context),
              ))
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/-JWSew6xYaQE/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rcTiGPrizBNiYk4iQmUwP4p-SyyNg/photo.jpg?sz=46')),
        Text('Hi Steve.', style: Theme.of(context).textTheme.headline),
        Text(
            'Get your laundry washed, folded and delivered straight to your door.',
            style: Theme.of(context).textTheme.subhead),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    var w = MediaQuery.of(context).size.width * 0.01;
    return GridView(
      padding: EdgeInsets.only(top: w * 4, left: w * 8, right: w * 8),
      //padding: EdgeInsets.only(left: w * 8, right: w * 8),
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: w * 2, mainAxisSpacing: w * 2),
      // Generate 100 widgets that display their index in the List.
      children: <Widget>[
        MyCard('Wash', '1 day', 'assets/washing_machine.svg'),
        MyCard('Dry Clean', '3 day', 'assets/cloth.svg'),
        MyCard('Premiun', 'All in 1 day', 'assets/moon.svg'),
        MyCard('Others', '3 day', 'assets/iron.svg'),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetName;

  MyCard(this.title, this.subtitle, this.assetName);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width * 0.01;
    // The InkWell wraps the custom flat button widget.
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(w * 4)),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tapped: $title'),
          ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SvgPicture.asset(
              assetName,
              height: w * 20,
              width: w * 20,
            ),
            Text(title, style: Theme.of(context).textTheme.title),
            Text(subtitle)
          ],
        ),
      ),
    );
  }
}
