class Constants {

  Constants._();
  static Constants? instance;
  static getInstance(){
    return instance??= Constants._();
  }

  final String userCollection = "Users";
  final String locksCollection = "Locks";
  final String notificationsCollection = "Notifications";
  final String logCollection = "Log";

}