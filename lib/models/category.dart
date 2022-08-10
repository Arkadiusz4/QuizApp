String path = 'assets/';

class Category {
  final int id;
  final String name;
  final String categoryImage;

  Category(this.id, this.name, {required this.categoryImage});
}

List<Category> categories = [
  Category(9, "General Knowledge",
      categoryImage: path + 'general_knowledge.jpg'),
  Category(10, "Books", categoryImage: path + 'books.jpg'),
  Category(11, "Film", categoryImage: path + 'film.jpg'),
  Category(12, "Music", categoryImage: path + 'music.jpg'),
  Category(13, "Musicals & Theatres",
      categoryImage: path + 'musicals_theatres.jpg'),
  Category(14, "Television", categoryImage: path + 'television.jpg'),
  Category(15, "Video Games", categoryImage: path + 'video_games.jpg'),
  Category(16, "Board Games", categoryImage: path + 'board_games.jpg'),
  Category(17, "Science & Nature", categoryImage: path + 'science_nature.jpg'),
  Category(18, "Computer", categoryImage: path + 'computer.jpg'),
  Category(19, "Maths", categoryImage: path + 'maths.jpg'),
  Category(20, "Mythology", categoryImage: path + 'mithology.jpg'),
  Category(21, "Sports", categoryImage: path + 'sports.jpg'),
  Category(22, "Geography", categoryImage: path + 'geography.jpg'),
  Category(23, "History", categoryImage: path + 'history.jpg'),
  Category(24, "Politics", categoryImage: path + 'politics.jpg'),
  Category(25, "Art", categoryImage: path + 'art.jpg'),
  Category(26, "Celebrities", categoryImage: path + 'celebrities.jpg'),
  Category(27, "Animals", categoryImage: path + 'animals.jpg'),
  Category(28, "Vehicles", categoryImage: path + 'vehicles.jpg'),
  Category(29, "Comics", categoryImage: path + 'comics.jpg'),
  Category(30, "Gadgets", categoryImage: path + 'gadgets.jpg'),
  Category(31, "Japanese Anime & Manga",
      categoryImage: path + 'japanese_anime.jpg'),
  Category(32, "Cartoon & Animation", categoryImage: path + 'cartoon.jpg'),
];
