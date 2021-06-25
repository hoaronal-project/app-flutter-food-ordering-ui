import 'package:flutter/material.dart';
import 'package:food_ui_ordering/constant/data_json.dart';
import 'package:food_ui_ordering/pages/product_detail.dart';
import 'package:food_ui_ordering/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // SvgPicture.asset("assets/images/camera_icon.svg",width: 30,),
            Text("The Food", style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 30,
                color: Colors.black
              ),
            ),
            IconButton(icon: Icon(Icons.notifications), color: Colors.black, onPressed: () {})
          ],
        ),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    
    return ListView(
      padding: EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 20),
      children: <Widget>[
        Text("Signature",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10,),
        SizedBox(height: 30,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
              images: food_data_section_one[0]['img_mul'],
              name: food_data_section_one[0]['name'],
              price: food_data_section_one[0]['price'],
              description: food_data_section_one[0]['description'],
            )));
          },
          child: Container(
            width: 160,
            height: 160,
             
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 15,
                  left: 0,
                  child: Container(
                  width: MediaQuery.of(context).size.width-30,
                  height: 120,
                   decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(60)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: (MediaQuery.of(context).size.width-30)* 0.46,
                        ),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(food_data_section_one[0]['name'],style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                Text(food_data_section_one[0]['description']),
                               
                              //  Icon(Icons.add_circle)
                              ],),
                              SizedBox(height: 8,),
                                Text(food_data_section_one[0]['price'],style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ))
                      ],
                    )
                  ),
                ),
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 15
                      )],
                      shape: BoxShape.circle,
                      image: DecorationImage(image: 
                      AssetImage(food_data_section_one[0]['img']),fit: BoxFit.cover)
                    ),
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 30,),

        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(food_data_section_two.length, (index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                    images: food_data_section_two[index]['img_mul'],
                    name: food_data_section_two[index]['name'],
                    price: food_data_section_two[index]['price'],
                    description: food_data_section_two[index]['description'],
                  )));
                },
                  child: Container(
                  decoration: BoxDecoration(
                  ),
                width: (MediaQuery.of(context).size.width-110)/2,
                height: 250,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 3,
                      top: 3,
                      child: Container(
                        width: 125,
                        height: 235,
                        decoration: BoxDecoration(
                           color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(60),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                Text(food_data_section_two[index]['name'],style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 6,),
                     Text(food_data_section_two[index]['description'],style: TextStyle(
                        fontSize: 12,
                      ),),
                      SizedBox(height: 6,),
                        Text(food_data_section_two[index]['price'],style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        // color: Colors.redAccent,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: 
                        AssetImage(food_data_section_two[index]['img']),fit: BoxFit.cover),
                         boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10
                        )],
                      ),
                    ),
                    // Positioned(
                    //   left: 50,
                    //   top: 220,
                    //   child: Icon(Icons.add_circle,size: 28,)
                    // )
                  ],
                ),
              ),
              );
            }),
          ),
        ),
        SizedBox(height: 20,),
        Text("Popular",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 25,),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: 
                Row(
                  children: 
                  List.generate(popular.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(height: 10,),
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  width: size.width - 30,
                                  height: 160,
                                  child: Image(
                                    image: NetworkImage(
                                        popular[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   bottom: 15,
                              //   right: 15,
                              //   // child: SvgPicture.asset(
                              //   //   popular[index]['is_liked']
                              //   //       ? "assets/images/loved_icon.svg"
                              //   //       : "assets/images/love_icon.svg",
                              //   //   width: 20,
                              //   //   color: white,
                              //   // ),
                              //   child: popular[index]['is_liked'] ? Icon(Icons.star, size: 28,color: white,) : Icon(Icons.star_border,size: 28,color: white,)
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            popular[index]['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                                "\$ 12.50",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                                ),
                              ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Sponsored",
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Icon(
                          //       Icons.info,
                          //       color: Colors.grey,
                          //       size: 15,
                          //     )
                          //   ],
                          // ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                popular[index]['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.timelapse,
                                    color: primary,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    popular[index]['time'],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        popular[index]['rate'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: yellowStar,
                                        size: 17,
                                      ),
                                      Text(
                                        popular[index]['rate_number'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Text("Recommended",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 25,),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: 
                Row(
                  children: 
                  List.generate(recommended.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(height: 10,),
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  width: size.width - 30,
                                  height: 160,
                                  child: Image(
                                    image: NetworkImage(
                                        recommended[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   bottom: 15,
                              //   right: 15,
                              //   // child: SvgPicture.asset(
                              //   //   recommended[index]['is_liked']
                              //   //       ? "assets/images/loved_icon.svg"
                              //   //       : "assets/images/love_icon.svg",
                              //   //   width: 20,
                              //   //   color: white,
                              //   // ),
                              //   child: recommended[index]['is_liked'] ? Icon(Icons.star, size: 28,color: white,) : Icon(Icons.star_border,size: 28,color: white,)
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            recommended[index]['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                                "\$ 12.50",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87
                                ),
                              ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Sponsored",
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Icon(
                          //       Icons.info,
                          //       color: Colors.grey,
                          //       size: 15,
                          //     )
                          //   ],
                          // ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                recommended[index]['description'],
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.timelapse,
                                    color: primary,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    recommended[index]['time'],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        recommended[index]['rate'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: yellowStar,
                                        size: 17,
                                      ),
                                      Text(
                                        recommended[index]['rate_number'],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}