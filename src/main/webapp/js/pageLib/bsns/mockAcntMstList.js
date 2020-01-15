var	mockAcntMstList = {
	//----------------------------
	// InfoIndex 객체
	//----------------------------
	name: 'mockAcntMstList',
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
		
		mockAcntMstList.fn.getList();
		
	},

	afterBind: function() {
		
		//다음 단계
		$('#btn_next').on('click', function(){
			
			var i = 0;
			var flag = false;
			$('#mockQuestList_tbody').children('tr').each(function(){
				if($(this).index() != 0){
					var checkedFlag = $(this).find('input[name=checkedFlag_' + i + ']:checked').val();
					if(typeof checkedFlag == "undefined"){
						$.alert('모든 항목을 체크하지않으면 다음단계로 넘어갈 수 없습니다.');
						flag = true;
						return false;
					}
					
					if(checkedFlag == "false"){
						$.alert('사업 신청 대상자가 아닙니다.');
						flag = true;
						return false;
					}
					
					i++;
				}
			});
			
			if(!flag){
				location.href = contextPath + "/bsnsRecpt/recptInsertView.do?bsnsSeq=" + $('#bsnsSeq').val();
			}
		});
		
		// 이전 단계
		$('#btn_prev').on('click', function(){
			history.back();
		});
		
	},
	fn: {
		
		/** 게시물 데이터**/
		getList : function() {
			var param = {
				"bsnsSeq" : $('#bsnsSeq').val()
			};
			var	opts = {
				url		: contextPath + "/bsns/getMockAcntDetail.do",
				data	: param,
				type	: "post",
				sendDataType	: "json",
				success	: function(resJSON, resCode) {
					// 목록 데이터 그리기
					mockAcntMstList.fn.drawList(resJSON.data);
				}
			};
			common.http.ajax(opts);
		},
		
		/** 게시물 그리기 **/
		drawList : function(dataJson) {
			
			$('#surveyTitle').html(dataJson.surveyTitle);
			var html = "";
			
			for(var i in dataJson.mockQuestList){
				var mockQuestValue = dataJson.mockQuestList[i];
				
				html += "<tr>";
				html += "<td>";
				html += "<p class='question'>" + mockQuestValue.question;
				html += "</p>";
				html += "<span class='infoTxt'>" + mockQuestValue.reason + "</span>";
				html += "</td>";
				html += "<td>";
				html += "<div class='labelWrap'>";
				html += "<label><input type='radio' name='checkedFlag_" + i + "' value='true'>예</label>";
				html += "<label><input type='radio' name='checkedFlag_" + i + "' value='false'>아니오</label>";
				html += "</div>";
				html += "</td>";
				html += "</tr>";
				
			}
			
			$('#mockQuestList_tbody').append(html);
			
		},
		
		
		
	}
}