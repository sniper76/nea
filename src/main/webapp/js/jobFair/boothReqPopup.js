function fnBoothReqSave(boothSeq) {
	alertify.confirm(boothReqMsg01, function (e) {
		if (e) {
			var param = $("[name=jobFairBoothReqFrm]").serializeObject();
			$.ajax({ type: 'post', datatype: 'json', url: contextPath + "/jobFair/boothReqAjax.do",
				data: param
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert(boothReqMsg02, function(e) {
						fnBoothReqClose();
						location.reload();
					});
				} else {
	 				var msg = systemMsg;
					if(data.result.statCd == "ERR_NOT_ALLOW_STS") {
						msg = boothReqMsg03; //해당 부스가 이미 예약신청되어 있어서 처리할 수 없습니다!
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

function fnBoothReqClose() {
	$("#boothReqPopup").remove();
}
