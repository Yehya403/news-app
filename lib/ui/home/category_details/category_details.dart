import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/ui/home/sources/sources_tabs.dart';
import '../../../data/model/category.dart';
import 'category_details_view_model.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = getIt.get<CategoryDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var sourcesList = state.sourcesList;
              return SourcesTabs(sourcesList);
            }
          case LoadingState():
            {
              return Center(
                  child: Column(
                children: [
                  Text(state.message),
                  const CircularProgressIndicator(),
                ],
              ));
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.category.id);
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
