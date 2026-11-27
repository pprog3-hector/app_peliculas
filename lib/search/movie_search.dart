import 'package:material_ui/material_ui.dart';

class MovieSearch extends SearchDelegate {

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar una peli';

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(color: Colors.white);

  @override
  List<Widget>? buildActions(Object context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () => query = '',
         icon: Icon(Icons.clear_rounded)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () => Navigator.pop(context), 
      icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }

}