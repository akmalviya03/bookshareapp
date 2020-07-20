import 'package:flutter/material.dart';
import 'package:bookshareapp/TopicsClass.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseTopics extends StatefulWidget {
  @override
  _ChooseTopicsState createState() => _ChooseTopicsState();
}

class _ChooseTopicsState extends State<ChooseTopics> {
  List<Topic> topics = [
    Topic(imagePath: 'Path1', name: 'Politics'),
    Topic(imagePath: 'Path1', name: 'History'),
    Topic(imagePath: 'Path1', name: 'Science'),
    Topic(imagePath: 'Path1', name: 'Law'),
    Topic(imagePath: 'Path1', name: 'Food'),
    Topic(imagePath: 'Path1', name: 'Medical'),
    Topic(imagePath: 'Path1', name: 'Design'),
    Topic(imagePath: 'Path1', name: 'Culture'),
    Topic(imagePath: 'Path1', name: 'Sport')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Header Light Pink With Text
            Container(
              color: Color(0xffFF91B8),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Welcome\nChoose the topics',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            //GridView To Show Topics
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: topics.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.98,
                      crossAxisCount: 3,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.width * 0.06),
                  itemBuilder: (context, index) {
                    return Column(children: [
                      ClipOval(
                        child: InkWell(
                          child: Container(
                            color: topics[index].isSelected
                                ? Colors.black
                                : Colors.blue,
                            height: MediaQuery.of(context).size.width * 0.25,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Visibility(
                              visible: topics[index].isSelected,
                              child: Icon(
                                Icons.check,
                                size: MediaQuery.of(context).size.width * 0.2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            topics[index].isSelected =
                                !topics[index].isSelected;
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Text(
                          topics[index].topicName,
                          style: GoogleFonts.roboto(fontSize: 16),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                child: Text(
                  'Apply',
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
                color: Color(0xffFF6EA1),
              ),
            )
          ],
        ),
        //Header Dark Pink Design
        Positioned(
          top: MediaQuery.of(context).size.height * 0.14,
          child: CustomPaint(
            painter: TopicsHeaderDesign(),
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.1),
          ),
        ),
      ]),
    );
  }
}

class TopicsHeaderDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paintPaths = Paint()
      ..color = Color(0xffFF6EA1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5; // Change this to fill

    var path = Path();
    path.lineTo(0, size.height * 0.5);
    //Lower left
    path.cubicTo(0, size.height * 0.5, size.width * 0.2, size.height * 0.2,
        size.width * 0.4, size.height * 0.3);
    //Lower Right
    path.cubicTo(size.width * 0.5, size.height * 0.3, size.width * 0.7,
        size.height * 0.8, size.width * 1.1, size.height * 0.2);
    //Upper Right
    path.cubicTo(size.width * 1.1, size.height * 0.2, size.width * 0.7,
        0 - size.height * 0.2, size.width * 0.4, size.height * 0.13);
    //Upper Left
    path.cubicTo(size.width * 0.4, size.height * 0.13, size.width * 0.15,
        size.height * 0.25, 0, 0);
    canvas.drawPath(path, paintPaths);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
