import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendthreads/consts/consts.dart';

import '../../consts/colors.dart';
import '../../consts/list.dart';
import '../../widgets_common/edit_buttonwidget.dart';
class ItemDetails extends StatelessWidget {
  final String? Titel ;
  const ItemDetails({Key? key,required this.Titel}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: bgColor,
        title:  Titel!.text.white.make(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined,color: Colors.white,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Container(

            padding: const EdgeInsets.all(8),
            child:SingleChildScrollView(child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              VxSwiper.builder(
                  autoPlay: true,
                  height: 350,
                  aspectRatio: 16/9,
                  itemCount: 3, itemBuilder: (context,index){
                return Image.asset(imgCP8,width: double.infinity,fit: BoxFit.fill,);
              }),

                10.heightBox,

                Titel!.text.size(16).color(bgColor).make(),
                
                10.heightBox,

                VxRating(onRatingUpdate: (value){},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  stepInt: true,),
                10.heightBox,
                "₹299".text.color(bgColor).make(),
                10.heightBox,
                
                Row(
                  children: [
                    Expanded(child:

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        "Seller".text.white.make(),
                        5.heightBox,
                        "In House Brands".text.white.make(),
                      ],
                    ),
                    ),
                    const CircleAvatar(
                      backgroundColor: bgColor,
                      child: Icon(Icons.message_rounded,color: Colors.white,),
                    )
                  ],
                ).box.height(56).padding(EdgeInsets.symmetric(horizontal: 16)).color(bgColor).make(),
20.heightBox,
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color:".text.color(bgColor).make(),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(3,
                                  (index) =>
                                      VxBox().size(25, 25).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal: 4)).make()
                          ),
                        ),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                    
                    
                    // quantity row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color:".text.color(bgColor).make(),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.remove),color: bgColor,),
                            "0".text.size(14).color(bgColor).make(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add),color: bgColor,),
                            10.widthBox,
                            "(0 available)".text.color(bgColor).size(14).make()
                          ],
                        ),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),

                    // total price

                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total:".text.color(bgColor).make(),
                        ),
                        Row(
                          children: [
                            "₹ 0".text.color(bgColor).center.make(),
                          ],
                        ),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                  ],
                ).box.white.shadowSm.make(),
                10.heightBox,
                "Description".text.color(bgColor).size(16).make(),
                10.heightBox,
                "Demo Description ..............".text.color(Colors.grey).make(),

                // button selection
10.heightBox,
                ListView(
                  shrinkWrap: true,
                  children: List.generate(ButtonListCate.length, (index) => ListTile(
                   title: ButtonListCate[index].text.color(bgColor).make(),
                   trailing: Icon(Icons.arrow_circle_right_sharp,color: bgColor,),
                  )),
                )
              ],
            ),
            ),
          )),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: editbutton(
              color: bgColor,
              onPress: (){},
              textColor: Colors.white,
              title: "Add to Cart"
            ),
          )
        ],
      ),
    );
  }
}
