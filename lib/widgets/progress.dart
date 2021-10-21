import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PForm extends StatefulWidget {
  final List<Widget>? pages;
  final List<PTitle>? title;
  PForm({this.pages, this.title});
  @override
  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin {
  List<AnimationController>? _controller;
  List<Animation<double>>? _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = List.generate(
        widget.pages!.length,
        (index) => AnimationController(
            vsync: this, duration: Duration(milliseconds: 200), lowerBound: 0));
    _animation = _controller!
        .map((_controller) =>
            Tween<double>(begin: .1, end: 1).animate(_controller))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.pages!.map((e) {
          int index = widget.pages!.indexOf(e);
          return Stack(
            //alignment: Alignment.center,
            children: [
              if (index != widget.pages!.length - 1)
                Container(
//                  width: MediaQuery.of(context).size.width * .28,
//                  height: 3,
//                  color: Colors.white,
//                  margin: EdgeInsets.only(
//                    left: 35,
//                    top: 25,
//                    right: 0
//                  ),
                  child: SizeTransition(
                    sizeFactor: _animation![index],
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 35,
                          top: 25,
                          right: 0
                      ),
                      width: MediaQuery.of(context).size.width * .28,
                      height: 3,
                      color: Colors.white,
                    ),

                  ),
                ),
              InkWell(
                onTap: (){
                  print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                  for (var i=0;i<widget.pages!.length;i++){
                    if(index==i){
                      _controller![index].animateTo(1);
                    }else{
                      if(_controller![i].isCompleted)
                        _controller![i].reverse();
                    }
                    setState(() {

                    });
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Color(0xff00c569),
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: ShapeDecoration(
                          shape: CircleBorder(
                              side: BorderSide(color: Color(0xff00c569))),
                          color: Color(0xff00c569)),
                    ),
                  ),
                ),
              ),
//              Container(
//                width: 35,
//                height: 35,
//                color: Colors.grey,
//              )
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 0,
                      top: 60,
                    ),
                    child: e,
                  ),
                ],
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
