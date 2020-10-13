$(document).ready(function() {

	$('li.good_register').click(function() {
		$("#container_all").load("/company/goods/register2 #container_box");
	});
	$('li.list').click(function() {
		$("#container_all").load("/company/goods/list #container_box2");
	});

	$('li.order_list').click(function() {
		$("#container_all").load("/company/shop/orderList #container_box2");
	});
	
	
	

});