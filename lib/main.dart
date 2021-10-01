import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class CImages{
  CImages({required this.image});
  String image;

}

final List<CImages> _cImages = <CImages>[

  CImages(image: 'images/IM3.png'),
  CImages(image: 'images/IM2.png'),
  CImages(image: 'images/IM4.png'),

];




class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[700],
             actions: [
               Row(
                 children: [
                   Container(
                     height: 100.0,
                     width: 150.0,
                     padding: const EdgeInsets.all(5.0),
                     color: Colors.red[700],
                     child: const Image(
                       image: AssetImage('images/IM1.png'),
                     ) ,
                   ),
                   const SizedBox(width: 150.0,),
                   IconButton(
                     onPressed: (){
                     },
                     icon: Icon(Icons.notifications),
                   )
                 ],
               )
             ],

            bottom: const TabBar(
              isScrollable: true,
              tabs:  [
                Tab(
                  text: 'CRICKET' ,
                ),
                Tab(
                  text: 'KABADDI' ,
                ),
                Tab(
                  text: 'NBA' ,
                ),
                Tab(
                  text: 'FOOTBALL' ,
                )
              ],
            ),
          ),

          body: Stack(
            children:  [
              Column(
                children: [
                  Container(
                    height: 160.0,
                    color: Colors.grey[350],
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _cImages.length,
                        itemBuilder:(BuildContext context , int index)
                        {
                          return Container(
                          child: Card(
                          elevation:2.0,
                         child:  Container(
                             height: 150.0,
                             width: 350.0,
                            child: Image.asset(_cImages[index].image,fit:BoxFit.fill),
                           )
                          )
                          );
                        }


                    ),
                  ),
                  Material(
                    elevation: 5.0,
                    child:Container(
                      decoration: BoxDecoration(),
                      child:   TabBar(
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Colors.red,
                                width:2.0
                          )
                        ),
                        labelColor: Colors.grey[500],
                        tabs: const [
                          Tab(
                            text: 'FIXTURES',
                          ),
                          Tab(
                            text: 'LIVE',
                          ),
                          Tab(
                            text: 'RESULT',
                          ),
                          Tab(
                            text: 'UPCOMING',
                          )
                        ],
                      ),
                    ) ,
                  ),
                  const SizedBox(height:10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text('Select a Match',style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                  const SizedBox(height:10.0),
                  Expanded(
                    child: Container(
                      child:ListView.builder(
                           shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder:(BuildContext context , int index)
                          {
                            return Container(
                              width:180.0,
                              height: 120.0,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                     Row(
                                       children: [
                                         Image.asset('images/csk.png',height: 110.0,width: 90.0,),
                                       ],
                                     ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        Text('T20 League'),
                                        SizedBox(height:10.0),
                                        Text('vs'),
                                        Row(
                                          children: [
                                            Icon(Icons.timer,size: 15.0, color: Colors.red[700],),
                                            SizedBox(width:10.0),
                                            Text('01Hr  08m  02s',style:TextStyle(color: Colors.red[700],fontSize:18.0) ,)
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('images/mi.png',height: 110.0,width: 90.0,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:0,
            items: const  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home,color: Colors.grey,),
                title: Text('Home',style: TextStyle(color:Colors.grey),),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star,color: Colors.grey,),
                title: Text('Start',style: TextStyle(color:Colors.grey),),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline,color: Colors.grey,),
                title: Text('My Account',style: TextStyle(color:Colors.grey),),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more,color: Colors.grey,),
                title: Text('More',style: TextStyle(color:Colors.grey),),
              )
            ],
          ),


        )
    );
  }
}
