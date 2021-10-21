import 'package:customstrpperform/widgets/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          child: Center(
            child: Text("CheckOut",
            style: TextStyle(
              color: Color(0xffe99400)
            ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 70,horizontal:18),
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffe99400),Color(0xffe99400)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PForm(
                  pages: [
                    Text("Delivery"),
                    Text("Address"),
                    Text("Payments")
                  ],
                  title: [
                    PTitle(),
                    PTitle(),
                    PTitle()
                  ],
                )
              ],
            ),
          ),

//          DraggableScrollableSheet(
//            maxChildSize: .9,
//              minChildSize: .5,
//              initialChildSize: .6,
//              builder: (cxt,controller){
//                return Container(
//                  //padding: EdgeInsets.symmetric(vertical: 50,horizontal:50),
//                  decoration: BoxDecoration(
//                    color: Color(0xffe99400),
//                    borderRadius: BorderRadius.circular(30),
//                  ),
//                  child: SingleChildScrollView(
//                    controller: controller,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: [
//                        PForm(
//                          pages: [
//                            Text("Page1"),
//                            Text("Page2"),
//                            Text("Pages3")
//                          ],
//                          title: [
//                            PTitle(),
//                            PTitle(),
//                            PTitle()
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//                );
//              }
//          )
        ],
      ),
      bottomSheet: BottomSheet(
          onClosing: (){

          },
          builder: (context){
            return Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              //alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffe99400)
                        ),
                          onPressed: (){

                          },
                          child: Text("Next",style: TextStyle(color: Colors.black),)
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
