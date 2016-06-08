<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(function(){
	
	$("#sub_btn").click(function(){		
		fill_login_form();
		$("#sub_lof").trigger("click");
		
	});
		$("#create_btn").click(function(){		
		
		$("#create_lof")[0].click();	
		
	});
		
	
});

function fill_login_form()
{
	
	$("#login_lof").val($("#login_lo").val());
	$("#pass_lof").val($("#pass_lo").val());
	
}



</script>

<div style="width:300px">
<h3 class="text-info">Login to your account</h3>
<c:if test="${param.error != null}">

<p class="text-danger">Incorrect login/password </p>
</c:if>
<p class="text-danger" id="err_lo"></p>
<div class="input-group input-group-md">
  <span class="input-group-addon">Login</span>
  <input type="text" class="form-control" placeholder="Login" id="login_lo">
</div><br>
<div class="input-group input-group-md">
  <span class="input-group-addon">Password</span>
  <input type="password" class="form-control" placeholder="Password" id="pass_lo">
</div><br>
<span style="margin-left:5px"></span><button class="btn btn-lg btn-primary" id="sub_btn">Login &raquo;</button>
<br><br>
<span style="margin-left:5px"></span>
<button class="btn btn-md btn-success" id="create_btn">Create new account &raquo;</button>
</div>

<form name='f' style="display:none" action='<c:url value='/login'/>' method='POST'>
	<table>
		<tr>
			<td>User:</td>
			<td><input type='text' id="login_lof" name='username' value=''></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type='password' id="pass_lof" name='password' /></td>
		</tr>
		<tr>
			<td colspan='2'><input name="submit" id="sub_lof" type="submit" value="Login" /></td>
		</tr>
		<tr>
			<td colspan='2'><a id="create_lof" href="<c:url value='/createUser'/>">Create Account</a></td>
		</tr>

	</table>
</form>




