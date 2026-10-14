import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
           return  ElevatedButton(onPressed: (){
        showBottomSheet(context: context, builder: (context) {
          return Container(
            color: Colors.amber,
            width: double.infinity,
            child: Column(
              children: [
                 Text('Your Notification'),
                 Text('New')
              ],
            ),
          );
        },);
           }, child: Text('data'),style:ElevatedButton.styleFrom(backgroundColor: Colors.white),);
         }
         return SizedBox.shrink();
      },) )
    );
  }
}