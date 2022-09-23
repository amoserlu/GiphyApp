import 'package:capgemini/data/models/gifts.dart';
import 'package:capgemini/ui/pages/gifts/widgets/gift_card.dart';
import 'package:capgemini/ui/pages/giftsDetails/widgets/card_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('CardTitlte works.', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MaterialApp(home:  CardTitleSubtitle(title:  'T', subtitle: 'M',)));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');


    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

    testWidgets('GiftCardTitlte works.', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(home:  GiftCardMobile(gift: Gift(title: "testTitle",liked: true,username: "usernameTest",id: "testId",images: Images(fixed_height_downsampled: ImageFile(url: "https://picsum.photos/200/300"))),)));

    final messageFinder = find.text('testTitle');


    expect(messageFinder, findsOneWidget);
  });
}

