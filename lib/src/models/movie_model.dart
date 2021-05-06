class Movies{
  List<Movie> items = [];
  Movies();

  Movies.fromJsonList( List<dynamic> jsonList){
    if (jsonList == null) return;

    for (var item in jsonList){
      final movie = Movie.fromJsonMap(item);
      items.add(movie);
    }
  }

}

class Movie {
  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  Movie.fromJsonMap( Map<String, dynamic> json){
    posterPath       = json['poster_path'];
    adult            = json['adult'];
    overview         = json['overview'];
    releaseDate      = json['release_date'];
    genreIds         = json['genre_ids'].cast<int>();
    id               = json['id'];//.cast<int>();
    originalTitle    = json['original_title'];
    originalLanguage = json['original_language'];
    title            = json['title'];
    backdropPath     = json['backdrop_path'];
    popularity       = json['popularity'] / 1;
    voteCount        = json['vote_count'];
    video            = json['video'];
    voteAverage      = json['vote_average'] / 1;
  }

  getPosterImg(){
    if (posterPath == null){
      return 'http://www.pallenz.co.nz/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png';
    }else{
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
  }

}
