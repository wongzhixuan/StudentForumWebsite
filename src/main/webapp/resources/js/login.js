function validate()
{
	let email = document.getElementById("email");
	let password = document.getElementById("password");
	
	//make sure email cannot be blank 
	if (email.value == null || email.value == "")
	{
		window.alert("Email cannot be EMPTY");//alert message
		email.style.background = '#F08080';
		email.focus();
		return false;		
	}
	//make sure password cannot be blank
	if (password.value == null || password.value == "")
	{
		window.alert("Password cannot be EMPTY"); // alert message
		password.style.background = '#F08080';
		password.focus();
		return false;
	}
}