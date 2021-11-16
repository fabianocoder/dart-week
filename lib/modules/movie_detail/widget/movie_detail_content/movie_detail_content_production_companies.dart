import 'package:dartweek/models/movie_detail_model.dart';
import 'package:dartweek/modules/movie_detail/widget/movie_detail_content/movie_detail_content.dart';
import 'package:flutter/widgets.dart';

class MovieDetailContentProductionCompanies extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentProductionCompanies({Key? key, required this.movie})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 5,
        ),
        child: RichText(
          text: TextSpan(
              text: "Compania(s) produtora(s): ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff222222),
              ),
              children: [
                TextSpan(
                    text: movie?.productionCompanies.join(', ') ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff222222),
                    ))
              ]),
        ),
      ),
    );
  }
}
