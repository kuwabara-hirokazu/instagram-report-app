import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_report_app/presentation/component/cached_manager.dart';

class MediaThumbnail extends ConsumerWidget {
  const MediaThumbnail({
    super.key,
    required this.imageUrl,
    this.padding = const EdgeInsets.all(8.0),
    this.cacheManager,
  });

  final String imageUrl;
  final EdgeInsets padding;
  final CacheManager? cacheManager;

  static const radius = 8.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          cacheManager: cacheManager ?? ref.watch(defaultCacheManagerProvider),
        ),
      ),
    );
  }
}
