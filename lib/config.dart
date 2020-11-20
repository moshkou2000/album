const int COLUMNS_PORTRAT = 2;
const int COLUMNS_LANDSCAPE = 5;

const String URL_TOKENLESS_PORTRAT =
    "https://jsonplaceholder.typicode.com/photos?albumId=1";
const String URL_TOKENLESS_LANDSCAPE =
    "https://jsonplaceholder.typicode.com/photos?albumId=2";

class Config {
  static String urlGetAlbum = URL_TOKENLESS_PORTRAT;
  static int noColumnsAlbum = COLUMNS_PORTRAT;
}
