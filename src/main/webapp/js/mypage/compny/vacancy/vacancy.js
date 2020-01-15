//채용 공고 js
var vacancy = {

	/*
	* 채용정보 카피,vacancy copy
	* copySeq 복사할 vacancy seq
	* id inner html할 tag id
	*/
	fnCopyVacancy : function(copySeq, id) {

		$.ajax({
			url: contextPath + "/cpes/compny/vacancy/writeFormAjax.do",
			method: METHOD_POST,
			data: {
				condCopySeq: copySeq,
				condSeq: copySeq
			},
			dataType: AJAX_DATA_TYPE_HTML
		})
		.done(function(data) {
			$("#"+id).html(data);
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert(systemMsg);
		});


	},

	fnAddLang : function(id,idNum) {

		$.ajax({
			url: contextPath + "/cpes/compny/vacancy/langFormAjax.do",
			method: METHOD_POST,
			data: {
				idNum: idNum
			},
			dataType: AJAX_DATA_TYPE_HTML
		})
		.done(function(data) {
			$("#"+id).append(data);
		})
		.fail(function(xhr, status, errorThrown) {
			alertify.alert(systemMsg);
		});
	},


	fnRemoveLang : function(id) {
		$("#"+id).remove();
	},

	fnGetTime : function(val, format) {
		if(val == "") {
			return val;
		} else {
			if(val.length != 8) {
				return val;
			} else {
				var timeArr = val.split(":");
				if(format == "H") {
					return timeArr[0];
				} else if(format == "M") {
					return timeArr[1];
				}
			}
		}

		return val;
	}

};
