import 'package:capgemini/domain/blocs/gift/gift_bloc.dart';
import 'package:capgemini/domain/blocs/theme/theme.dart';
import 'package:capgemini/ui/pages/gifts/widgets/gift_list.dart';
import 'package:capgemini/ui/responsive.dart';
import 'package:capgemini/ui/widgets/change_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class GiftsPage extends StatefulWidget {
  const GiftsPage({super.key});
  static const String route = '/gifts';

  @override
  State<GiftsPage> createState() => _GiftsPageState();
}

class _GiftsPageState extends State<GiftsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GiftBloc>(context).add(const AddMoreGiftEvent());
    Future.delayed(Duration.zero, () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => context.read<ThemeCubit>().toggleTheme(),
            child: const Icon(Icons.brightness_6)),
        actions: const [ChangeLanguageWidget()],
      ),
      body: BlocBuilder<GiftBloc, GiftState>(
        builder: (context, state) {
          if (state is GiftLoaded) {
            if (Responsive.isMobile(context) || Responsive.isMobileLarge(context)) {
              return const GiftListMobile();
            } else {
              return const GiftListTablet(); 
            }
          } else if (state is GiftError) {
            return const Center(child: Text("Error"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
