
function handle_USD_sell()
	{
		var ans = confirm("Are you sure ?");	
		
		if(ans)
		{
			var bank_pln = bank_balance["PLN"];
			var usd_user =  parseFloat($("#USD_balance").val());
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
			$("#rate_id").val(rate);
			$("#amount_id").val(usd_to_sell);
			$("#mode_id").val("sell");
			
			$("#sub_trans").trigger("click");
		}
			
		
	}
	
	function handle_USD_buy()
	{
		var ans = confirm("Are you sure ?");	
		
		if(ans)
		{
			var bank_usd = bank_balance["USD"];
			var pln_user =  parseFloat($("#PLN_balance").val());
			var usd_to_buy = parseFloat($("#USD_am").val());
								
			var rate = parseFloat($("#USD_buy").text());
			
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