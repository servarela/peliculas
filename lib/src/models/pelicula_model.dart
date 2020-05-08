class Peliculas {

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ) {
    
    if ( jsonList == null ) return;

    for ( var item in jsonList ) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add( pelicula );
    }

  }

}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap( Map<String, dynamic> json ) {
    voteCount        = json['vote_count'];
    id               = json['id'];
    video            = json['video'];
    voteAverage      = json['vote_average'] / 1;
    title            = json['title'];
    popularity       = json['popularity'] / 1;
    posterPath       = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle    = json['original_title'];
    genreIds         = json['genre_ids'].cast<int>();
    backdropPath     = json['backdrop_path'];
    adult            = json['adult'];
    overview         = json['overview'];
    releaseDate      = json['release_date'];
  }

  getPosterImg() {

    if(posterPath == null) {
      return 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAMFBMVEXz9PTa29zx8vLq6uvk5eXg4eLc3t7t7u/Y2dr19vbn6Oni4+Tj5eXp6eru7/Da3NwT/lyMAAADW0lEQVR4nO3a646cIBiAYTyh4K5z/3dbBVQ8jm63GT77Pn+aJrXxjQ4IqhQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACALdNT3afP4h8Z2vLatjpr8k+fy2/zF64oq6zJnMJ8+pR+TWizlQ5tnn1E4XxTbrXCC4e2/sJ9VTttnhZbONyUZvjB6azZb6vK1/DHp0/0J4a2MFLulTWZbm2d9//I3bWy5gvf9t0e3JR9W1UWuR90+n/dShpMp1lgbzQJN2XRhR/meIyVMpie35SZvykXbeG42pWnX2iK6uAH1+jK1t14U27l7jABhXbvurmb8rAtyIQMpvW1m3JLzmA63aOVvXDhZmIGU+Pq7J22cKC7v0sBhW766+6fqOmkDKblj+e1RsZQY4rhPMdFgqleR5P+BfqzKUcWN5s5XkfILVzMa48s9PNa2HF5ZqGLqk30l6cVxouEkJvf1qVcGA+mP54d84QLw8ktrqEKGxlXJV4YD6ZTYVfe0D+cJl0YLxLGQlMcLIj3NGXqhdEiYS68M4YmXxgtEraFpS0Pd2/EFEY7LuvCyi2GS+GF8Y7LqlBfew5IvtAPpu65bVU4ruC783En+cJ5ElwXjrswRvg1jBbBlwsrVWhBhfNz26pwfFqtN4FGGSWnMFoErwpfyo8/6/nCpZhcTqGaBtP1bKG7Ydd/M5T61eR0adMvdD8z99nBdsbX5XaqyMc9Dyum0EUMU8OVp7ZmXlz5MUpC4TSYXimso9Wjf6YVUDgNphcKl/v47oD0C/1gqi8VbvaOtYjCaRH8tnDznmKYMwQUugmv6d4X7nxAY7rkV8AqWgS/Kdx9D2MKCYXjIvi8sDo4Ok99JypaBO8UlvPkf/I/pF7oTzDbKRwe2/LKLw/zk23U5AvHRfC60Pqvg+p3gekXTmWLQj0+nxnVLh5lttIv/ApXLC60KvoE6vQKSij89oNptCOs3zQtJV84PrfNhTff7Kdf6IcaM29K3Xz9JKDQvwmOtt3uSb/Qp4XPL59ZGO/cP7OweHrhYuO+u/UC2L8FTr9QRYXtnRfAXpt+odG6tcV2a/SOtAvDpwlPLnT+h8IbXyjILCz+yqdP/4r788TyyyEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAzfwCESiaORYwGQwAAAABJRU5ErkJggg==';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }

  }

}
