//채용 공고 js
var jobsk = {

	/*
	* 구직신청 취소
	*/
	fnJobskStatChange : function() {
		alertify.confirm(jobskCancelMsg, function (e) {
			if (e) {
				$.ajax({
					url: contextPath + "/cpes/private/jobsk/closeProcessAjax.do",
					type: 'post',
					data: {
						condStat : "CLOSE"
					},
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert(changeOkMsg, function (e){
							location.reload();
						});

					} else {
		 				var msg = noMemberFailMsg;
						if(data.result.statCd == "02") {
							msg = systemMsg;
						}
						alertify.alert(msg);
					}
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert(systemMsg);
				});
			}
		});


	},

	/*
	* 구직신청 취소
	*/
	fnJobskDelete : function(seq) {
		alertify.confirm(jobskDelMsg, function (e) {
			if (e) {
				$.ajax({
					url: contextPath + "/cpes/private/jobsk/deleteProcessAjax.do",
					type: 'post',
					data: {
						condSeq : seq
					},
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert(deleteSuccessMsg, function (e){
							location.reload();
						});

					} else {
		 				var msg = noMemberFailMsg;
						if(data.result.statCd == "02") {
							msg = systemMsg;
						}
						alertify.alert(msg);
					}
				})
				.fail(function(xhr, status, errorThrown) {
					alertify.alert(systemMsg);
				});
			}
		});

	},

	/*
	* 알선신청(이력서 긴급이로 수정)
	*/
	fnJobskUrgency  : function(seq) {
		$.ajax({
			url: contextPath + "/cpes/private/jobsk/urgencyProcessAjax.do",
			type: 'post',
			data: {
				condSeq : seq
			},
			datatype: 'json'
		})
		.done(function(data) {
			if (data.result.successYn == "Y") {
				alertify.alert(changeOkMsg, function (e){
					location.reload();
				});

			} else {
 				var msg = noMemberFailMsg;
				if(data.result.statCd == "02") {
					msg = systemMsg;
				}
				alertify.alert(msg);
			}
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert(systemMsg);
		});
	},
};
