import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/components/view_all_btn.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/discover_screen/delivery_details/delivery_details_card.dart';
import 'package:internship_project_1/screens/discover_screen/discover_items_list/item_list.dart';
import 'package:internship_project_1/screens/discover_screen/discover_screen_titles.dart';
import 'package:internship_project_1/screens/discover_screen/blog_list/blog_list.dart';
import 'package:internship_project_1/screens/discover_screen/proposition/discover_proposition.dart';
import 'package:internship_project_1/screens/discover_screen/recipe_list/recipe_list.dart';
import 'package:internship_project_1/screens/login_screen/login_card.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_bloc.dart';
import 'package:internship_project_1/screens/recipes/services/recipe_api_client.dart';

class DiscoverScreen extends StatefulWidget {
  static const String id = 'discover_screen';

  final Function onClick;

  DiscoverScreen({this.onClick});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final UserRepository userRepository = UserRepository();

  final recipeClient = RecipeClient();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeBloc>(
      create: (context) => RecipeBloc(recipeClient),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DiscoverProposition(),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationFailure) {
                      return LogInCard(userRepository: userRepository);
                    }
                    if (state is AuthenticationSuccess) {
                      return DeliveryDetailsCard();
                    }
                    return SizedBox();
                  },
                ),
                DiscoverScreenTitles(title: S.of(context).newToTheShop),
                ItemListView(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiscoverScreenTitles(
                        title: S.of(context).recipesScreenAppBarTitle),
                    ViewAllBtn(onClick: widget.onClick),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: DiscoverRecipeListView()),
                DiscoverScreenTitles(title: S.of(context).blogDiscoverTitle),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: BlogListView()),
                DiscoverScreenTitles(title: S.of(context).simpleSuppers),
                ItemListView(),
                DiscoverScreenTitles(title: S.of(context).bestOfTheSeasons),
                ItemListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
