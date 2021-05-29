import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      DeveloperCard(
        image: 'assets/images/pragati .jpg',
        name: 'Pragati',
        oneLiner: "Hi I'm Pragati, I'm a Full-stack Web-app developer",
      ),
      DeveloperCard(
        image: 'assets/images/ashik.jpeg',
        name: 'Ashik',
        oneLiner: "Hi I'm Ashik, I'm a Full-stack Mobile App developer",
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: ScreenUtil().setSp(25),
                color: Color(0xff0000ff),
              ),
            ),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top:17.h),
            child: Text('About', style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color(0xff0000ff)),),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
          child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
        child: ListWheelScrollView(
          perspective: 0.01,
          itemExtent: 300.h,
          children: items,
          offAxisFraction: -0.5,
          physics: BouncingScrollPhysics(),
          diameterRatio: 5,
          squeeze: 0.8,
        ),
      )),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String image, name, oneLiner;

  const DeveloperCard({Key key, this.image, this.name, this.oneLiner})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 328.w,
            ),
            CircleAvatar(
              radius: 70.h,
              backgroundImage: AssetImage(
                image,
              ),
            ),
            SizedBox(
              width: 16.h,
            ),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(24)),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    oneLiner,
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
