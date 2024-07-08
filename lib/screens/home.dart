import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:age_estimator/api/age_estimator_api.dart';
import 'package:age_estimator/blocs/age_estimator_bloc.dart';
import 'package:age_estimator/models/person.dart';
import 'package:age_estimator/widgets/name_age_list.dart';
import 'package:age_estimator/widgets/name_input_field.dart';
import 'package:age_estimator/widgets/result_text.dart';
import 'package:age_estimator/widgets/shared/separator.dart';
import 'package:age_estimator/widgets/shared/styled_text.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  bool hasNewItem = false;

  void _handleNameSubmission(BuildContext context) {
    final String name = nameController.text.trim();
    if (name.isNotEmpty) {
      BlocProvider.of<AgeEstimatorBloc>(context).add(GetAgeEstimateEvent(name));
      setState(() {
        hasNewItem = true;
      });
    } else {
      _showSnackbar(context, "Please enter a valid name.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgeEstimatorBloc(api: AgeEstimatorApi()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Age Estimator ☕️')),
        body: BlocConsumer<AgeEstimatorBloc, AgeEstimatorState>(
          listener: _listener,
          builder: _buildBody,
        ),
      ),
    );
  }

  void _listener(BuildContext context, AgeEstimatorState state) {
    if (state is AgeEstimatorError) {
      _showSnackbar(
          context, "Uh oh. '${nameController.text}' is unknown to us 🤔.");
      nameController.clear();
    }
    if (state is AgeEstimatorLoaded) {
      nameController.clear();
      setState(() {
        hasNewItem = true;
      });
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildBody(BuildContext context, AgeEstimatorState state) {
    List<Person> persons = state is AgeEstimatorLoaded ||
            state is AgeEstimatorError ||
            state is AgeEstimatorInitial ||
            (state is AgeEstimatorLoading && state.isNewItemLoading)
        ? (state as dynamic).persons
        : [];

    bool isLoadingNewItem =
        state is AgeEstimatorLoading && state.isNewItemLoading;

    return _buildResults(context, isLoadingNewItem, persons);
  }

  Container _buildResults(
      BuildContext context, bool isLoadingNewItem, List<Person> persons) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const StyledMediumText('Estimate the Age of a Name'),
          const Separator(SizeOption.medium),
          NameInputField(
            nameController: nameController,
            onSubmitted: () => _handleNameSubmission(context),
          ),
          if (isLoadingNewItem) ...[
            const Separator(SizeOption.medium),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          ],
          const Separator(SizeOption.medium),
          if (hasNewItem && persons.isNotEmpty && !isLoadingNewItem) ...[
            ResultText(persons: persons),
            const Separator(SizeOption.medium),
          ],
          if (persons.isNotEmpty) ...[
            Container(
              alignment: Alignment.centerLeft,
              child: const StyledSmallText("Previous Names:"),
            ),
          ],
          const Separator(SizeOption.small),
          Expanded(
            child: NameAgeList(
              people: persons,
              hideFirstItem: hasNewItem,
              onRemove: (person) => BlocProvider.of<AgeEstimatorBloc>(context)
                  .add(DeletePersonEvent(person)),
            ),
          ),
        ],
      ),
    );
  }
}
