$(document).ready(function(){
  $('#new_user').validate({
    rules: {
      "user[username]": {
        required: true
      },
      "user[email]": {
        required: true
      },
      "user[password]": {
        required: true,
        minlength: 6
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: "#user_password"
      }
    }
  });
});