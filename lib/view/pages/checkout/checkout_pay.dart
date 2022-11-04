import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/checkout/checkout_done.dart';
import '../../components/auth/components.dart';
import '../../components/checkout/checkout_com.dart';

class CheckoutPay extends StatelessWidget {
  const CheckoutPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController visaController=TextEditingController();
    TextEditingController dayVisaController=TextEditingController();
    TextEditingController monVisaController=TextEditingController();
    TextEditingController passVisaController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          'Checkout',
          style: textStyleRoboto.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DottedLine(
            lineLength: double.infinity,
            dashLength: 316,
            dashColor: mainColor,
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Spiderman No Way Home',
                style: textStyleRoboto.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tomorrow | 20 Feb | 9:00pm',
                style: textStyleRoboto.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 22, left: 31, right: 33, bottom: 25),
            child: Container(
                padding: const EdgeInsets.only(
                    left: 17, right: 16, top: 20, bottom: 20),
                //height: 250,
                width: 296,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 17),
                      child: Row(
                        children: [
                          Text(
                            'NP Order',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Text(
                            '7283603745',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: firstColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.7, bottom: 18.3, left: 17),
                      child: Row(
                        children: [
                          Text(
                            'Info',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 98,
                          ),
                          Text(
                            'Spiderman No Way Home',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: firstColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.7, left: 17, bottom: 18.3),
                      child: Row(
                        children: [
                          Text(
                            'Session',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 77,
                          ),
                          Text(
                            '9:00pm , 20 Feb',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: firstColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.7, bottom: 18.3, left: 17),
                      child: Row(
                        children: [
                          Text(
                            'Seats',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 89,
                          ),
                          Text(
                            'G5,G6,G7,G8',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: firstColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 14.7),
                      child: Row(
                        children: [
                          Text(
                            'Total',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 93,
                          ),
                          Text(
                            '150 EGP',
                            style: textStyleRoboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 20),
            child: Text(
              'Payment Info',
              style: textStyleRoboto.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 24, bottom: 60),
            child: Container(
              height: 184,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                  children: [
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      payFormField(
                        top:  38,
                        left: 30,
                        right: 28,
                        width: double.infinity,
                        type:TextInputType.number,
                        hint: 'xxxx     xxxx     xxxx     xxxx',
                        controller: visaController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 92,top: 20,bottom: 2.5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                               Text('cvv',
                                 style: textStyleRoboto.copyWith(
                                fontSize: 8,
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                              ),
                                  ),

                          ],
                        ),
                      ),

                      Row(
                        children: [
                          payFormField(
                            top: 1,
                            width: 81.5,
                            left: 30,
                            right: 15,
                            type:TextInputType.number,
                            hint: '0 0',
                            controller: dayVisaController,
                          ),
                          payFormField(
                            top: 1,
                            width: 81.5,
                            left: 15,
                            right: 15,
                            type:TextInputType.number,
                            hint: '0 0',
                            controller: monVisaController,
                          ),
                          payFormField(
                            top: 1,
                            left: 15,
                            right: 27,
                            width: 84,
                            obscure: true,
                            type:TextInputType.number,
                            hint: '* * *',
                            controller: passVisaController,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -50,
                  left: 250,
                  bottom: 100,
                  child: Container(
                    height: 226,
                    width: 321,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: thirdColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 99,
                  right: 250,
                  left: -50,
                  child: Container(
                    height: 226,
                    width: 321,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: thirdColor,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      buildBottomNav(
          onTap: () {
            navigateTo(context, const CheckoutDone());
          },
          name: 'Pay Now'),
    );
  }
}