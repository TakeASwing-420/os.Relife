import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapScreen extends StatefulWidget {
  final LatLng initialCenter;

  MapScreen({Key? key, required this.initialCenter}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isLoading = false;
  List listOfPoints = [];
  List<LatLng> points = [];
  List<Marker> markers = [];

  Marker dynamicMarker = Marker(
    width: 80,
    height: 80,
    point: LatLng(0, 0),
    child: Icon(
      Icons.location_on,
      color: Colors.orange,
      size: 45,
    ),
  );

  @override
  void initState() {
    super.initState();
    subscribeToPositionStream();
  }

  void subscribeToPositionStream() {
    // Define a periodic timer
    Timer.periodic(Duration(milliseconds: 1500), (timer) {
      // Inside the timer callback, perform the position stream subscription
      Geolocator.getPositionStream().listen((Position? position) {
        if (position != null) {
          setState(() {
            dynamicMarker = Marker(
              width: 80,
              height: 80,
              point: LatLng(position.latitude, position.longitude),
              child: Draggable(
                feedback: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  color: Colors.orange,
                  iconSize: 45,
                ),
                childWhenDragging: const SizedBox(),
                onDragEnd: (details) {
                  // Handle drag end
                  print(
                      "Latitude: ${dynamicMarker.point.latitude}, Longitude: ${dynamicMarker.point.longitude}");
                },
                child: IconButton(
                  tooltip: "You are here",
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  color: Colors.orange,
                  iconSize: 45,
                ),
              ),
            );
            if (markers.isEmpty)
              markers.add(dynamicMarker);
            else
              markers[0] = dynamicMarker;
          });
        }
      });
    });
  }

  Future<void> getCoordinates(LatLng lat1, LatLng lat2) async {
    setState(() {
      isLoading = true;
    });
    String apikey = dotenv.env['API_KEY'] ?? "";
    final OpenRouteService client = OpenRouteService(
      apiKey: apikey,
    );

    final List<ORSCoordinate> routeCoordinates =
        await client.directionsRouteCoordsGet(
      startCoordinate:
          ORSCoordinate(latitude: lat1.latitude, longitude: lat1.longitude),
      endCoordinate:
          ORSCoordinate(latitude: lat2.latitude, longitude: lat2.longitude),
    );

    final List<LatLng> routePoints = routeCoordinates
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();

    setState(() {
      points = routePoints;
      isLoading = false;
    });
  }

  final MapController mapController = MapController();

  void _handleTap(LatLng latLng) {
    setState(() {
      if (markers.length == 3) {
        markers.removeAt(2);
        markers.removeAt(1);
        points = [];
      } else if (markers.length < 3) {
        markers.add(
          Marker(
            point: latLng,
            width: 80,
            height: 80,
            child: Draggable(
              feedback: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45,
              ),
              onDragEnd: (details) {
                setState(() {
                  print(
                      "Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
                });
              },
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45,
              ),
            ),
          ),
        );
      }

      if (markers.length == 2) {
        double zoomLevel = 16.5;
        mapController.move(latLng, zoomLevel);
      }

      if (markers.length == 3) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            isLoading = true;
          });
        });

        getCoordinates(markers[1].point, markers[2].point);

        LatLngBounds bounds = LatLngBounds.fromPoints(
            markers.map((marker) => marker.point).toList());

        mapController.fitBounds(bounds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: widget.initialCenter,
              initialZoom: 15,
              onTap: (tapPosition, latLng) => _handleTap(latLng),
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                markers: markers,
              ),
              PolylineLayer(
                polylineCulling: false,
                polylines: [
                  Polyline(
                    points: points,
                    color: Color.fromARGB(255, 68, 124, 5),
                    strokeWidth: 3,
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        children: [
          const SizedBox(height: 210),
          FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {
              mapController.move(mapController.center, mapController.zoom + 1);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {
              mapController.move(mapController.center, mapController.zoom - 1);
            },
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
