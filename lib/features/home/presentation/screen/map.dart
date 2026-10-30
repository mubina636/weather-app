// import 'package:flutter/material.dart';
// import 'package:yandex_maps_mapkit/mapkit.dart';
// import 'package:yandex_maps_mapkit/yandex_map.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   MapWindow? mapWindow;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather Map'),
//       ),
//       // body: YandexMap(
//       //   onMapCreated: (MapWindow window) {
//       //     mapWindow = window;
//       //   },
//       // ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:weatherapp/features/home/presentation/screen/map_point.dart';
// import 'package:yandex_maps_mapkit/mapkit.dart';
// import 'package:yandex';
// import 'package:yandex_maps_mapkit/yandex_map.dart';

// class MapScreen extends StatefulWidget {
//  const MapScreen({super.key});

//  @override
//  State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late final YandexMapController _mapcontroller;

//  @override
//  void dispose() {
//    _mapcontroller.dispose();
//    super.dispose();
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: const Text('Yandex Mapkit Demo')),
//      body: YandexMap(
//        onMapCreated: (controller) async {
//          _mapcontroller = controller;
//          await _mapcontroller.moveCamera(
//            CameraUpdate.newCameraPosition(
//              const CameraPosition(
//                target: Point(
//                  latitude: 50,
//                  longitude: 20,

//                ),
//                zoom: 3,
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
// }
//  Future<void> _initLocationLayer() async {
//    final locationPermissionIsGranted =
//        await Permission.location.request().isGranted;

//    if (locationPermissionIsGranted) {
//      await _mapcontroller.toggleUserLayer(visible: true);
//    } else {
//      WidgetsBinding.instance.addPostFrameCallback((_) {
//        ScaffoldMessenger.of(context).showSnackBar(
//          const SnackBar(
//            content: Text('Нет доступа к местоположению пользователя'),
//          ),
//        );
//      });
//    }
//  }
//  List<MapPoint> _getMapPoints() {
//  return const [
//    MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
//    MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
//    MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
//    MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
//    MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
//  ];
// }

// import 'package:flutter/material.dart';
// import 'package:yandex_maps_mapkit/mapkit.dart';
// import 'package:yandex_maps_mapkit/yandex_map.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   MapWindow? _mapWindow;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Weather Map')),
//       body: YandexMap(
//         onMapCreated: (MapWindow window) {
//           _mapWindow = window;

//           window.map.move(
//             const CameraPosition(
//               Point(latitude: 41.2995, longitude: 69.2401),
//               zoom: 12,
//               azimuth: 0,
//               tilt: 0,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:yandex_maps_mapkit/mapkit.dart';
// import 'package:yandex_maps_mapkit/yandex_map.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   MapWindow? _mapWindow;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: YandexMap(
//         onMapCreated: (mapWindow) {
//           _mapWindow = mapWindow;
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapWindow? _mapWindow;

  void _onMapCreated(MapWindow mapWindow) {
    _mapWindow = mapWindow;

    // Set initial camera position to Tashkent
    mapWindow.map.move(
      const CameraPosition(
        Point(
          latitude: 41.2995,
          longitude: 69.2401,
        ),
        zoom: 12.0,
        azimuth: 0.0,
        tilt: 0.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Map'),
        centerTitle: true,
      ),
      body: YandexMap(
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
