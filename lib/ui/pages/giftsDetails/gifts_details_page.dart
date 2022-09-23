import 'package:capgemini/data/models/gifts.dart';
import 'package:capgemini/domain/blocs/gift/gift_bloc.dart';
import 'package:capgemini/l10n/generated/l10n.dart';
import 'package:capgemini/ui/pages/giftsDetails/widgets/card_title_subtitle.dart';
import 'package:capgemini/ui/responsive.dart';
import 'package:capgemini/ui/widgets/image_loader.dart';
import 'package:capgemini/ui/widgets/liked_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftsDetailsPage extends StatefulWidget {
  const GiftsDetailsPage({super.key, required this.gift});
  final Gift gift;
  static const String route = '/details';

  @override
  State<GiftsDetailsPage> createState() => _GiftsDetailsPageState();
}

class _GiftsDetailsPageState extends State<GiftsDetailsPage> {
  late List<Gift> gifts;
  int columns = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Responsive.isMobile(context) ? columns = 1 : columns = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30,0,0,0),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          const Spacer(),
          BlocBuilder<GiftBloc, GiftState>(builder: (context, state) {
            return FloatingActionButton(
                heroTag: null,
                onPressed: () => BlocProvider.of<GiftBloc>(context).add(
                    LikedGiftEvent(widget.gift.id!, widget.gift.liked ?? false,
                        widget.gift.images!.fixed_height_downsampled!.url!)),
                child: Hero(
                    tag: "${widget.gift.id!}icon",
                    child: LikedIcon(liked: widget.gift.liked)));
          })
        ]),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: "${widget.gift.id!}image",
                          child: ImageLoader(
                              url: widget
                                  .gift.images!.fixed_height_downsampled!.url!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.gift.title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  widget.gift.username! != ""
                      ? Hero(
                          tag: "${widget.gift.id!}username",
                        child: CardTitleSubtitle(
                            title: Language.of(context).createdBy,
                            subtitle: widget.gift.username!,
                          ),
                      )
                      : Container(),
                  widget.gift.source_tld! != ""
                      ? Hero(
                        tag: "${widget.gift.id!}source",
                        child: CardTitleSubtitle(
                            title: Language.of(context).source,
                            subtitle: widget.gift.source_tld!,
                          ),
                      )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
