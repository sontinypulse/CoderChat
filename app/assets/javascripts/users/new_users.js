$(document).ready(function () {
  $("#new_user").validate({
  rules: {
    "user[email]": {required: true, email: true, remote:"/users/check_email" },
    "user[password]": {required: true, minlength: 6},
    "user[password_confirmation]": {required: true, equalTo: "#user_password"}
  },
  messages: {
    "user[email]": {required: "Please specify your email",
    email: "Invalid email format, please specify as name@domain.com",
    remote: "Existing email, please specify the other" },
  }
  });
});
