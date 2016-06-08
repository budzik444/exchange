
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(function(){
	
	$("#sub_btn").click(handle_submit);
	
	
	
	
});


function handle_submit()
{
		
	if(!verify_password()) return;
		
	fill_create_form();
	
	$("#submit_cuf").trigger("click");
	
}

function verify_password()
{
	var err_msg;
	var login = $("#login_cu").val();
	var pass1 = $("#pass1_cu").val();
	var pass2 = $("#pass2_cu").val();
	
	if(login.length < 3 || pass1.length<3) err_msg = "Login or/and password too short";
	
	if(pass1!=pass2) err_msg+=", passwords do not match";
	
	if(err_msg)
	{
		
		$("#err_cu").text(err_msg);
		return false;
	}
	
	return true;
	
}

function fill_create_form()
{	
	
	$("#username_cuf").val($("#login_cu").val());
	$("#password_cuf").val($("#pass1_cu").val());
	if($("#PLN_cu").val()!=="") $("#PLN_cuf").val($("#PLN_cu").val());
	if($("#USD_cu").val()!=="") $("#USD_cuf").val($("#USD_cu").val());
	if($("#EUR_cu").val()!=="") $("#EUR_cuf").val($("#EUR_cu").val());
	if($("#CHF_cu").val()!=="") $("#CHF_cuf").val($("#CHF_cu").val());
	if($("#RUB_cu").val()!=="") $("#RUB_cuf").val($("#RUB_cu").val());
	if($("#CZK_cu").val()!=="") $("#CZK_cuf").val($("#CZK_cu").val());
	if($("#GBP_cu").val()!=="") $("#GBP_cuf").val($("#GBP_cu").val());
	
	
}


</script>

<div style="width:300px">
<h3 class="text-info">Your login credentials</h3>
<p class="text-danger" id="err_cu"></p>
<c:if test='${create_error != "" }'><p class="text-danger">${create_error}</p></c:if>
<div class="input-group input-group-md">
  <span class="input-group-addon">Enter login</span>
  <input type="text" class="form-control" placeholder="Your login" id="login_cu">
</div><br>
<div class="input-group input-group-md">
  <span class="input-group-addon">Enter password</span>
  <input type="password" class="form-control" placeholder="password" id="pass1_cu">
</div><br>
<div class="input-group input-group-md">
  <span class="input-group-addon">Confirm password</span>
  <input type="password" class="form-control" placeholder="confirm password" id="pass2_cu">
 
</div>
<h3 class="text-info">Your wallet</h3>




<table class="table table-striped">
<tr>
	<td><div class="btn btn-md btn-success">Add PLN</div></td>
	<td><input type="number" min="0" class="form-control" id="PLN_cu" placeholder="required"></td>
</tr>
<tr>
	<td><button class="btn btn-md btn-success" data-toggle="collapse" data-target="#USD_cu">Add USD</button></td>
	<td><input type="number" min="0" class="form-control collapse" id="USD_cu"></td>
</tr>
<tr>
	<td><button class="btn btn-md btn-success" data-toggle="collapse" data-target="#EUR_cu">Add EUR</button></td>
	<td><input type="number" min="0" class="form-control collapse" id="EUR_cu"></td>
</tr>
<tr>
	<td><button class="btn btn-md btn-success" data-toggle="collapse" data-target="#CHF_cu">Add CHF</button></td>
	<td><input type="number" min="0" class="form-control collapse" id="CHF_cu"></td>
</tr>
<tr>
	<td><button class="btn btn-md btn-success" data-toggle="collapse" data-target="#RUB_cu">Add RUB</button></td>
	<td><input type="number" min="0" class="form-control collapse" id="RUB_cu"></td>
</tr>
<tr>
	<td><button class="btn btn-md btn-success" data-toggle="collapse" data-target="#CZK_cu">Add CZK</button></td>
	<td><input type="number" min="0" class="form-control collapse" id="CZK_cu"></td>
</tr>
<tr>
	<td><button class="btn btn-md btn-success" data-toggle="collapse" data-target="#GBP_cu">Add GBP</button></td>
	<td><input type="number" min="0" class="form-control collapse" id="GBP_cu"></td>
</tr>

</table>
<span style="margin-left:5px"></span><button class="btn btn-lg btn-primary" id="sub_btn">Create Account &raquo;</button>

</div>
 


<form action='${pageContext.request.contextPath}/doCreate' method='POST' style="display:none">
			
			<input type='text' name='username' id="username_cuf">
			<input type='password' name='password' id="password_cuf"/>
			<input type='text' name='PLN' id="PLN_cuf" value="-1" />
			<input type='text' name='USD' id="USD_cuf" value="-1" />
			<input type='text' name='EUR' id="EUR_cuf" value="-1"/>				
			<input type='text' name='CHF' id="CHF_cuf"value="-1"/>		
			<input type='text' name='RUB' id="RUB_cuf" value="-1" />			
			<input type='text' name='CZK' id="CZK_cuf" value="-1" />			
			<input type='text' name='GBP' id="GBP_cuf" value="-1" />		
			<input type="submit" value="Create User" id="submit_cuf"/>
	
</form>