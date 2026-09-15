import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_scafold.dart';



class PrivacyPolicyScreen extends StatefulWidget {

  const PrivacyPolicyScreen({super.key});


  @override
  State<PrivacyPolicyScreen> createState() =>
      _PrivacyPolicyScreenState();

}



class _PrivacyPolicyScreenState
    extends State<PrivacyPolicyScreen>
    with SingleTickerProviderStateMixin {


  late AnimationController _controller;



  @override
  void initState(){

    super.initState();


    _controller = AnimationController(

      vsync:this,

      duration:
      const Duration(milliseconds:1200),

    );


    _controller.forward();

  }



  @override
  void dispose(){

    _controller.dispose();

    super.dispose();

  }





  Widget buildAnimatedSection({

    required int index,

    required String title,

    required String body,

  }){


    final animation =
    Tween<Offset>(

      begin:
      const Offset(0,.25),

      end:
      Offset.zero,

    ).animate(

      CurvedAnimation(

        parent:_controller,

        curve:Interval(

          index*.15,

          (index*.15)+.4,

          curve:Curves.easeOut,

        ),

      ),

    );



    final fadeAnimation =
    Tween<double>(

      begin:0,

      end:1,

    ).animate(

      CurvedAnimation(

        parent:_controller,

        curve:Interval(

          index*.15,

          (index*.15)+.4,

          curve:Curves.easeOut,

        ),

      ),

    );



    return FadeTransition(

      opacity:fadeAnimation,


      child:SlideTransition(

        position:animation,


        child:Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[


            _TitleText(title),


            _BodyText(body),


          ],


        ),

      ),

    );


  }




  @override
  Widget build(BuildContext context){


    return CustomScaffold(

      title:"Privacy Policy",

useAppBarGradient: true,
      body:SingleChildScrollView(


        padding:
        const EdgeInsets.all(16),


        child:Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[



            buildAnimatedSection(

              index:0,

              title:"Your Privacy Matters",

              body:
              "We at RealtyConnect respect your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use and protect your information while using our property services.",

            ),





            buildAnimatedSection(

              index:1,

              title:"Information We Collect",

              body:
              "We may collect information such as your name, mobile number, email address, location details, property preferences, saved properties, enquiries and other information required to provide better real estate services.",

            ),





            buildAnimatedSection(

              index:2,

              title:"How We Use Your Information",

              body:
              "Your information helps us provide property recommendations, connect buyers with dealers/owners, manage property listings, improve user experience and provide customer support.",

            ),





            buildAnimatedSection(

              index:3,

              title:"Property Listings & User Information",

              body:
              "Users who list properties are responsible for providing accurate property details. RealtyConnect may display property information to help users discover and enquire about available properties.",

            ),





            buildAnimatedSection(

              index:4,

              title:"Location Information",

              body:
              "We may use location services to provide relevant property searches based on your preferred city, locality or nearby properties. Location access can be managed from your device settings.",

            ),





            buildAnimatedSection(

              index:5,

              title:"Third Party Services",

              body:
              "RealtyConnect may use trusted third-party services for analytics, notifications, payments or communication. These services may have their own privacy policies.",

            ),





            buildAnimatedSection(

              index:6,

              title:"Data Security",

              body:
              "We implement appropriate security measures to protect your personal information. However, no online platform can guarantee complete security of data.",

            ),





            buildAnimatedSection(

              index:7,

              title:"Your Rights",

              body:
              "You can update your profile information, manage your preferences and request assistance regarding your personal data by contacting our support team.",

            ),





            buildAnimatedSection(

              index:8,

              title:"Contact Us",

              body:
              "If you have any questions regarding this Privacy Policy, please contact RealtyConnect support team.",

            ),




            const SizedBox(height:30),


          ],


        ),


      ),


    );


  }

}






class _TitleText extends StatelessWidget {


  final String text;


  const _TitleText(this.text);



  @override
  Widget build(BuildContext context){


    return Padding(

      padding:
      const EdgeInsets.only(
        top:20,
        bottom:8,
      ),


      child:Text(

        text,

        style:
        context.textTheme.titleMedium?.copyWith(

          fontWeight:
          FontWeight.bold,

          color:
          AppColors.primary,

        ),

      ),

    );


  }

}






class _BodyText extends StatelessWidget {


  final String text;


  const _BodyText(this.text);



  @override
  Widget build(BuildContext context){


    return Text(

      text,

      style:
        TextStyle(

        fontSize:13,

        height:1.8,


      ),

    );


  }

}