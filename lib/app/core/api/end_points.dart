class EndPoints {
  // static const String baseUrl = 'https://livre.softwarecloud2.com/';
  static const String baseUrl = 'https://portal.livre-tickets.com/';
  static const String paymentBaseUrl = 'fahim.softwarecloud2.com';
  static const String apiKey =
      'opHqBzHqDukBFxdpY4g63K3S54dWD17ySlzBlAPqh1gj2DB0Vg3km7F09R17wK7Y';
  static const String register = 'api/v1/client/register';
  static const String login = 'api/v1/client/login';
  static const String confirmMail = 'api/v1/user/confirmEmail';
  static const String forgetPassword = 'api/v1/client/passwordReset';
  static const String restPasswordConfirm = 'api/v1/client/passwordResetConfirm';
  static const String resendConfirmationCode =
      'api/v1/user/sendEmailConfirmation';
  static const String getSlider =
      'api/v1/slider/slider';



  static const String updatePassword = 'api/v1/client/updatePassword';
  static const String publicLessons = 'api/v1/events/categories';
  static const String todaySchedule = 'api/v1/schedule/todaysSchedule';
  static const String getPaidLessons = 'api/v1/payment/payments';
  static const String getReversedLessons = 'api/v1/reservation/reservations';
  static const String eventByCategory = 'api/v1/events/category';
  static const String eventByCities = 'api/v1/events/cities';
  static const String eventByCitiesCategory = 'api/v1/events/CategoryCities/';
  static const String getProfileInfo = 'api/v1/client/profile';
  static const String getCategories= 'api/v1/events/categories';
  static const String getFeaturedEventUrl= 'api/v1/events/featured';
  static const String updateProfileInfo =
      'api/v1/client/update/profile';
  static const String getNotification = 'api/v1/notification/notification';
  static const String makeAsRaed = '/api/v1/notification/read';
  static const String getWishListInfo = '/api/v1/favorite/favorites';
  static const String addRemoveWishListInfo = 'api/v1/favorite/favorite';
  static const String feedBack = 'api/v1/feedback/feedback';
  static const String chatList = 'api/v1/conversation/conversations';
  static const String startNewChat = 'api/v1/conversation/saveConversation';
  static const String makeAsRead = 'api/v1/conversation/read_conversation';
  static const String sendNotiForInstructor =
      'api/v1/conversation/send_notification';

  static const String reserveTripURL = 'api/v1/reservation/reserve';
  static const String getReservedTripURL = 'api/v1/reservation/reservations';
  static const String search = 'api/v1/events/search';
  static const String searchFilters = 'api/v1/filter/filters';
  static const String partnerUri = 'api/v1/partner/send';
  static const String settings = 'api/v1/setting/setting';
  static const String couponURl = 'api/v1/coupon/check';
  static const String citiesURl = 'api/v1/data/cities';
  static const String sendSupportMassage = 'api/v1/support/sendMessage/1';
  static const String startNewTicket = 'api/v1/support/sendMessage/0';
  static const String sendTicketMassage = 'api/v1/support/sendMessage';
  static const String showReplies = 'api/v1/support/support';
  static const String getTickets = 'api/v1/support/index';
}
