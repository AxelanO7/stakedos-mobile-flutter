class ListConfig{
  static Map<String, bool> _configList = {
    //Global Features
    "is_debug_mode": true,
    "is_local_server": false,
    "log_api_response": true,
    "is_beta": true,

    //UI Features
    "feature_dark_mode": false,


    //Profile Option
    "show_faq": false,
    "show_change_password": false,

    //<per_page> Features
    "feature_example": false,
  };

  static Map<String, bool> get getConfigList {
    return _configList;
  }

}