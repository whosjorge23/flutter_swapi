class ImagesService {
  String getImageCharacter(int index) {
    return index >= 16
        ?
        "https://starwars-visualguide.com/assets/img/characters/${index + 2}.jpg"
        :
        "https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg";
  }
}