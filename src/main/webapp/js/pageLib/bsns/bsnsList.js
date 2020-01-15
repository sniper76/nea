var	bsnsList = {
	//----------------------------
	// InfoIndex 객체
	//----------------------------
	name: 'bsnsList',
	currentPage:1,			//페이지 번호
	listBlock:16,			//페이징갯수
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
		
		//common.sys.getDatepicker();
		//common.sys.getTimepicker();
		
		//상태 코드
		//common.sys.getSelectBox("STATUS_CD", "statusCd", "", "Y");
		
		//유형 코드
		//common.sys.getTpSelectBox("tpCd1", "", "Y", "", "", "");
		
		bsnsList.fn.getList();
		
	},

	afterBind: function() {
		common.sys.getDatepicker();
		//검색버튼
		$('#btnSearch').click(function(){
			bsnsList.currentPage = 1;
			bsnsList.fn.getList();
		});
		
	},
	fn: {
		
		cateSearch : function(cateCd) {
			$("#cateCd").val(cateCd);
			bsnsList.fn.getList();
		},
	
		/** 게시물 데이터**/
		getList : function() {
			var paramVal = bsnsList.fn.getParam();
			var param = {
				"pageNo"		:	bsnsList.currentPage,
				"listBlock"		:	bsnsList.listBlock,
				"sDate"			:	$.trim($("#sDate").val()),
				"eDate"			:	$.trim($("#eDate").val()),
				"statusCd"		:	$.trim($("#statusCd").val()),
				"tpCd1"			:	$.trim($("#tpCd1").val()),
				"cateCd"		:	$.trim($("#cateCd").val()),
				"bsnsTitle"		:	$.trim($("#bsnsTitle").val()),
			};
			var	opts = {
				url		: contextPath + "/bsns/getBsnsList.do",
				data	: param,
				type	: "post",
				sendDataType	: "json",
				success	: function(resJSON, resCode) {
					// 목록 데이터 그리기
					bsnsList.fn.drawList(resJSON.data);
				}
			};
			common.http.ajax(opts);
		},
		
		/** 게시물 그리기 **/
		drawList : function(dataJson) {
			
			var data   = dataJson.list;
			var paging   = dataJson.paging;
			var pageSettings = {
				pageNo   	: paging.pageNo,
				listBlock  	: paging.listBlock,
				totalCount 	: paging.totalCount,
				funcName 	: "bsnsList.fn.goPage"
			};
			
			
			$("#listTable").empty();
			//등록게시물이 없을경우
			if (data.length == 0) {
				$("#listTable").append("<div class='table'>등록된 사업이 없습니다.</div>");
				$("#paging").html("");
			}else{
			// 게시물 존재시 Row작성
				var	html = '';
				var k = 1;
				for(var i in data){
					if (k % 4 == 1) {
						html = html + '<ul class="big">';
					}
					html = html + '<li>';							
					html = html + '	<ul class="small" onclick="bsnsList.fn.goDatail('+ data[i].bsnsSeq +');">';
					html = html + '		<li class="img">';
					html = html + '			<a href="#none"><img src="'+contextPath+data[i].saveFilePath + data[i].saveFileNm + '" alt="" oneerror="this.src="../../images/noimg.png""/><span class="ing">'+ data[i].statusNm +'</span></a>';
					html = html + '		</li>';
					html = html + '		<li class="title">'+ data[i].bsnsTitle +'</li>';
					html = html + '		<li class="txt"><strong>유형 </strong>'+ data[i].cateNm +'>'+ data[i].tpNm1 +'</li>';
					html = html + '		<li class="txt"><strong>기간 </strong>'+data[i].bsnsStartDate+'~'+data[i].bsnsEndDate+'</li>';
					html = html + '		</ul>';
					html = html + '		</li>';
					if (k % 4 == 0) {
						html = html + '</ul>';
					}
					
					// 최초에만 상단의 카운트를 출력한다.
					if (k == 1) {
						$("#statusAllCnt").html("(" + data[i].statusAllCnt + ")");
						$("#cate01Cnt").html("(" + data[i].cate01Cnt + ")");
						$("#cate02Cnt").html("(" + data[i].cate02Cnt + ")");
						$("#cate03Cnt").html("(" + data[i].cate03Cnt + ")");
						$("#cate04Cnt").html("(" + data[i].cate04Cnt + ")");
						$("#cate05Cnt").html("(" + data[i].cate05Cnt + ")");
					}
					
					k++;
				}
				$("#listTable").html(html);
				
				$("#paging").html(common.paging.getNavigator(pageSettings));
			}
		},
		
		//페이징 조회
		goPage : function(pageNo){
			bsnsList.currentPage = pageNo;
			bsnsList.fn.getList();
		},
		
		goDatail : function(bsnsSeq){
			
			var param = bsnsList.fn.getParam();
			document.listFrm.action = contextPath + "/bsns/bsnsDetailView.do?bsnsSeq=" + bsnsSeq + "&" + param;
			document.listFrm.method = "post";
			document.listFrm.submit();
		},
		
		getParam : function(){
			var param = "sDate=" + $.trim($("#sDate").val());
			param += "&eDate=" + $.trim($("#eDate").val());
			param += "&tpCd1=" + $.trim($("#tpCd1").val());
			param += "&statusCd=" + $.trim($("#statusCd").val());
			param += "&bsnsTitle=" + $.trim($("#bsnsTitle").val());
			param += "&cateCd=" + $.trim($("#cateCd").val());
			return param;
		},
		
		
		
	}
}