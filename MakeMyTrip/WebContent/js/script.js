
var regLog=new registerLogin();
function registerLogin()
{
this.off=off;
this.on=on;
this.openRegistration=openRegistration;
this.closeRegistration=closeRegistration;
this.loginReset=loginReset;

this.validation=validation;//hard code login validation
//javascript  code for login page start


//javascript  code for login page End


//javascript  code for register page End

function openRegistration() {
$("#overlay").show();
$("#registerPage").show();

}
function closeRegistration() {
$("#overlay").hide();
$("#registerPage").hide();

}

//javascript  code for register page End


//hard code validation for login start
function validation() {
	  if ($("#loginEmail").val() == "") {
	    wiv.loginEmailValidaton();
	  } else if ($("#password").val() == "") {
		  invalidLoginPassword();
	  } else {
	    $("#loginForm").submit();
	    off();
	  }
	}

function loginReset(){
 $("#loginEmail").val("");
 $("#password").val("");

}


function on() {
 $("#overlay").show();
$("#loginPage").show();
}

function off() {
  $("#overlay").hide();
  $("#loginEmail").val("");
  $("#password").val("");
$("#loginPage").hide();
$("#invalidLoginPassword").hide();
$("#invalidLoginEmail").text("");

 
}
this.invalidLoginPassword=invalidLoginPassword
function invalidLoginPassword(){
	if ($("#password").val() == "") {
	    $("#invalidLoginPassword").text("Password cannot be empty");
	    $("#invalidLoginPassword").show();
	  }
	else{
	    $("#invalidLoginPassword").hide();

	}
}
}
//hard code validation for login close

// validation for all input field in regestration started

var wiv=new wrongInputValidation();
function wrongInputValidation(){


this.fNameValidation=fNameValidation;
this.lNameValidation=lNameValidation;
this.phoneNumberValidaton=phoneNumberValidaton;
this.emailValidaton=emailValidaton;
this.dateOfBirthValidaton=dateOfBirthValidaton;
// this.dateOfJoiningValidaton=dateOfJoiningValidaton;
this.passwordValidaton=passwordValidaton;
this.wrongFnameValidation=wrongFnameValidation;
this.wrongLnameValidation=wrongLnameValidation;
this.wrongPhoneNumberValidation=wrongPhoneNumberValidation;
this.submitValidation=submitValidation;
this.reset=reset;


//this.wrongDOBValidation=wrongDOBValidation;
//validation for First name start
var fn,ln,pn,eml,dob,doj,pwd,numberCheck,emailCheck;
function fNameValidation()
{
var fNameValue=$("#firstName").val();
var fNameRegex=/^[a-zA-Z]{2,20}$/;


if(fNameRegex.test(fNameValue))
{
 $("#invalidFirstName").hide();
 fn=true;
 
}

else if(fNameValue==""){
 $("#invalidFirstName").show();
 $("#invalidFirstName").html("please provide detail!!...");
 $("#invalidFirstName").css("color","red");
 fn=false;

}
else{
$("#invalidFirstName").show();
 $("#invalidFirstName").html("Invalid first name...");
 $("#invalidFirstName").css("color","red");
 fn=false;
 
}
}
//validation for First name Closed


//validation for Last name start
entered=false;
function lNameValidation()
{
var lNameValue=$("#lastName").val();
var lNameRegex=/^[a-zA-Z]{2,20}$/;

if(lNameRegex.test(lNameValue))
{
$("#invalidLastName").hide();
 ln=true;

}
else if(lNameValue==""){
 $("#invalidLastName").show();
 $("#invalidLastName").html("please provide detail!!...");
 $("#invalidLastName").css("color","red");
 ln=false;
 
}

else{
  $("#invalidLastName").show();
 $("#invalidLastName").html("Invalid last name");
 $("#invalidLastName").css("color","red");
 ln=false;

}
}
//validation for Last name Closed


//validation for Phone Number start


function phoneNumberValidaton(){
var phnNumberValue=$("#phoneNumber").val();
var phnNumberRegex=/^[7-9]{1}[0-9]{9}$/;
//if(phnNumberRegex.test(phnNumberValue)&&numberCheck=="null") this will be for number validation
//using ajax
if(phnNumberRegex.test(phnNumberValue))
{
 $("#invalidPhoneNumber").hide();
 pn=true;
 

}
else if(phnNumberValue==""){
 $("#invalidPhoneNumber").show();
 $("#invalidPhoneNumber").html("please provide detail!!...");
 $("#invalidPhoneNumber").css("color","red");
 pn=false;

}
else{
$("#invalidPhoneNumber").show();
 $("#invalidPhoneNumber").html("Invalid phone number");
 $("#invalidPhoneNumber").css("color","red");
 pn=false;

}
}
//validation for Phone Number Closed





//validation for email start


function emailValidaton(){
var emailValue=$("#registerationEmail").val();
var emailRegex=/^[a-z0-9][^@].[^@]+[\w]@[a-z0-9]{1,}[.][a-z0-9]{2,4}$/;
//this will be for email validation using ajax(already exist or not)
//if(emailRegex.test(emailValue)&&emailCheck=="null")
if(emailRegex.test(emailValue))
{
 $("#invalidEmail").hide();
 eml=true;
 

}

else if(emailValue==""){
 $("#invalidEmail").show();
 $("#invalidEmail").html("please provide detail!!...");
 $("#invalidEmail").css("color","red");
 eml=false;

}
else{
$("#invalidEmail").show();
 $("#invalidEmail").html("Invalid email address");
 $("#invalidEmail").css("color","red");
 eml=false;

}
}

this.loginEmailValidaton=loginEmailValidaton;
function loginEmailValidaton(){
var loginEmail;
var emailValue=$("#loginEmail").val();
var emailRegex=/^[a-z0-9][^@].[^@]+[\w]@[a-z0-9]{1,}[.][a-z0-9]{2,4}$/;
if(emailRegex.test(emailValue))
{
 $("#invalidLoginEmail").hide();
 loginEmail=true;
 

}

else if(emailValue==""){
  $("#invalidLoginEmail").show();
 $("#invalidLoginEmail").html("cannot be empty");
 loginEmail=false;

}
else{
  $("#invalidLoginEmail").show();
 $("#invalidLoginEmail").html("invalid");
 loginEmail=false;

}
}
//validation for email Closed


//validation for date of birth started


function dateOfBirthValidaton(){
var dOBValue=$("#registerationDOB").val();
var dOBRegex=/^(0[1-9]|1[0-9]|2?[0-9]|3?[0-1])[-]{1}(0[1-9]|1?[0-2])[-](19[00-99]|200[0-9]|201[0-9]|202[0-3])/;
if(dOBRegex.test(dOBValue))
{ 

 $("#invalidDOB").hide();
 dob=true;

}

else if(dOBValue==""){
 $("#invalidDOB").show();
 $("#invalidDOB").html("please provide detail!!...");
 $("#invalidDOB").css("color","red");
 dob=false;

}
else {
 $("#invalidDOB").show();
 $("#invalidDOB").html("Invalid Date of birth");
 $("#invalidDOB").css("color","red");
 dob=false;
 
}


}
//validation for date of birth Closed


//password validation starts

function passwordValidaton(){
   var passwordValue=$("#registerationPassword").val();
   var passwordRegex=/^[A-Z]{1,}[\W]{1,}[a-z]{1,}[0-9]{1,}[\w]{0,}/;
   
   if(passwordRegex.test(passwordValue))
   { 
     $("#WeakPassword").hide();
     pwd=true;
    

   }

   else if(passwordValue==""){
     $("#WeakPassword").show();
     $("#WeakPassword").html("please provide detail!!...");
     $("#WeakPassword").css("color","red");
     pwd=false;
   }
   else{
     $("#WeakPassword").show();
     $("#WeakPassword").html("Weak password");
     $("#WeakPassword").css("color","red");
     pwd=false;
   }
}
//validation for date of Joiing Closed

// validation for all input field in regestration Closed

//password /^[A-Z]{1,}[a-z]{3,}[\W]{1,}[0-9]{1,}[\w\W]{0,}$/g


//validation code for restriction in input field strated

function wrongFnameValidation(){
 const fnameRegex =/[\W\d]/;

  $("#firstName").val($("#firstName").val().replace(fnameRegex,""));
  //if($("#firstName").text(indexOf($("#firstName").val)10))
      //document.getElememntById("firstName").indexOf(document.getElememntById("firstName")>10)
  //$("#firstName").text.charAt(10)="";
 if($("#firstName").val().length>15)
 {
     //var a=$("#firstName").charAt(15)="";
 }
  
  

}

function wrongLnameValidation(){
const lnameRegex =/[\W\d]/;
$("#lastName").val($("#lastName").val().replace(lnameRegex,""));


}

function wrongPhoneNumberValidation(){
const pNumberRegex =/[\D]/;
$("#phoneNumber").val($("#phoneNumber").val().replace(pNumberRegex,""));

}
//validation code for restriction in input field Closed

this.wrongDOBValidation=wrongDOBValidation
function wrongDOBValidation(){
const dOBRegex =/[a-zA-Z`~@#$%^&*!?()_+=|\"';:.>,<]/;
$("#registerationDOB").val($("#registerationDOB").val().replace(dOBRegex,""));



}





function reset(){
$("#successful").html("");
$(".errorMessage").html("");
$(".regValue").val("");
fn=0;
ln=false;pn=false;eml=false;dob=false;pwd=false;


// document.getElementById("content").style.display="block";
//document.getElementById("displayRegisterationDetails").style.display="none";
}


var formSubmitted=false;
function submitValidation()
{ 
 

if(fn!=true){
 fNameValidation();
}
else if(ln!=true){
 lNameValidation();

}
else if(pn!=true){
 phoneNumberValidaton();

}
else if(eml!=true){
 emailValidaton();

}

else if(pwd!=true){
passwordValidaton();
}

//below conditions are for ajax validation for existing email
//else if(numberCheck!="null"){
//      wiv. checkNumber();
//   }
//else if(emailCheck!="null"){
//  wiv. checkEmail();
//}


else if(fn==true&&ln==true&&pn==true&&eml==true&&pwd==true){
 $("#registrationForm").submit();
regLog.closeRegistration();
reset();
$(".regValue").val("");
regLog.off();
}

}
}

//ajax for country states city
this.checkNumber=checkNumber;
function checkNumber(){
	var url="ajax/AjaxController.jsp";
	$.post(url,{
		getCountry:"getCountry",
		number:$("#phoneNumber").val()
		
	}, function(data){
		//alert(data)
			numberCheck=data;
		
		if(data!="null"){
		$("#invalidPhoneNumber").show();
	    $("#invalidPhoneNumber").html(data);
		}
		
	
	});
}

this.submitLogout=submitLogout;
function submitLogout(){
	$("#logoutForm").submit();
	("#logoutForm").hide();
}

this.logout=logout;
function logout() {
    document.getElementById("logoutForm").submit();
}

this.showHistory=showHistory;
function showHistory(){
	  $(".afterBook").hide();
	  $(".beforeBook").show();
}

this.validateDeleteForm=validateDeleteForm
function validateDeleteForm(){
	if($("#hotelNamesDropDown").val()!=""){
		$("#invalidHotel").hide();

		if($("#roomTypesDropDown").val()!=""){
			$("#invalidRoom").hide()
			$("#deleteHotelForm").submit();
		}
		else{
		$("#invalidRoom").show()
		$("#invalidRoom").text("Select a valid room");
		}
	}
	else{
	$("#invalidHotel").show();
	$("#invalidHotel").text("Select a valid Hotel");
	}
}






