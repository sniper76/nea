<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
		var dataSetObj = null;
    	$(document).ready(function() {
			//검색키워드 enter
			$("#condText2").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSetPageing("1");
				}
			});
    	});

    	function fnSetPageing(curPage) {
    		$("#currentPageNo").val(curPage);
    		$("#condText").val($("#condText2").val());
    		fnGetApplicDtlList();
    	}


    	function fnGetApplicDtlList() {
			$.ajax({
				url: contextPath + "/cpes/compny/applic/listDtlAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'html'
			})
			.done(function(data) {
				$("#applicDtlListDiv").html(data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});
    	}


    	function fnSetStat(stat,obj) {
			$(obj).parents('ul').find('a').removeClass("on");
			$(obj).addClass("on");

    		$("#condText").val("");
    		$("#condText2").val("");
    		$("#condApplicProcCd").val(stat);

    		fnSetPageing("1");
    	}


    	function fnSetProcStat(dataSetId, obj) {
    		dataSetObj = document.querySelector('#'+dataSetId);

    		if($(obj).val() == "APC0000000006") {
    			fnRejectOpen();
    		} else if($(obj).val() == "APC0000000005") {
    			var confirmMsg = "<spring:message code="mypage.compny.fail.reason.msg3"/>\n";
    			confirmMsg = confirmMsg + "<spring:message code="mypage.compny.fail.reason.msg4"/>\n";
    			confirmMsg = confirmMsg + "<spring:message code="mypage.compny.fail.reason.msg5"/>";


	    		alertify.confirm(confirmMsg, function (e) {
	    			if (e) {
						$.ajax({
							url: contextPath + "/cpes/compny/applic/intvwReqProcessAjax.do",
							type: 'post',
							data: {
								condSeq: dataSetObj.dataset.applicSeq,
								condSeq2: dataSetObj.dataset.vacancySeq,
								condTypeCd: $(obj).val()
							},
							datatype: 'json'
						})
						.done(function(data) {
							if (data.result.successYn == "Y") {
				    			var rsltMsg = "<spring:message code="mypage.compny.fail.reason.msg6"/>\n";
				    			rsltMsg = rsltMsg + "<spring:message code="mypage.compny.fail.reason.msg7"/>\n";
				    			rsltMsg = rsltMsg + "<spring:message code="mypage.compny.fail.reason.msg8"/>";
								alertify.alert(rsltMsg, function (e){

								});

							} else {
				 				var msg = "<spring:message code="login.findId.no.data"/>";
								if(data.result.statCd == "01") {
									msg = "<spring:message code="mypage.compny.fail.reason.msg9"/>";
								}
								alertify.alert(msg, function (e){
									location.reload();
								});
							}
						})
						.fail(function(xhr, status, errorThrown) {
							alertify.alert("<spring:message code="errors.ajax.fail"/>");
						});
	    			}
	    		});
    		} else {
	    		alertify.confirm("<spring:message code="mypage.compny.applic.msg"/>", function (e) {
	    			if (e) {
						$.ajax({
							url: contextPath + "/cpes/compny/applic/updateProcStatAjax.do",
							type: 'post',
							data: {
								condSeq: dataSetObj.dataset.applicSeq,
								condSeq2: dataSetObj.dataset.vacancySeq,
								condTypeCd: $(obj).val()
							},
							datatype: 'json'
						})
						.done(function(data) {
							if (data.result.successYn == "Y") {
								alertify.alert("<spring:message code="mypage.private.jobsk.title21"/>", function (e){

								});

							} else {
				 				var msg = "<spring:message code="login.findId.no.data"/>";
								if(data.result.statCd == "02") {
									msg = "<spring:message code="errors.ajax.fail"/>";
								}
								alertify.alert(msg);
							}
						})
						.fail(function(xhr, status, errorThrown) {
							alertify.alert("<spring:message code="errors.ajax.fail"/>");
						});
	    			}
	    		});
    		}

    	}


    	function fnResumeOpen(seq,seq2,seq3) {
			$.ajax({
				url: contextPath + "/cpes/compny/applic/updateResumeOpenAjax.do",
				type: 'post',
				data: {
					condSeq: seq,
					condSeq2: seq2,
					condSeq3: seq3
				},
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					fnGoCompnyResumeView(seq3);
				} else {
	 				var msg = "<spring:message code="login.findId.no.data"/>";
					if(data.result.statCd == "02") {
						msg = "<spring:message code="errors.ajax.fail"/>";
					}
					alertify.alert(msg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});
    	}

    	function fnResumeOpenList(seq,seq2) {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chkApplic]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chkApplic]:checked").each(function() {
    			seqArr.push($(this).val())
			});

    		//console.log("==========str="+seqArr.join(","))
    		alertify.confirm("<spring:message code="mypage.compny.applic.msg2"/>", function (e) {
    			if (e) {

					$.ajax({
						url: contextPath + "/cpes/compny/applic/updateResumeOpenMultiAjax.do",
						type: 'post',
						data: {
							condStr: seqArr.join(",")
						},
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="mypage.private.jobsk.title21"/>", function (e){
								fnSetPageing("${paginationInfo.currentPageNo}");
							});
						} else {
			 				var msg = "<spring:message code="login.findId.no.data"/>";
							if(data.result.statCd == "02") {
								msg = "<spring:message code="errors.ajax.fail"/>";
							}
							alertify.alert(msg);
						}
					})
					.fail(function(xhr, status, errorThrown) {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
					});
    			}
    		});
    	}


    	function fnIntvwList() {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chkApplic]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chkApplic]:checked").each(function() {
    			seqArr.push($(this).val())

			});
    	}

    	function fnApplicExcelDownload(seq) {

			var param = {
					condSeq: seq,
					condApplicProcCd: $("#condApplicProcCd").val()
			};

			var	opts = {
					url: contextPath + "/cpes/compny/applic/listExcel.do",
					data	: param,
					type	: "post",
					sendDataType	: "json",
			};
			common.http.sendFormData(opts);

    	}


    	function fnOnlineIntvw(seq, seq2) {
    		alert("미구현");
    	}


      	function fnRejectOpen() {
      		$("#failReason").attr("disabled", false);
    		var userNm = dataSetObj.dataset.userNm;
    		$("#dialogBtn").show();

      		$('#dialog').dialog({
      	    	title: '',
      	      	modal: true,
      	      	width: '700',
      	      	height: '300',
      	      	hideCloseButton: true
      		});

      		$(".ui-dialog-titlebar").remove();//다이얼로그 상단 타이틀 제거

      		$("#reasonNm").html(userNm);
    	}


      	function fnCloseReject(id) {
      		$("#"+id).dialog( "close" );
      	}


      	function fnApplicFailReason() {
			if($("#failReason").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.fail.reason.msg"/>", function (e){
					$("#failReason").focus();
				});
				return false;
			}

    		alertify.confirm("<spring:message code="mypage.compny.fail.reason.msg2"/>", function (e) {
    			if (e) {

					$.ajax({
						url: contextPath + "/cpes/compny/applic/applicFailProcessAjax.do",
						type: 'post',
						data: {
							condSeq: dataSetObj.dataset.applicSeq,
							condSeq2: dataSetObj.dataset.vacancySeq,
							condText: $("#failReason").val()
						},
						datatype: 'json'
					})
					.done(function(data) {
						if (data.result.successYn == "Y") {
							alertify.alert("<spring:message code="mypage.private.jobsk.title21"/>", function (e){
								location.reload();
							});
						} else {
			 				var msg = "<spring:message code="login.findId.no.data"/>";
							if(data.result.statCd == "02") {
								msg = "<spring:message code="errors.ajax.fail"/>";
							}
							alertify.alert(msg);
						}
					})
					.fail(function(xhr, status, errorThrown) {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
					});
    			}
    		});

      	}


      	function fnRejectOpen2(dataSetId) {
			dataSetObj = document.querySelector('#'+dataSetId);
    		var userNm = dataSetObj.dataset.userNm;
    		var failReason = dataSetObj.dataset.failReason;

      		$('#dialog').dialog({
      	    	title: '',
      	      	modal: true,
      	      	width: '700',
      	      	height: '300',
      	      	hideCloseButton: true
      		});

      		$(".ui-dialog-titlebar").remove();//다이얼로그 상단 타이틀 제거


      		$("#dialogBtn").hide();
      		$("#reasonNm").html(userNm);
      		$("#failReason").val(failReason);
      		$("#failReason").attr("disabled", true);
      	}
	</script>

	<div class="box_step type2 count6">
		<ul class="clearfix">
			<li>
				<div class="contents_wrap">
					<a href="javascript:void(0);" onclick="fnSetStat('', this);" class="contents_box <c:if test="${empty param.condApplicProcCd or param.condApplicProcCd == ''}">on</c:if>"><!-- 활성화 됐을 경우 클래스 on 추가 -->
						<span class="title_box">
							<strong class="title"><spring:message code="mypage.compny.vacancy.msg"/></strong>
						</span>
						<span class="cont_box">
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.totCnt}" /></span>
						</span>
					</a>
				</div>
			</li>
			<li>
				<div class="contents_wrap">
					<a href="javascript:void(0);" onclick="fnSetStat('NOT_OPEN', this);" class="contents_box <c:if test="${param.condApplicProcCd == 'NOT_OPEN'}">on</c:if>"><!-- 활성화 됐을 경우 클래스 on 추가 -->
						<span class="title_box">
							<strong class="title"><spring:message code="mypage.compny.vacancy.msg2"/></strong>
						</span>
						<span class="cont_box">
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.openNCnt}" /></span>
						</span>
					</a>
				</div>
			</li>
			<li>
				<div class="contents_wrap">
					<a href="javascript:void(0);" onclick="fnSetStat('CHECK', this);" class="contents_box <c:if test="${param.condApplicProcCd == 'CHECK'}">on</c:if>"><!-- 활성화 됐을 경우 클래스 on 추가 -->
						<span class="title_box">
							<strong class="title"><spring:message code="mypage.compny.vacancy.msg3"/></strong>
						</span>
						<span class="cont_box">
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.checkCnt}" /></span>
						</span>
					</a>
				</div>
			</li>
			<li>
				<div class="contents_wrap">
					<a href="javascript:void(0);" onclick="fnSetStat('DOC_PASS', this);" class="contents_box <c:if test="${param.condApplicProcCd == 'DOC_PASS'}">on</c:if>"><!-- 활성화 됐을 경우 클래스 on 추가 -->
						<span class="title_box">
							<strong class="title"><spring:message code="mypage.compny.vacancy.msg4"/></strong>
						</span>
						<span class="cont_box">
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.paperCnt}" /></span>
						</span>
					</a>
				</div>
			</li>

			<li>
				<div class="contents_wrap">
					<a href="javascript:void(0);" onclick="fnSetStat('INTVW', this);" class="contents_box <c:if test="${param.condApplicProcCd == 'INTVW'}">on</c:if>"><!-- 활성화 됐을 경우 클래스 on 추가 -->
						<span class="title_box">
							<strong class="title"><spring:message code="offer.interview"/></strong>
						</span>
						<span class="cont_box">
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.intvwCnt}" /></span>
						</span>
					</a>
				</div>
			</li>
			<li>
				<div class="contents_wrap">
					<a href="javascript:void(0);" onclick="fnSetStat('PASS', this);" class="contents_box <c:if test="${param.condApplicProcCd == 'PASS'}">on</c:if>"><!-- 활성화 됐을 경우 클래스 on 추가 -->
						<span class="title_box">
							<strong class="title"><spring:message code="mypage.compny.vacancy.msg5"/></strong>
						</span>
						<span class="cont_box">
							<span class="cont"><fmt:formatNumber type="number" maxFractionDigits="3" value="${result.passCnt}" /></span>
						</span>
					</a>
				</div>
			</li>
		</ul>
	</div>
	<!-- //box_step -->

	<div id="applicDtlListDiv">
		<div class="bbs_info clearfix"><!-- 서브페이지에 탭 메뉴가 있을 경우 클래스 tab_confirm 추가  -->
			<strong class="currently"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.currentPageNo}" /></strong>
			<span class="total">/&nbsp;<fmt:formatNumber type="number" maxFractionDigits="3" value="${paginationInfo.totalPageCount}" /></span>
			<div class="bbs_right bbs_category">
				<fieldset>
					<input type="text" id="condText2" name="condText2" value="<c:out value="${param.condText}"/>" class="input_text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
					<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
					<input type="button" onclick="javascript:fnSetPageing('1');" value="Search" class="submit" />
				</fieldset>
			</div>
		</div>
		<!-- //bbs_info -->

		<c:if test="${!empty resultList}">
		<div class="bbs_basic">
			<ul class="recruitment_list talent clearfix">
			<c:forEach var="data" items="${resultList}" varStatus="status">
				<input type="hidden" id="htmlDataSet_${status.count}" name="htmlDataSet"
					data-applic-seq="${data.applicSeq}"
					data-vacancy-seq="${data.vacancySeq}"
					data-user-nm="${data.userNm}"
					data-age="${data.age}"
					data-gender-nm="${data.genderNm}"
					data-addr-nm="${data.addrNm}"
					data-applic-proc-cd="${data.applicProcCd}"
					data-reg-dt="${data.regDt}"
					data-fail-reason="${data.failReason}"

				>
				<li>
					<c:set var="genderCdClass" value="male"/>
					<c:if test="${data.genderCd == 'GEN0000000002'}">
						<c:set var="genderCdClass" value="female"/>
					</c:if>

					<div class="contents_wrap ${genderCdClass}"><!-- 남성일 경우 클래스 male 추가, 여성일 경우 클래스 female 추가 -->
						<div class="img_box"><img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/></div>
						<div class="contents_box"><!-- 추천일 경우 클래스 referral 추가 -->
							<div class="title_box <c:if test="${data.newYn == 'Y'}">new</c:if>"><!-- 새글일 경우 클래스 new 추가 -->
								<span class="tit">${data.iscoNm}</span>
								<a href="javascript:void(0);" onclick="fnResumeOpen('${data.applicSeq}','${data.vacancySeq}','${data.resumeSeq}');" class="title">${data.resumeTitle}</a>
							</div>
							<div class="top_box">
								<span class="name">${data.userNm}</span>
								<span class="age">
									(<span>${data.genderNm}</span> <span>${data.age}</span>)
								</span>
							</div>
							<div class="cont_box">
								<span class="con">
									<c:choose>
										<c:when test="${data.careerYn == 'Y'}">${data.totCareerTermYearCnt} year+</c:when>
										<c:otherwise><spring:message code="eduTrnng.msg4"/></c:otherwise>
									</c:choose>
								</span>
								<span class="con">${data.eduDegreeNm}</span>
								<span class="con">${data.addrNm}</span>
							</div>

							<div class="other_box type2">
								<span class="top_box">

									<c:choose>
										<c:when test="${data.applicProcCd == 'APC0000000006'}">
											<span class="tit"><a href="javascript:void(0);" onclick="fnRejectOpen2('htmlDataSet_${status.count}');" class="title">${data.applicProcNm}</a></span>

										</c:when>
										<c:otherwise>
											<span class="close">${data.applicProcNm}</span>
										</c:otherwise>
									</c:choose>



									<span>
										<label for="applicProcCd_${status.count}" class="skip">Category Selection</label>
										<select id="applicProcCd_${status.count}" name="applicProcCd" onchange="fnSetProcStat('htmlDataSet_${status.count}', this);">
											<c:forEach var="data2" items="${applicProcCd}" varStatus="status2">
												<option value="${data2.dtlCd}" <c:if test="${data.applicProcCd == data2.dtlCd}">selected</c:if>>${data2.cdNm}</option>
											</c:forEach>
										</select>
									</span>
									<button type="button" onclick="fnOnlineIntvw('${data.vacancySeq}','${data.resumeSeq}');" class="bbs_btn small">online interview</button>
								</span>
								<span class="bottom_box">
									<span class="date type3">${data.regDt}</span>
								</span>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
		</c:if>
		<!-- //bbs_basic list -->

		<c:if test="${empty resultList}">
		<div class="bbs_empty">
			<p><spring:message code="counsel.msg.no.data"/></p>
			<!-- <p>No results found. <br />Please enter a search term in the search box again.</p> -->
		</div>
		<!-- //bbs_empty -->
		</c:if>
	</div>
	<div class="bbs_btn_wrap clearfix">
		<span class="bbs_left">

		</span>
		<span class="bbs_right">
			<button type="button" onclick="fnApplicExcelDownload('${result2}');" class="bbs_btn type01"><spring:message code="button.excel.download"/></button>
	<!-- 						<a href="javascript:void(0);" onclick="fnResumeOpenList();" class="bbs_btn write">열람처리</a>
							<a href="javascript:void(0);" onclick="fnIntvwList();" class="bbs_btn write">면접제의</a> -->
		</span>
	</div>
	<!-- //bbs_btn_wrap -->

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="customRenderer" jsFunction="fnSetPageing"/>
	</div>
	<!-- //pagination -->


	<div id="dialog" style="display:none" class="bbs_popup"><!-- 팝업 가로, 세로 지정하지 않았습니다. 필요에 딸라 지정해서 사용 -->
		<section class="box_wrap">
			<div class="title_box">
				<h1 class="title"><spring:message code="mypage.compny.fail.reason.msg10"/></h1>
			</div>
			<div class="contents_box">
				<form>
					<fieldset>
						<legend>Reason for rejection</legend>

						<table class="table">
							<caption>Reason for rejection</caption>
							<colgroup>
								<col style="width:30%" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="reasonNm"><spring:message code="search.name"/></label></th>
									<td id="reasonNm"></td>
								</tr>
								<tr>
									<th scope="row"><label for="reason"><spring:message code="mypage.compny.applic.msg10"/></label></th>
									<td>
										<textarea id="failReason" name="failReason" onBlur="fnBytesHandler(this,null,2000);"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div id="dialogBtn" class="bbs_btn_wrap type2">
							<div class="bbs_center">
								<input type="button" onclick="fnApplicFailReason();" value="<spring:message code="login.stop.btn.confirm2"/>" class="bbs_btn type01 small" />
								<button type="button" onclick="fnCloseReject('dialog');" class="bbs_btn type02 small"><spring:message code="login.findPwd.btn.cancel"/></button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<button type="button" onclick="fnCloseReject('dialog');" class="close">close of popup</button>
		</section>
	</div>