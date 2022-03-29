function validate()
{
	var Validname = /^[a-z A-Z 0-9]+$/; //pattern allowed alphabet a-z, A-Z, 0-9
	var Validemail = /^[\w\d\.]+\@[a-z A-Z\.]+\.[A-Z a-z]{1,4}$/; //pattern valid email validation
	var Validpassword=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/; 
	
	let name = document.getElementById("name");
	let email = document.getElementById("email");
	let password = document.getElementById("password");
	let error_message = document.getElementById("error_message");
	error_message.style.padding = "10px";
	let text;
	if(!Validname.test(name.value) || name.value == "")
	{
		text="Enter Username Alphabet and Numbers Only!";
		error_message.innerHTML = text;
		name.focus();
		name.style.background = '#F08080';
		return false;
	}
	if(!Validemail.test(email.value) || email.value == "")
	{
		text="Enter Valid Email!";
		error_message.innerHTML = text;
		email.focus();
		email.style.background = '#F08080';
		return false;
	}
	if(!password.value.match(Validpassword) || password.value == "")
	{
		text="Password Must Be 6 to 20 Characters, which contain at least one NUMERIC, one UPPERCASE and one LOWERCASE letter!";
		error_message.innerHTML = text;
		password.focus();
		password.style.background = '#F08080';
		return false;
	}
	
};
