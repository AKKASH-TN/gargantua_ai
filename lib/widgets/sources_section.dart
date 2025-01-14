import 'package:flutter/material.dart';
import 'package:perplexity_app/services/chat_web_services.dart';
import 'package:perplexity_app/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  List searchResults = [
    {
      'title': 'Ind vs Aus Live Score 4th Test',
      'url':
          'https://www.cricbuzz.com/cricket-series/7745/india-tour-of-australia-2024-25/matches'
    },
    {
      'title': 'Ind vs Aus Live Score 4th Test',
      'url':
          'https://www.cricbuzz.com/cricket-series/7745/india-tour-of-australia-2024-25/matches'
    },
    {
      'title': 'Ind vs Aus Live Score 4th Test',
      'url':
          'https://www.cricbuzz.com/cricket-series/7745/india-tour-of-australia-2024-25/matches'
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        searchResults = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.source_outlined,
          color: Colors.white70,
        ),
        SizedBox(width: 8),
        Text(
          "Sources",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: searchResults.map((res) {
              return Container(
                width: 150,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      res['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      res['url'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
