import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mbanking/utility/big_text.dart';
import 'package:mbanking/utility/icon_text.dart';
import 'package:mbanking/utility/small_text.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue=0.0;
  final double _scaleFactor=0.8;
  final double _height=220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
      _currPageValue = pageController.page!;
        // ignore: avoid_print
        print("Current value is" +_currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
      pageController.dispose();   
  }

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Cari'),
        backgroundColor: const Color(0xffa5683a),
      ),

      body: Column(
        children: [
          // SizedBox(height:spaceHeight), // Ubah tinggi sesuai kebutuhan
          Container(
            // color: Colors.redAccent,
            height: 320.0,
            child: PageView.builder(
              controller: pageController,
              itemCount: 4,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            ),
          ),
          // ignore: unnecessary_new
          new DotsIndicator(
            dotsCount: 4,
            position: _currPageValue,
            decorator: const DotsDecorator( 
              spacing: EdgeInsets.all(10.0),
            ),
          )
        ],
      ),
  );
}

  Widget  _buildPageItem(int index){

    Matrix4 matrix = Matrix4.identity();

      if(index==_currPageValue.floor()){

        // ignore: non_constant_identifier_names
        var CurrScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-CurrScale)/2;

        matrix =  Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);
        
      }else if(index==_currPageValue.floor()+1){
        // ignore: non_constant_identifier_names
        var CurrScale =_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
        var currTrans = _height*(1-CurrScale)/2;

        matrix =  Matrix4.diagonal3Values(1, CurrScale, 1);
        matrix =  Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);

      }else if(index==_currPageValue.floor()-1){
        // ignore: non_constant_identifier_names
        var CurrScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-CurrScale)/2;

        matrix =  Matrix4.diagonal3Values(1, CurrScale, 1);
        matrix =  Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTrans, 0);

      }else{
        // ignore: non_constant_identifier_names
        var CurrScale=0.8;
        matrix =  Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
      }
      //end matrix

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220.0,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 242, 242, 242),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/404.png"
                )
              )
            ),
          ),
    
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120.0,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  const Color.fromARGB(255, 239, 239, 239),
                boxShadow: const [
                  BoxShadow(
                    color:Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color:Color(0xFFe8e8e8),
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color:Color(0xFFe8e8e8),
                    offset: Offset(5, 0)
                  ),
                ]
              ),
    
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "text"),
                    const SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, 
                            (index) => const Icon(Icons.star, 
                            color:Colors.amber, 
                            size: 15,
                            )),
                          ),
                          const SizedBox(width: 10,),
                          SmallText(text: "4.5")
                        ],
                      ),
    
                      const SizedBox(height: 20.0,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndText(icon:Icons.checklist_rtl_outlined, 
                          text: "Normal",
                          iconColor: Colors.blueAccent),
    
                          IconAndText(icon:Icons.location_on, 
                          text: "Normal",
                          iconColor: Color.fromARGB(255, 26, 221, 81)),
    
                          IconAndText(icon:Icons.access_time_rounded, 
                          text: "Normal",
                          iconColor: Color.fromARGB(255, 248, 78, 78))
                        ],
                      )
                    ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}