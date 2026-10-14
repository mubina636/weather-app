// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:weatherapp/core/status/status.dart';
// import 'package:weatherapp/features/home/presentation/cubit/homecubit.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }
//  class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   late final HomeCubit cubit;

//   @override
//   void initState() {
//     super.initState();

//     cubit = context.read<HomeCubit>()
//       ..loadCurrentWeather(city: 'Semarang');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           final status = state.currentWeatherStatus;
//           print('status:$status');
//           if (status == Status.loading) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (status == Status.error) {
//             return Text('data');
//           }
//           if (status == Status.success) {
//             return Container(
//               width: 500,
//               height: 500,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xff47BFDF), Color(0xff4A91FF)],
//                 ),
//               ),
//               child: Scaffold(
//                 backgroundColor: Colors.transparent, // ← вот это
//                 body: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 45,
//                                 vertical: 20,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset('assets/svg/map.svg'),
//                                       SizedBox(width: 15),
//                                       Text(
//                                         'Semarang',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.w700,
//                                         ),
//                                       ),
//                                       SizedBox(width: 15),
//                                       InkWell(
//                                         onTap: () {},

//                                         child: SvgPicture.asset(
//                                           'assets/svg/vnizctrelka.svg',
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   SvgPicture.asset('assets/svg/notif.svg'),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsetsGeometry.only(
//                                 top: 50,
//                                 right: 40,
//                               ),
//                               child: Image.asset('assets/images/sunbulit.png'),
//                             ),
//                             SizedBox(height: 76),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withValues(alpha: (0.18)),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: BoxBorder.all(
//                                   width: 2,
//                                   color: Colors.white24,
//                                 ),
//                               ),
//                               width: 350,
//                               height: 335,
//                               child: Column(
//                                 children: [
//                                   SizedBox(height: 20),
//                                   Text(
//                                     'Today, 12 September',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,

//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           right: 10,
//                                         ),
//                                         child: Text(
//                                           '29',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 80,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     'Cloudy',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),

//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset('assets/svg/windy.svg'),
//                                       SizedBox(width: 10),
//                                       Text(
//                                         'Wind',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,

//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       SizedBox(width: 25),
//                                       Container(
//                                         color: Colors.white,
//                                         width: 2,
//                                         height: 21,
//                                       ),
//                                       SizedBox(width: 15),
//                                       Text(
//                                         '10km/h',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,

//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 10),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset('assets/svg/drop.svg'),
//                                       SizedBox(width: 15),
//                                       Text(
//                                         'Hum',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,

//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       SizedBox(width: 20),
//                                       Container(
//                                         color: Colors.white,
//                                         width: 2,
//                                         height: 21,
//                                       ),
//                                       SizedBox(width: 24),
//                                       Text(
//                                         '54%',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,

//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       SizedBox(width: 20),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 50),
//                             InkWell(
//                               child: Container(
//                                 width: 220,
//                                 height: 64,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.white,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'Forecast report',
//                                       style: TextStyle(
//                                         color: Color(0xff444E72),
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                     SizedBox(width: 10),
//                                     SvgPicture.asset('assets/svg/top.svg'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       Positioned(
//                         top: 60,
//                         child: Image.asset('assets/images/krivo.png'),
//                       ),
//                       Positioned(
//                         right: 0,
//                         child: Image.asset('assets/images/krivo2.png'),
//                       ),

//                       Positioned(
//                         top: 330,
//                         right: 90,
//                         child: SvgPicture.asset('assets/svg/tochka.svg'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/status/status.dart';
import 'package:weatherapp/features/home/presentation/cubit/homecubit.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late final HomeCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = context.read<HomeCubit>()..loadCurrentWeather(city: 'Semarang');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
         final status =state.statusof('currentWeather');
          final weather = state.weather;
          final now =DateTime.now();
          String _monthName(int month) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  return months[month - 1];
}

          print('status: $status');

          if (status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (status == Status.error) {
            return const Center(child: Text('ERROR'));
          }

          if (status == Status.success) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff47BFDF), Color(0xff4A91FF)],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 45,
                                vertical: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/map.svg'),
                                      const SizedBox(width: 15),
                                      const Text(
                                        'Semarang',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          'assets/svg/vnizctrelka.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset('assets/svg/notif.svg'),
                                ],
                              ),
                            ),

                             Padding(
                               padding: const EdgeInsets.only(top:100,right: 40),
                               child: Image.asset('assets/images/sunbulit.png'),
                             ),
                        

                           SizedBox(height: 100,),

                            Container(
                              width: 350,
                              height: 335,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white24,
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),

                                   Text(
                                    ' Today,${DateTime.now().day} ${_monthName(DateTime.now().month)}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // Температура
                                  Text(
                                  '${weather?.temp.round()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 80,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                 Text(
                                   weather?.main ??'' ,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/svg/windy.svg'),
                                      SizedBox(width: 10),
                                      Text(
                                        'Wind',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,

                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 25),
                                      Container(
                                        color: Colors.white,
                                        width: 2,
                                        height: 21,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                       '${((weather?.speed ?? 0)*3.6).toStringAsFixed(1)}km/h',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,

                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/svg/drop.svg'),
                                      SizedBox(width: 15),
                                      Text(
                                        'Hum',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,

                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        color: Colors.white,
                                        width: 2,
                                        height: 21,
                                      ),
                                      SizedBox(width: 24),
                                      Text(
                                       '${weather?.humidity ?? 0}%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,

                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 50),

                            InkWell(
                              onTap: () {
                                // context.push('/notification');
                                showBottomSheet(context: context, builder: (context) {
                                  return Container(color: Colors.amber,);
                                },);
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
                            ),

                            const SizedBox(height: 50),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 80,
                        left: 0,
                        child: Image.asset('assets/images/krivo.png'),
                      ),

                      Positioned(
                        top: 50,
                        right: 0,
                        child: Image.asset('assets/images/krivo2.png'),
                      ),

                      Positioned(
                        top: 450,
                        right: 100,
                        child: SvgPicture.asset('assets/svg/tochka.svg',width: 40,height: 91,),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const Center(child: Text('INITIAL'));
        },
      ),
    );
  }
}
