// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).on("ready", function() {

	mapboxgl.accessToken = 'pk.eyJ1Ijoic2hyaWthbnQxNzEyIiwiYSI6ImNpamZmZWFuYjAwMmh0aG01Nmc0eTN1YXMifQ.QoRy6gmX07mtZ8cwiRue-w';
	map = new mapboxgl.Map({
	    container: 'map',
	    style: 'mapbox://styles/mapbox/streets-v8',
	    center: [73.937252, 18.551563],
	    zoom: 9
	});
	
	$("#search-location").click(function(){
		getLocationDetails();
	});
		
});


function getLocationDetails() {
	var address = $("#location").val();
	var $wheel = $("#spinning-wheel");
	$wheel.show();
	$.ajax({
		url : '/geomap/collect_res',
		data : {
			address : address
		},
		success : function(res) {
			result = JSON.stringify(res);
			var jsonResult = $.parseJSON(result);
			console.log(jsonResult["center"]);
			var points = jsonResult["center"];
			$wheel.hide();
			fly(points);
		},
		error: function (result) {
			$wheel.hide();
        	alert("Location is not available!!!");
        }
	});
}

function fly(points) {
    map.flyTo({
        center: points
    });
}