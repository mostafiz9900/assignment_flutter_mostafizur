import 'package:assignment_flutter_mostafizur/app/global_widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../app_pkg.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {

    ButtonStyle elevatedButtonStyleCustom() => ElevatedButton.styleFrom(
      backgroundColor: Get.theme.primaryColor,
      minimumSize: Size(Get.width*0.80, 40),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );
    void filter(){
      Get.bottomSheet(
        Container(
          width: Get.width,
          height: 450,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: GetBuilder<HomeController>(
            builder: (homeController) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.topCenter,
                        height:3,width: 47,
                        decoration: BoxDecoration(
                            color: hexToColor('#FFD3DD'),
                            borderRadius: BorderRadius.circular(10)

                        ),
                      ),
                    ),
                    AppSpace.spaceH8,
                    Text("Filter",style: TextStyle(
                      color: hexToColor('#000000'),
                      fontSize: 17.38 , fontWeight: FontWeight.w700,

                    ),),
                    AppSpace.spaceH20,
                    LabeledCheckbox(
                      label: 'Newest',
                      value: homeController.isNewest,
                      onChanged: homeController.changeNewestFilter,

                    ),
                    LabeledCheckbox(
                      label: 'Oldest',
                      value:  homeController.isOldest,
                      onChanged: homeController.changeOldestFilter,

                    ),
                    LabeledCheckbox(
                      label: 'Price low > High',
                      value:  homeController.isLowToHighPrice,
                      onChanged: homeController.changeLowToHighPriceFilter,

                    ),
                    LabeledCheckbox(
                      label: 'Price high > Low',
                      value:  homeController.isHighToLowPrice,
                      onChanged: homeController.changeHighToLowPriceFilter,

                    ),
                    LabeledCheckbox(
                      label: 'Best selling',
                      value:  homeController.isBestSelling,
                      onChanged: homeController.changeBestSellingFilter,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: 155, // <-- match_parent
                            height: 62,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: hexToColor('#000000').withOpacity(0.08), // Shadow color with opacity
                                  spreadRadius: 0, // Spread value
                                  blurRadius: 14, // Blur value
                                  offset: const Offset(0, -10), // Offset (horizontal, vertical)
                                ),
                              ],
                            ),

                            child: ElevatedButton(onPressed: (){
                              homeController.cancleFilter();

                            },style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),

                            ), child: Text('Cancle',style: TextStyle(
                                color: hexToColor('#818995'),fontSize: 17,fontWeight: FontWeight.w400
                            ),)),
                          ),
                        ),
                        AppSpace.spaceW10,
                        Expanded(
                          child: Container(
                            // width: 155, // <-- match_parent
                            height: 62,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: hexToColor('#000000').withOpacity(0.08), // Shadow color with opacity
                                  spreadRadius: 0, // Spread value
                                  blurRadius: 14, // Blur value
                                  offset: const Offset(0, -10), // Offset (horizontal, vertical)
                                ),
                              ],
                            ),
                            child: ElevatedButton(onPressed: (){
                              homeController.filterLowAndHigh();

                            },style: ElevatedButton.styleFrom(
                              backgroundColor: hexToColor('#1ABC9C'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),

                            ), child: Text('Apply',style: TextStyle(
                                color: hexToColor('#FFFFFF'),fontSize: 17,fontWeight: FontWeight.w400
                            ),)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          ),
        ),
      );
    }
    return GetBuilder<HomeController>(
      builder: (homeCon) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 8,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text('Product List',style: TextStyle(color: hexToColor('#222455'),fontWeight: FontWeight.w700,fontSize: 22.57),),actions: [
            IconButton(onPressed: (){}, icon:SvgPicture.asset(AssetsConstants.searchIconSvg,color: hexToColor('#000000'),))
          ],),
          body:homeCon.loadHomePage?const Center(child: CircularProgressIndicator()): Container(
            padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: hexToColor('#395AB8').withOpacity(0.10),spreadRadius: 0,blurRadius: 4,offset: const Offset(0, 3))
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            filter();
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetsConstants.filterIconSvg),
                              AppSpace.spaceW6,
                              Text('Filter',style: TextStyle(
                                fontSize: 15.63,
                                fontWeight: FontWeight.w400,
                                color: hexToColor('#818995')
                              )
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                homeCon.sortBy();

                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Sortby',style: TextStyle(
                                                          fontSize: 15.63,
                                                          fontWeight: FontWeight.w400,
                                                          color: hexToColor('#818995')
                                                             )),
                                  AppSpace.spaceW6,
                                SvgPicture.asset(AssetsConstants.downIconSvg,color: hexToColor('#A0A9BD') ,)
                                ],
                              ),
                            ),

                            AppSpace.spaceW12,
                            InkWell(
                             onTap: (){
                               filter();
                             },
                              child: SvgPicture.asset(AssetsConstants.sortByIconSvg,color: hexToColor('#222455'),),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  AppSpace.spaceH12,

                 GridView.builder(
                    itemCount: homeCon.productList.length,
                    controller:  ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.60,
                      // childAspectRatio: MediaQuery.of(context).size.width /
                      //     (MediaQuery.of(context).size.height / 4),
                    ),
                    itemBuilder: (context, index) {
                      var product=homeCon.productList.elementAt(index);
                      return  Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: hexToColor('#4D5877').withOpacity(0.13),
                                  blurRadius: 6, spreadRadius: 0,
                                  offset: const Offset(2,3)

                              )
                            ]
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: SizedBox(
                                height:177,
                                width: Get.width,
                                child:CustomCachedNetworkImageWidget(
                                  imageUrl: product.images?[0].src??'',
                                  height:177,
                                  width: Get.width,

                                )
                                // Image.asset(AssetsConstants.productIconSvg,fit: BoxFit.cover)
                            )),
                            AppSpace.spaceH8,
                            Padding(
                              padding: const EdgeInsets.only(left: 12,right: 4,top: 6,bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(product.name??"",
                                    maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: hexToColor('#000000'),
                                        fontSize: 13.89,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  AppSpace.spaceH4,
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Visibility(
                                       visible:product.regularPrice!=null,
                                        child: Text('\$${product.regularPrice??0}',
                                          style: TextStyle(
                                              color: hexToColor('#989FA8'),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.lineThrough
                                          ),
                                        ),
                                      ),
                                      AppSpace.spaceW6,
                                      Text('\$${product.price??0}',
                                        style: TextStyle(
                                          color: hexToColor('#000000'),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppSpace.spaceH4,
                                  RatingBar.builder(
                                    initialRating: double.parse('${product.ratingCount??0}'),
                                    minRating: 1,
                                    itemSize:16,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}



class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: <Widget>[
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
              activeColor: hexToColor('#FF708A'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              side: BorderSide(
                color: hexToColor('#FF708A'),
                width: 1.25,
              ),
            ),
          ),
          Text(label,style: TextStyle(color: hexToColor('#000000'),fontWeight: FontWeight.w400,fontSize: 15),),
        ],
      ),
    );
  }
}