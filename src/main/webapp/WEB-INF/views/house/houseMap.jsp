<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#address-container {
 	text-align: center;
	width: 200px;
	height: 100px;
	background-color: orange;
}
#postcodify_search_button {

}

</style>	
	
<div id="address-container" style="">
	<button id="postcodify_search_button">검색</button>
	<br /> 
	<input type="text" id="main_address" class="postcodify_address" value="" /><br />
	<input type="text" name="sub_address" class="postcodify_details" value="" /><br />
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
