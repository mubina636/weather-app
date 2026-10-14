
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:weatherapp/core/status/status.dart';
import 'package:weatherapp/features/domain/entity/forecastentetity.dart';
import 'package:weatherapp/features/home/presentation/cubit/detailcubit.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _Detailscreen();
}

abstract class DetailScreenState extends State<Detailscreen> {
  late final DetailCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = context.read<DetailCubit>()
      ..loadForecast(city: 'Semarang');
  }
}

class _Detailscreen extends DetailScreenState {
  int selectedIndex = 2;
String monthName(int month) {
const months = [
'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

if (month < 1 || month > 12) {
return 'Unknown';
}

return months[month - 1];
}
  String getWeatherImage(String main) {
    switch (main.toLowerCase()) {
      case 'sunny':
        return 'assets/images/sun2.png';

      case 'clear':
        return 'assets/images/moon.png';

      case 'clouds':
        return 'assets/images/subblu.png';

      case 'rockstar':
        return 'assets/images/rockstar.png';

      default:
        return 'assets/images/cloudy.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          final status = state.statusOf('forecast');

          if (status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (status == Status.error) {
            return const Center(
              child: Text(
                'ERROR',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          if (status == Status.success) {
            final forecast = state.forecast!.items;

            final dailyForecast = <ForecastItemEntity>[];

            for (final item in forecast) {
              final alreadyExists = dailyForecast.any(
                (element) =>
                    element.dateTime.day == item.dateTime.day,
              );

              if (!alreadyExists) {
                dailyForecast.add(item);
              }

              if (dailyForecast.length == 5) {
                break;
              }
            }

            final hourlyCount =
                forecast.length < 5 ? forecast.length : 5;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff47BFDF),
                    Color(0xff4A91FF),
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          // Верхняя панель
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 20,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/left.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Back',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  'assets/svg/set.svg',
                                ),
                              ],
                            ),
                          ),

                        
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Today',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Sep,12',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                         
                          SizedBox(
                            height: 190,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: hourlyCount,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              itemBuilder: (context, index) {
                                final item = forecast[index];
                                final isSelected =
                                    selectedIndex == index;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    curve: Curves.easeInOut,
                                    width: isSelected ? 110 : 95,
                                    height: isSelected ? 165 : 145,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white.withValues(
                                              alpha: 0.25,
                                            )
                                          : Colors.white.withValues(
                                              alpha: 0.12,
                                            ),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.white24,
                                        width: isSelected ? 2 : 1,
                                      ),
                                      boxShadow: isSelected
                                          ? [
                                              BoxShadow(
                                                color: Colors.white
                                                    .withValues(
                                                  alpha: 0.25,
                                                ),
                                                blurRadius: 15,
                                                spreadRadius: 2,
                                              ),
                                            ]
                                          : [],
                                    ),

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '${item.temp.round()}°C',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight:
                                                  FontWeight.w600,
                                            ),
                                          ),
                                        ),

                                       
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset(
                                            getWeatherImage(item.main),
                                            fit: BoxFit.contain,
                                          ),
                                        ),

                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '${item.dateTime.hour.toString().padLeft(2, '0')}:00',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                         
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              right: 15,
                              left: 15,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Next Forecast',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/svg/calendar.svg',
                                ),
                              ],
                            ),
                          ),

                          
                          Expanded(
                            child: ListView.builder(
                              itemCount: dailyForecast.length,
                              itemBuilder: (context, index) {
                                final item = dailyForecast[index];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' ${monthName(item.dateTime.month)}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      SizedBox(
                                        width: 70,
                                        height: 60,
                                        child: Image.asset(
                                          getWeatherImage(item.main),
                                          fit: BoxFit.contain,
                                        ),
                                      ),

                                      Text(
                                        '${item.temp.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/whitesun.svg'),
                                SizedBox(width: 10,),
                                Text('AccuWeather',style: TextStyle(color:Colors.white, fontSize: 14 ,fontWeight: FontWeight.w400),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    
                    Positioned(
                      top: 80,
                      left: 0,
                      child: Image.asset(
                        'assets/images/krivo.png',
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 0,
                      child: Image.asset(
                        'assets/images/krivo2.png',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: Text(
              'INITIAL',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

