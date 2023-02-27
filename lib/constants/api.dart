//This is where we declare all our api path in form of a string variable
const String http = 'https://';

const String baseURL = "fastrash-1337.ew.r.appspot.com";
//const String baseURL = "hdgieucue.myfixbot.com";

/// User Auth
const String userRegistrationPath = "/api/auth/register";
const String userLoginPath = "/api/auth/login";
const String userDeletePath ="/api/auth/delete/{id}";

/// Organization Auth
const String organizationRegistrationPath = "/api/auth/org/register";
const String organizationLoginPath = "/api/auth/org/register";
const String organizationDeletePath ="/api/auth/org/delete/{id}";

/// Alerts
const String createAlertsPath ="/api/alerts/create";
const String getAlertsPath ="/api/alerts/";