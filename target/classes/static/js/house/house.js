let index = {
	
	init: function() {
		$("#btn-register").bind("click", () => {
			this.register();
		})
	},
	
	register: function() {
		let data = {
			
		}
		
		$.ajax({
			
			type: "POST",
			url: "/api/house/register",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function () {
			
		})
		.fail(function () {
			
		});
	}
}