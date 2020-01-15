function fnBoothBookingSave() {
	alertify.confirm(boothBookingMsg01, function (e) {
		if (e) {
			$.ajax({ type: 'post', datatype: 'json', url: contextPath + "/jobFair/boothBookingAjax.do",
				data: $("[name=jobFairBoothBookingFrm]").serializeObject()
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert(boothBookingMsg02, function (e){
						fnBoothBookingClose();
						location.reload();
					});
				} else {
	 				var msg = systemMsg;
					if(data.result.statCd == "ERR_EXIST") {
						msg = boothBookingMsg03; //이미 예약대기자 신청이 되어 있습니다!
					}
					alertify.alert(msg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
		}
	});
}

function fnBoothBookingClose() {
	$("#boothBookingPopup").remove();
}
