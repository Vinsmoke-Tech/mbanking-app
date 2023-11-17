class AppConstans {
  static const String APP_NAME = "Mozaic Geprek New";
  static const String APP_VERSION = "2.0.1";
  static const String BASE_URL = "http://192.168.123.17:8000";

  // company end points
  static const String PREFERENCE_COMPANY = "/api/preference-company";
  static const String PHONE = "+6281226124600";

  // dio api client
  static const String API_CLIENT = "/api";

  // user auth end points
  static const String REGISTER = "/api/register-guest";
  static const String LOGIN = "/api/login";
  static const String LOGIN_STATE = "/api/login-state";
  static const String LOGOUT = "/api/logout";

  // sales end points
  static const String SALES_ADD = "/api/sales/add";
  static const String INSERT_SAVE_SALES = "/api/sales/save";
  static const String SALES_SAVED = "/api/sales/saved";
  static const String SALES_SAVED_PAY = "/api/sales/saved/pay";
  static const String SALES_PAID = "/api/sales-list-today/paid";
  static const String SALES_PAID_MENU = "/api/sales-list-today/paid/menu";
  static const String SALES_UNPAID = "/api/sales-list-today/unpaid";

  // category end points
  static const String ITEM = "/api/item";
  static const String ITEM_ADD = "/api/item/add";
  static const String ITEM_CATEGORY = "/api/item-category";
  static const String ITEM_CATEGORY_ADD = "/api/item-category/add";
  static const String ITEM_CATEGORY_NEW_MENU = "/api/item-new-menu";
  static const String ITEM_DETAIL = "/api/item-detail";
  static const String ITEM_UNIT = "/api/item-unit";
  static const String ITEM_UNIT_ADD = "/api/item-unit/add";
  static const String ITEM_UPDATE = "/api/item/update";
  static const String ITEM_ALL = "/api/item-all";

  // expenditure end points
  static const String EXPENDITURE = "/api/expenditure";
  static const String EXPENDITURE_GET_ACCOUNT = "/api/expenditure/get-account";
  static const String EXPENDITURE_TODAY = "/api/expenditure-today";

  // dashboard end points
  static const String DASHBOARD = "/api/dashboard";

  // profile end points
  static const String CHANGE_PASSWORD = "/api/change-password";
  static const String CAPITAL_MONEY = "/api/capital-money";

  // printer end points
  static const String PRINTER_ADDRESS = "/api/printer-address";
  static const String PRINTER_KITCHEN_ADDRESS = "/api/printer-kitchen-address";
  static const String PRINTER_UPDATE = '/api/printer-address/update';
  static const String PRINTER_KITCHEN_UPDATE =
      '/api/printer-kitchen-address/update';

  // printer actions end points
  static const String SALES_PRINT = "/api/sales/print";
  static const String EXPENDITURE_PRINT = "/api/expenditure/print";
  static const String DASHBOARD_PRINT = "/api/dashboard/print";
}
