import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'dart:async';
import 'package:bookshareapp/OnBoardingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffFF6EA1),
            body: SplashScreen(),
          ),
        ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushToPageView();
  }

  pushToPageView() async {
    Timer(Duration(seconds: 2), onBoardingPath);
  }

  void onBoardingPath() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return OnBoardingScreens();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomPaint(
        painter: SplashDesign(),
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
      ),
      Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WebsafeSvg.asset(
                'assets/svg/logo.svg',
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Book Share',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              )
            ],
          ))
    ]);
  }
}

class SplashDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.square;
    Path path = new Path();
    path.moveTo(size.width / 1.5, 0);
    path.lineTo(size.width / 10, size.height / 7);
    path.lineTo(size.width / 10, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
