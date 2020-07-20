import 'package:bookshareapp/TopicsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:websafe_svg/websafe_svg.dart';

class OnBoardingScreens extends StatefulWidget {
  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 1,
    );
    super.initState();
  }

  void pushToTopicsPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return ChooseTopics();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          PageView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width * 0.79,
                      width: MediaQuery.of(context).size.width * 0.79,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          WebsafeSvg.asset(
                            'assets/svg/BackgroundDesignOnboarding.svg',
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.width * 0.16,
                            child: WebsafeSvg.asset(
                              'assets/svg/OnboardingScreenOneIllustration.svg',
                              height:
                                  MediaQuery.of(context).size.height * 0.265,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Share Your Favourite Books With Your Family And Friends',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width * 0.79,
                      width: MediaQuery.of(context).size.width * 0.79,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          WebsafeSvg.asset(
                            'assets/svg/BackgroundDesignOnboarding.svg',
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.width * 0.13,
                            child: WebsafeSvg.asset(
                              'assets/svg/OnboardingScreenTwoIllustration.svg',
                              height: MediaQuery.of(context).size.height * 0.22,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Discovery 20 Million Books Shelved Online',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * 0.79,
                        width: MediaQuery.of(context).size.width * 0.79,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            WebsafeSvg.asset(
                              'assets/svg/BackgroundDesignOnboarding.svg',
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.width * 0.19,
                              child: WebsafeSvg.asset(
                                'assets/svg/OnboardingScreenThreeIllustration.svg',
                                height:
                                    MediaQuery.of(context).size.height * 0.185,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy And Sell Books With Us',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.12),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.width*0.12,
                        child: RaisedButton(
                          color: Color(0xffFF6EA1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.roboto(color: Colors.white,fontSize: 20),
                          ),
                          onPressed: () {
                            pushToTopicsPage();
                          },
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),

          //Skip Button
          Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,
              child: FlatButton(
                  onPressed: () {
                    pushToTopicsPage();
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.roboto(color: Colors.grey,fontSize: 16),
                  ))),

          //Dots Indicator
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.2),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: _pageController, // PageController
                count: 3,
                effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Color(0xffFF6EA1),
                    activeDotColor: Color(0xffFF6EA1)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
