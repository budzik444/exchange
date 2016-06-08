<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
 <script>
 
 $(function(){
	
	 
	 $("#login_but").click(function(){$("#login_h")[0].click();});
	 $("#logout_but").click(function(){$("#logout_h")[0].click();});
	 $("#wallet_but").click(function(){$("#wallet_h")[0].click();});
	 $("#home_but").click(function(){$("#home_h")[0].click();});
	 
	 
 });
 

 
 </script>
 
<a id="home_h" style="display:none" class="title" href="<c:url value='/'/>"></a>
<button id="home_but"  class="btn btn-md btn-success" >Home</button>

<sec:authorize access="!isAuthenticated()">
<a id="login_h" style="display:none" href="<c:url value='/login'/>"></a>
<button id="login_but"  class="btn btn-md btn-success" >Log in</button>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<a id="wallet_h"  href="<c:url value='/wallet'/>"></a>
<button id="wallet_but" class="btn btn-md btn-success">My wallet</button>
<a id="logout_h"  href="<c:url value='/logout'/>"></a>
<div style="position:absolute; right:5px; top:4px; padding:3px">
<button id="logout_but" class="btn btn-md btn-warning pull-right">
<span class="glyphicon glyphicon-off"></span>
</button>

<div style="float:right">
<h4 class="text-info">Logged as: ${logged_as}</h4>
</div>
</div>
</sec:authorize>

