import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:winx_app/components/player.dart';
import 'package:winx_app/components/collidable.dart';
import 'package:winx_app/helpers/map_loader.dart';
import 'package:winx_app/helpers/joypad.dart';
import 'package:winx_app/helpers/direction.dart';

class FriendExtension extends FlameGame with HasCollisionDetection {
  final Player player = Player();
  final Friend friend = Friend();

  @override
  Future<void> onLoad() async {
    final map = await TiledComponent.load('friendmap.tmx', Vector2.all(32.0));
    add(map);

    // Screen boundary
    add(ScreenHitbox());

    // PLAYER
    add(player);
    // PLAYER
    add(friend);
  }
}
