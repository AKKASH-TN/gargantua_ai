import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_app/services/chat_web_services.dart';
import 'package:perplexity_app/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
As of January 13, 2025, the most recent match between India and Australia was the fifth Test, which concluded on January 5, 2025. In that match:

- **Australia's Scores**:
  - First Innings: 181 all out
  - Second Innings: 162 for 4 (target of 163 runs)

- **India's Scores**:
  - First Innings: 185 all out
  - Second Innings: 157 all out

Australia won the match by **6 wickets**, thereby clinching the series with a final score of **3-1** in favor of Australia[3].

Citations:
[1] https://sports.ndtv.com/cricket/ind-vs-aus-scorecard-live-cricket-score-australia-in-india-3-t20-international-series-2017-1st-t20i-inau10072017184286
[2] https://sports.ndtv.com/cricket/ind-vs-aus-scorecard-live-cricket-score-australia-in-india-3-odi-series-2020-2nd-odi-inau01172020190941
[3] https://www.business-standard.com/cricket/news/india-vs-australia-live-cricket-score-5th-test-streaming-full-scorecard-ind-vs-aus-day-3-highlights-125010400473_1.html''';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gargantua',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
