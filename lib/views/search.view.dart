import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/utils/utils.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';
import 'package:where_to_go/views/widgets/widgets.dart';

class SearchView extends StatefulWidget {
  final List<Friend> friends;
  
  const SearchView({
    super.key,
    required this.friends
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _searchTextEditingController;
  late TextEditingController _radiusTextEditingController;
  late TextEditingController _preferencesTextEditingController;

  @override
  void initState() {
    _searchTextEditingController = TextEditingController();
    _radiusTextEditingController = TextEditingController();
    _preferencesTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    _radiusTextEditingController.dispose();
    _preferencesTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<SearchViewViewModel>.reactive(
      viewModelBuilder: () => SearchViewViewModel(), 
      builder: (context, viewModel, child) => Container(
        color: ColorConstants.primaryGrey,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            Header(
              color: ColorConstants.primaryColor, 
              fontStyle: FontStyle.normal, 
              fontWeight: FontWeight.w700, 
              text: '¿A donde vamos?', 
              width: size.width
            ),
            GapsContants.extraLargeVerticalGap,
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: SufixInput(
                controller: _searchTextEditingController, 
                labelText: 'Buscar', 
                width: size.width,
                obscureText: false,
                validator: TextFormFieldValidators.validateQuery,
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  await viewModel.onSearch(friends: widget.friends, query: _searchTextEditingController.text);
                },
                icon: Icons.search_outlined
              ),
            ),
            GapsContants.mediumVerticalGap,
            SearchViewFilters(
              friends: widget.friends,
              onShowFilter: () => viewModel.onShowFilters(),
              onTogleFilters: () => viewModel.onTogleFilters(),
              applyFilters: () => viewModel.applyFilters(
                int.parse(_radiusTextEditingController.text),
                widget.friends,
                _searchTextEditingController.text,
                _preferencesTextEditingController.text.split(" ").toList()
              ),
              showFilters: viewModel.showFilters,
              toggleFilters: viewModel.toggleFilters,
              radiusTextEditingController: _radiusTextEditingController,
              preferencesTextEditingController: _preferencesTextEditingController,
              radius: viewModel.radius
            ),
            GapsContants.mediumVerticalGap,
            Expanded(
              flex: 1,
              child: viewModel.isBusy ? 
              SimpleLoader(width: size.width * .9, height: size.height * .5) :
              ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  child: PlaceListTile(place: viewModel.places[index]),
                  onTap: () async => viewModel.onOpenPlaceInMap(
                    viewModel.places[index].placeId
                  )
                ), 
                separatorBuilder: (context, index) => GapsContants.smallVerticalGap, 
                itemCount: viewModel.places.length
              )
            )
          ]
        )
      )
    );
  }
}