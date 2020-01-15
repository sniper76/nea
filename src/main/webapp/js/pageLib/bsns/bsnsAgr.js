var	bsnsAgr = {
	//----------------------------
	// InfoIndex 객체
	//----------------------------
	name: 'bsnsAgr',
	currentPage:1,			//페이지 번호
	listBlock:10,			//페이징갯수
	totalCount:0,			//게시물 전체갯수
	regId : "",

	init: function() {
		this.beforeBind();
		this.bind();
		this.afterBind();
	},

	beforeBind: function() {
	},

	bind: function() {
		
		bsnsAgr.fn.getBsnsAgr();
		
	},

	afterBind: function() {
		
		//다음 단계
		$('#btn_next').on('click', function(){
			if(!$('#chk_reqUseAgr').prop('checked') || !$('#chk_reqPriAgr').prop('checked')){
				$.alert('이용약관 및 개인정보 수집에 동의해야 신청이 가능합니다.');
				return false;
			}
			
			location.href = contextPath + "/bsns/mockAcntMstView.do?bsnsSeq=" + $('#bsnsSeq').val();
		});
		
	},
	fn: {
		
		/** 게시물 데이터**/
		getBsnsAgr : function() {
			var param = {
				"bsnsSeq" : $('#bsnsSeq').val()
			};
			var	opts = {
				url		: contextPath + "/bsns/getBsnsAgrDetail.do",
				data	: param,
				type	: "post",
				sendDataType	: "json",
				success	: function(resJSON, resCode) {
					// 목록 데이터 그리기
					bsnsAgr.fn.drawBsnsAgr(resJSON.data);
				}
			};
			common.http.ajax(opts);
		},
		
		/** 게시물 그리기 **/
		drawBsnsAgr : function(dataJson) {
			
			$('#reqUseAgr').html(dataJson.reqUseAgr);
			$('#reqPriAgr').html(dataJson.reqPriAgr);
			
			//common.sys.checkAllCheckBox();
		},
		
		
		
	}
}