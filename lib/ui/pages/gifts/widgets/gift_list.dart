import 'package:capgemini/domain/blocs/gift/gift_bloc.dart';
import 'package:capgemini/ui/pages/gifts/widgets/gift_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftListMobile extends StatefulWidget {
  const GiftListMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<GiftListMobile> createState() => _GiftListMobileState();
}

class _GiftListMobileState extends State<GiftListMobile> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          BlocProvider.of<GiftBloc>(context).add(const AddMoreGiftEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocBuilder<GiftBloc, GiftState>(builder: (context, state) {
        return GridView.builder(
          controller: _controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width >= 380 ? (MediaQuery.of(context).size.width ~/ 380).toInt() : 1,
          ),
          itemCount: state is GiftLoaded ? state.gifts.length : 0,
          itemBuilder: ((context, index) => state is GiftLoaded
              ? GiftCardMobile(gift: state.gifts[index])
              : Container()),
        );
      });
    });
  }
}

class GiftListTablet extends StatefulWidget {
  const GiftListTablet({
    Key? key,
  }) : super(key: key);

  @override
  State<GiftListTablet> createState() => _GiftListTabletState();
}

class _GiftListTabletState extends State<GiftListTablet> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          BlocProvider.of<GiftBloc>(context).add(const AddMoreGiftEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocBuilder<GiftBloc, GiftState>(builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          controller: _controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width >= 600 ? (MediaQuery.of(context).size.width ~/ 600).toInt() : 1,
          ),
          itemCount: state is GiftLoaded ? state.gifts.length : 0,
          itemBuilder: ((context, index) => state is GiftLoaded
              ? GiftCardTablet(gift: state.gifts[index])
              : Container()),
        );
      });
    });
  }
}
