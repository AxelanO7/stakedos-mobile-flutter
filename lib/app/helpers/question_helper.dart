class QuestionHelper {
  static getCategoryLogo(String category) {
    switch (category.toLowerCase().replaceAll(" ", "-")) {
      case "twk":
        return "assets/icons/uka/twk-category.svg";
      case "tiu":
        return "assets/icons/uka/tiu-category.svg";
      case "tkp":
        return "assets/icons/uka/tkp-category.svg";
      case "potensi_kognitif":
        return "assets/icons/uka/potensi_kognitif-category.svg";
      case "penalaran_matematika":
        return "assets/icons/uka/penalaran_matematika-category.svg";
      case "literasi_bahasa_indonesia":
        return "assets/icons/uka/literasi_bahasa_indonesia-category.svg";
      case "literasi_bahasa_inggris":
        return "assets/icons/uka/literasi_bahasa_inggris-category.svg";
      default:
        return "assets/icons/uka/toga.svg";
    }
  }

  static String getUkaCategoryTitle(String categoryTitle) {
    String title = categoryTitle;
    switch (categoryTitle) {
      case 'twk':
        title = 'TWK';
        break;
      case 'tiu':
        title = 'TIU';
        break;
      case 'tkp':
        title = 'TKP';
        break;
      case 'potensi_kognitif':
        title = 'Potensi Kognitif';
        break;
      case 'penalaran_matematika':
        title = 'Penalaran Matematika';
        break;
      case 'literasi_bahasa_indonesia':
        title = 'Literasi Bahasa Indonesia';
        break;
      case 'literasi_bahasa_inggris':
        title = 'Literasi Bahasa Inggris';
        break;
      default:
        title = categoryTitle;
    }
    return title;
  }
}
