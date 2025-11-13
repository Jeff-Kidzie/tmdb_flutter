import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_flutter/feature/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Now Playing')),
      body: Center(
        child: controller.obx(
          (posterUrl) {
            if (posterUrl == null || posterUrl.isEmpty) {
              return const Text('No poster available');
            }
            return CachedNetworkImage(
              imageUrl: posterUrl,
              width: 150,
              height: 200,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
          onLoading: const CircularProgressIndicator(),
          onError: (error) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
