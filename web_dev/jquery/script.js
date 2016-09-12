
$('#kf').mousedown( function() {
	$('#kf').parent().append('<img src="simon.jpg">');
});

$('p').mousedown( function() {
	$('p').hide();
	$('#kf').toggle();
});


$("#right").click( function() {
  $('#kf').animate({ "left": "+=50px" }, "slow" );
});
 
$("#left").click( function() {
  $('#kf').animate({ "left": "-=50px" }, "slow" );
});

$("#up").click( function() {
	$('#kf').animate({ "top": "-=50px"}, "slow" );
});

$("#down").click( function() {
	$('#kf').animate({ "top": "+=50px"}, "slow");
})

