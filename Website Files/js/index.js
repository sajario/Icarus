var email = document.getElementById("email");
var userpass = document.getElementById("password");
var emailFilled = false;
var passwordFilled = false;

function submitForm() {
  if (!email.value) {
    email.style.borderBottom = "1px solid #F44336";
  } else {
    email.style.borderBottom = "1px solid #9e9e9e";
    emailFilled = true;
  }

  if (!userpass.value) {
    userpass.style.borderBottom = "1px solid #F44336";
  } else {
    userpass.style.borderBottom = "1px solid #9e9e9e";
    passwordFilled = true;
  }

  if (emailFilled && passwordFilled) {
    document.getElementById("loginForm").submit();
  }
}
