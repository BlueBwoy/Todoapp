import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:todoapp/Home_view/utils.dart';

class Todo_tile_wedge extends StatelessWidget {
  const Todo_tile_wedge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SkeletonAnimation(
        shimmerColor: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        shimmerDuration: 1000,
        child: Card(
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: custColor(date: 'Tomorrow'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Trip to Finland'),
                      Text(
                        'the trip will lust for a week',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 16.0,
                      color: custColor(date: 'Tomorrow'),
                    ),
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                        color: custColor(date: 'Tomorrow'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
