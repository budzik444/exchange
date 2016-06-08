
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
.jumbotron{
    background-color:#2E2D88;
    color:white;
}
</style>

<script>
	$(function() 
	{	
		$("#err_wall").text("");
		get_bank_balance();
		update_json_rates();
		setInterval(update_json_rates, 1000);
		
		
		$("#USD_sell_btn").click(handle_USD_sell);
		$("#USD_buy_btn").click(handle_USD_buy);
		
	});

	var json_rates; //global
	var bank_balance = {}
	
	
	function update_json_rates() {
		$.ajax({
			method : 'GET',
			url : "http://webtask.future-processing.com:8068/currencies",
			beforeSend : function(request) {
				request.setRequestHeader("Accept", "application/json", false);
			},
			success : function(data) {
				json_rates = data;
				update_table();
				//console.log(json_rates);
			}
		});
		
	}
	
	function update_table()
	{
		$("#rates_date").text("Rates from: "+json_rates.publicationDate.split(".")[0]);
		
		$("#USD_sell").text(json_rates.items[0].sellPrice);
		$("#USD_buy").text(json_rates.items[0].purchasePrice);
		
		$("#EUR_sell").text(json_rates.items[1].sellPrice);
		$("#EUR_buy").text(json_rates.items[1].purchasePrice);
		
		$("#CHF_sell").text(json_rates.items[2].sellPrice);
		$("#CHF_buy").text(json_rates.items[2].purchasePrice);
		
		$("#RUB_sell").text(json_rates.items[3].sellPrice);
		$("#RUB_buy").text(json_rates.items[3].purchasePrice);
		
		$("#CZK_sell").text(json_rates.items[4].sellPrice);
		$("#CZK_buy").text(json_rates.items[4].purchasePrice);
		
		$("#GBP_sell").text(json_rates.items[5].sellPrice);
		$("#GBP_buy").text(json_rates.items[5].purchasePrice);
		
		
	}
	
	function get_bank_balance()
	{
		bank_balance["PLN"] = parseFloat($("#bank_PLN").val());
		bank_balance["USD"] = parseFloat($("#bank_USD").val());
		bank_balance["EUR"] = parseFloat($("#bank_EUR").val());
		bank_balance["CHF"] = parseFloat($("#bank_CHF").val());
		bank_balance["RUB"] = parseFloat($("#bank_RUB").val());
		bank_balance["CZK"] = parseFloat($("#bank_CZK").val());
		bank_balance["GBP"] = parseFloat($("#bank_GBP").val());
		
		
		
	}
	

	function handle_USD_sell()
		{
			
			
			if(confirm("Are you sure ?"))
			{
				
				
				var bank_pln = bank_balance["PLN"];
				var usd_user =  parseFloat($("#USD_balance").text());
				var usd_to_sell = parseFloat($("#USD_am").val());
								
				var rate = parseFloat($("#USD_sell").text());
				
				
				if(usd_to_sell > usd_user)
				{
					$("#err_wall").text("You can't sell more than you have");
					return;
				}	
				if(rate*usd_to_sell > bank_pln)
				{
					$("#err_wall").text("Sorry, bank can't serve this request now");
					return;		
					
				}
				
				$("#code_id").val("USD");
				
				
				$("#amount_id").val(usd_to_sell);
				$("#mode_id").val("sell");
				
				$("#rate_id").val(rate);
							
				$("#sub_trans").trigger("click");
			}
				
			
		}
		
		function handle_USD_buy()
		{
			
			
			if(confirm("Are you sure ?"))
			{
				var bank_usd = bank_balance["USD"];
				var pln_user =  parseFloat($("#PLN_balance").text());
				var usd_to_buy = parseFloat($("#USD_am").val());
								
				var rate = parseFloat($("#USD_buy").text());
				alert($("#USD_buy").text());
				if(usd_to_buy > bank_usd)
				{
					$("#err_wall").text("Sorry, bank can't serve this request now");
					return;
				}	
				if(usd_to_buy*rate > pln_user)
				{
					$("#err_wall").text("Not enough PLN in your wallet");
					return;		
					
				}
				
				$("#code_id").val("USD");
				$("#rate_id").val(rate);
				$("#amount_id").val(usd_to_buy);
				$("#mode_id").val("buy");
				
				$("#sub_trans").trigger("click");
			}
				
			
		}
	

	
</script>

<h3 class="text-info">Transfers</h3>
<p class="text-danger" id="err_wall"></p>
<div style="width:600px; float:left">

<table class="table">
<tr>
	<td><p class="text-warning">Currency</p></td>
	<td><p class="text-warning">My balance</p></td>	
	<td><p class="text-warning">Unit</p></td>	
	<td><p class="text-warning">Sell price</p></td>
	<td><p class="text-warning">Buy price</p></td>
	<td><p class="text-warning">Amount</p></td>
	
</tr>


<c:if test="${user.USD>=0}">
<tr>
	<td><p class="text-primary">USD</p></td>
	<td><p class="text-success" id="USD_balance">${user.USD}</p></td>
	<td><p class="text-warning">1</p></td>
	<td><p class="text-success" id="USD_sell"></p></td>
	<td><p class="text-danger" id="USD_buy"></p></td>
	<td><input type="number" min="0" class="form-control" placeholder="how much" id="USD_am"></input></td>
	<td><button class="btn btn-md btn-success" id="USD_sell_btn">Sell</button></td>
	<td><button class="btn btn-md btn-danger" id="USD_buy_btn">Buy</button></td>
	
</tr>
</c:if>

<c:if test="${user.EUR>=0}">
<tr>
	<td><p class="text-primary">EUR</p></td>
	<td><p class="text-success" id="EUR_balance">${user.EUR}</p></td>
	<td><p class="text-warning">1</p></td>
	<td><p class="text-success" id="EUR_sell"></p></td>
	<td><p class="text-danger" id="EUR_buy"></p></td>
	<td><input type="number" min="0" class="form-control" placeholder="how much" id="EUR_am"></input></td>
	<td><button class="btn btn-md btn-success" id="EUR_sell_btn">Sell</button></td>
	<td><button class="btn btn-md btn-danger" id="EUR_buy_btn">Buy</button></td>
</tr>
</c:if>

<c:if test="${user.CHF>=0}">
<tr>
	<td><p class="text-primary">CHF</p></td>
	<td><p class="text-success" id="CHF_balance">${user.CHF}</p></td>
	<td><p class="text-warning">1</p></td>
	<td><p class="text-success" id="CHF_sell"></p></td>
	<td><p class="text-danger" id="CHF_buy"></p></td>
	<td><input type="number" min="0" class="form-control" placeholder="how much" id="CHF_am"></input></td>
	<td><button class="btn btn-md btn-success" id="CHF_sell_btn">Sell</button></td>
	<td><button class="btn btn-md btn-danger" id="CHF_buy_btn">Buy</button></td>
</tr>
</c:if>

<c:if test="${user.RUB>=0}">
<tr>
	<td><p class="text-primary">RUB</p></td>
	<td><p class="text-success" id="RUB_balance">${user.RUB}</p></td>
	<td><p class="text-warning">100</p></td>
	<td><p class="text-success" id="RUB_sell"></p></td>
	<td><p class="text-danger" id="RUB_buy"></p></td>
	<td><input type="number" min="0" class="form-control" placeholder="how much" id="RUB_am"></input></td>
	<td><button class="btn btn-md btn-success" id="RUB_sell_btn">Sell</button></td>
	<td><button class="btn btn-md btn-danger" id="RUB_buy_btn">Buy</button></td>
</tr>
</c:if>

<c:if test="${user.CZK>=0}">
<tr>
	<td><p class="text-primary" id="CZK_balance">CZK</p></td>
	<td><p class="text-success">${user.CZK}</p></td>
	<td><p class="text-warning">100</p></td>
	<td><p class="text-success" id="CZK_sell"></p></td>
	<td><p class="text-danger" id="CZK_buy"></p></td>
	<td><input type="number" min="0" class="form-control" placeholder="how much" id="CZK_am"></input></td>
	<td><button class="btn btn-md btn-success" id="CZK_sell_btn">Sell</button></td>
	<td><button class="btn btn-md btn-danger" id="CZK_buy_btn">Buy</button></td>
</tr>
</c:if>

<c:if test="${user.GBP>=0}">
<tr>
	<td><p class="text-primary">GBP</p></td>
	<td><p class="text-success" id="GBP_balance">${user.GBP}</p></td>
	<td><p class="text-warning">1</p></td>
	<td><p class="text-success" id="GBP_sell"></p></td>
	<td><p class="text-danger" id="GBP_buy"></p></td>
	<td><input type="number" min="0" class="form-control" placeholder="how much" id="GBP_am"></input></td>
	<td><button class="btn btn-md btn-success" id="GBP_sell_btn">Sell</button></td>
	<td><button class="btn btn-md btn-danger" id="GBP_buy_btn">Buy</button></td>
</tr>
</c:if>

</table>


</div>
<table class="table">
<tr>
	<td><h4 class="text-primary">My current PLN balance: </h4></td>
	<td><h3 class="text-success" id="PLN_balance">${user.PLN}</h3></td>
	
</tr>
</table>
<p class="text-info" id="rates_date"></p>


<div style="display:none">

<input type="number" id="bank_PLN" value="${bank.PLN}"/>
<input type="number" id="bank_USD" value="${bank.USD}"/>
<input type="number" id="bank_EUR" value="${bank.EUR}"/>
<input type="number" id="bank_CHF" value="${bank.CHF}"/>
<input type="number" id="bank_RUB" value="${bank.RUB}"/>
<input type="number" id="bank_CZK" value="${bank.CZK}"/>
<input type="number" id="bank_GBP" value="${bank.GBP}"/>

</div>

<form action='${pageContext.request.contextPath}/makeTrans' method='POST' style="display:none">				
		
		<input type="text" name='amount' id="amount_id"/>
		<input type="text" name='code' id="code_id"/>				
		<input type="text" name='rate' id="rate_id"/>					
		<input type="text" name='mode' id="mode_id"/>	
		<input type="submit" id="sub_trans"/>	
</form>


