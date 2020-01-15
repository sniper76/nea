//알선 js
var referral = {

	/*
	* 알선 저장
	*/
	fnReferralSave : function(seq,seq2,div) {
		alertify.confirm(referralMsg, function (e) {
			if (e) {
				var url = contextPath + "/cpes/private/applic/referralProcessAjax.do";
				if(div == "COMPNY") {
					url = contextPath + "/cpes/compny/applic/referralProcessAjax.do";
				}

				$.ajax({
					url: url,
					type: 'post',
					data: {
						condSeq : seq,
						condSeq2 : seq2
					},
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert(saveMsg, function (e){
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
	* 알선 삭제
	*/
	fnDelReferral : function(div) {

		var seqArr = new Array;

		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
			alertify.alert(dataChoiceMsg, function (e){

			});
			return false;
		}

		$("input:checkbox[name=chk]:checked").each(function() {
			seqArr.push($(this).val())
		});

		alertify.confirm(confirmDeleteMsg2, function (e) {
			if (e) {
				var url = contextPath + "/cpes/private/applic/referralDeleteProcessAjax.do";
				if(div == "COMPNY") {
					url = contextPath + "/cpes/compny/applic/referralDeleteProcessAjax.do";
				}

				$.ajax({
					url: url,
					type: 'post',
					data: {
						condStr : seqArr.join(",")
					},
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						alertify.alert(deleteSuccessMsg, function (e){
							fnSetPageing("1");
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
	* 알선 거부
	*/
	fnRejectReferral : function(div) {
		if($("#referralRejectCd").val() == "") {
			alertify.alert(rejectMsg, function (e){
				$("#referralRejectCd").focus();
			});
			return false;
		}

		var url = contextPath + "/cpes/private/applic/referralRejectProcessAjax.do";
		if(div == "COMPNY") {
			url = contextPath + "/cpes/compny/applic/referralRejectProcessAjax.do";
		}


		alertify.confirm(referralRejectMsg, function (e) {
			if (e) {
				$.ajax({
					url: url,
					type: 'post',
					data: {
						condSeq: $("#condSeq").val(),
						condSeq2: $("#condSeq2").val(),
						condText: $("#referralRejectCd").val()
					},
					datatype: 'json'
				})
				.done(function(data) {
					if (data.result.successYn == "Y") {
						location.reload();

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
	}


};
