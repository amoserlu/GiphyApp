import 'package:capgemini/data/models/gifts.dart';
import 'package:capgemini/domain/blocs/gift/gift_bloc.dart';
import 'package:capgemini/l10n/generated/l10n.dart';
import 'package:capgemini/ui/pages/giftsDetails/gifts_details_page.dart';
import 'package:capgemini/ui/pages/giftsDetails/widgets/card_title_subtitle.dart';
import 'package:capgemini/ui/widgets/image_loader.dart';
import 'package:capgemini/ui/widgets/liked_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftCardMobile extends StatefulWidget {
  const GiftCardMobile({Key? key, required this.gift}) : super(key: key);
  final Gift gift;

  @override
  State<GiftCardMobile> createState() => _GiftCardMobileState();
}

class _GiftCardMobileState extends State<GiftCardMobile> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
        child: Card(
          semanticContainer: true,
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GiftsDetailsPage(gift: widget.gift),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Hero(
                    tag: "${widget.gift.id!}image",
                    child: SizedBox(
                      height: 275,
                      width: 275,
                      child: ImageLoader(
                          url: widget
                              .gift.images!.fixed_height_downsampled!.url!),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Hero(
                            tag: "${widget.gift.id!}title",
                            child: Text(
                              widget.gift.title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    IconButton(
                        onPressed: () => BlocProvider.of<GiftBloc>(context).add(
                            LikedGiftEvent(
                                widget.gift.id!,
                                widget.gift.liked ?? false,
                                widget.gift.images!.fixed_height_downsampled!
                                    .url!)),
                        icon: Hero(
                            tag: "${widget.gift.id!}icon",
                            child: LikedIcon(liked: widget.gift.liked)))
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class GiftCardTablet extends StatefulWidget {
  const GiftCardTablet({Key? key, required this.gift}) : super(key: key);
  final Gift gift;

  @override
  State<GiftCardTablet> createState() => _GiftCardTabletState();
}

class _GiftCardTabletState extends State<GiftCardTablet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550, maxHeight: 400),
        child: Card(
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GiftsDetailsPage(gift: widget.gift),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Hero(
                          tag: "${widget.gift.id!}image",
                          child: SizedBox(
                            height: 275,
                            width: 275,
                            child: ImageLoader(
                                url: widget.gift.images!
                                    .fixed_height_downsampled!.url!),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Hero(
                                  tag: "${widget.gift.id!}title",
                                  child: Text(
                                    widget.gift.title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ))),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<GiftBloc>(context).add(
                                      LikedGiftEvent(
                                          widget.gift.id!,
                                          widget.gift.liked ?? false,
                                          widget.gift.images!
                                              .fixed_height_downsampled!.url!)),
                              icon: Hero(
                                  tag: "${widget.gift.id!}icon",
                                  child: LikedIcon(liked: widget.gift.liked)))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 250),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
