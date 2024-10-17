import 'package:flutter/material.dart';

class TRatingAndShare extends StatelessWidget {
  final String placeName; // Add placeName as a parameter

  const TRatingAndShare({required this.placeName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container( // Provide a container with bounded width
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Use a Flexible or Expanded widget properly
          Expanded(
            child: Text(
              placeName,
              maxLines: 2, // Limit to 1 line
              overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16.0), // Adjust spacing if needed
          // Rating
          /*
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 24),
              const SizedBox(width: 8.0), // Adjust the size for spacing
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                    const TextSpan(text: ' (375)'),
                  ],
                ),
              ),
              // Share Button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, size: 24), // Adjust size as needed
              ),
            ],
          ),

           */
        ],
      ),
    );
  }
}



