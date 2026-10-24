import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/status/status.dart';
import 'package:weatherapp/features/home/presentation/cubit/notificationcubit.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  @override
   void initState(){
    super.initState();
    context.read<NotificationCubit>().loadNotification(city:'Tashkent');
   }
   bool isSelected =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child:BlocBuilder<NotificationCubit,NotificationState>(builder: (context, state) {
         final status=state.statusOf('notification');
         print('NOTIFICATION UI STATUS: ${state.statusOf('notification')}');
         if (status==Status.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
          
         }
         if (status==Status.error) {
          
           return Center(child: Text('yesjj'),);
         }
         if (status == Status.success) {
           return   InkWell(
                                onTap: () {
                                 
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            isSelected=!isSelected;
                                          });
                                        },
                                        child: Container(
                                          width:double.infinity,
                                          height: 300,
                                          color:isSelected ? Colors.black : Colors.white,
                                          child: Column(
                                            children: [
                                              Text('Your notification',style: TextStyle(color: Color(0xff444E72)),),
                                              Text('New'),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/svg/whitesun.svg',colorFilter:ColorFilter.mode(Color(0xff444E72),BlendMode.modulate),
                                                  ),
                                                  
                                                Column(
                                                  children: [
                                                    Text('10 minutes ago'),
                                                    SizedBox(
                                                      width: 254,
                                                      height: 24,
                                                      child: Text('A sunny day in your location, consider wearing your UV protection'),),
                                                    
                                                  ],
                                                ),
                                                  InkWell(child: SvgPicture.asset('assets/svg/down.svg'))
                                                ],
                                              ),
                                             Text('Earlier'),
                                            Row(
                                             
                                          
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/svg/whitesun.svg',
                                                ),
                                                
                                              Column(
                                                children: [
                                                  Text('1 day ago'),  
                                                
                                                  SizedBox(
                                                    width: 254,
                                                    height: 24,
                                                    child: Text('A sunny day in your location, consider wearing your UV protection'),)
                                                ],
                                              ),
                                                InkWell(child: SvgPicture.asset('assets/svg/down.svg'))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 220,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Forecast report',
                                      style: TextStyle(
                                        color: Color(0xff444E72),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SvgPicture.asset('assets/svg/top.svg'),
                                  ],
                                ),
                              ),
                            );
                                 
           };
         return SizedBox.shrink();
      },) )
    );
  }
}