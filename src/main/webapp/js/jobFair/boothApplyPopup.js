function fnBoothReq(boothSeq, fairSeq) {
	if($("#boothReqPopup").length == 0) {
		$(document.body).append('<div id="boothReqPopup"></div>');
	}
	var url = "/jobFair/boothReqPopup.do?boothSeq="+boothSeq+"&condSeq="+fairSeq;
	$("#boothReqPopup").load(contextPath+url+" .popup", function(res, stat, xhr) {
		$("#booth-req-popup").show();
		$.getScript(contextPath+"/js/jobFair/boothReqPopup.js");
	});
}

function fnBoothBooking(fairSeq) {
	if($("#boothBookingPopup").length == 0) {
		$(document.body).append('<div id="boothBookingPopup"></div>');
	}
	var url = "/jobFair/boothBookingPopup.do?condSeq="+fairSeq;
	$("#boothBookingPopup").load(contextPath+url+" .popup", function(res, stat, xhr) {
		$("#booth-booking-popup").show();
		$.getScript(contextPath+"/js/jobFair/boothBookingPopup.js");
	});
}
