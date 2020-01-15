<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	var historyIdNum = 0;
	  	$(document).ready(function() {

	  		dext5uploadAllFileSet('dext5uploadArea', '', 'true', '20MB', '', '8', '');

	  		var fileGrpSeq = $('#fileGrpSeq').val();
	  		if(fileGrpSeq != ""){
	  			dext5AddUploadFile(fileGrpSeq);
	  		}

	  		$('.btn_fileSelect').on('click', function(){
				$('#logoImgFile').click();
    		});

	  		$('#logoImgFile').on('change', function(e){
				var files = e.target.files;
				var fileList = Array.prototype.slice.call(files);

				fileList.forEach(function(f){
					if(!f.type.match("image.*")){
						alertify.alert("<spring:message code='error.insertFile.onlyImgFile'/>");
						return false;
					}

					var reader = new FileReader();
					reader.onload = function(event){
						$('#uploadImg').attr("src", event.target.result);
					}
					reader.readAsDataURL(f);

				});
				$('#btn_imgAdd').hide();
				$('#uploadImg').show();
    		});

			<c:if test="${!empty resultList}">
				<c:forEach items="${resultList}" var="data">
					historyIdNum++;
				</c:forEach>
			</c:if>

			if("<c:out value="${dataExistYn}"/>" == "N") {//데이터가 존재하지않음
				alertify.alert("<spring:message code="info.nodata.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			//히스토리
	  		 $('input[name=trnngDt]').each(function(){
	     		$(this).datepicker({
	    			dateFormat: 'dd/mm/yy', //Input Display Format 변경
	    			showOn: "both"
	    		});

	    		$(this).datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	  		 });
		});

	  	function fnPrgmHistoryAdd() {
	  		historyIdNum++;
			$.ajax({
				url: contextPath + "/cpes/instt/member/prgmHistoryFormAjax.do",
				method: METHOD_POST,
				data: {
					idNum: historyIdNum
				},
				dataType: AJAX_DATA_TYPE_HTML
			})
			.done(function(data) {
				$("#historyUlId").append(data);
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	  	}

	  	function fnPrgmHistoryDel(obj) {
	  		var delLiId = $(obj).parent().parent().parent().attr("id");
	  		$("#"+delLiId).remove();
	  	}

		function fnResetForm() {
		    $('#frm')[0].reset();
		}

		function fnFileUploadSave(){
	  		dext5UploadTransfer(fnSave);
	  	}

		function fnSave() {
			if($("#insttProfile").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg"/>", function (e){
					$("#insttProfile").focus();
				});
				return false;
			}

			//히스토리
			var dtChk = true;
			var dtArr = new Array;

	  		$('input[name=trnngDt]').each(function(){
	  			var inputId = $(this).attr("id");

	  			if($(this).val() == "") {
					alertify.alert("<spring:message code="mypage.instt.profile.errors.msg"/>", function (e){
						$("#"+inputId).focus();
					});
					dtChk = false;
					return false;
	  			}
	  			dtArr.push($(this).val());
	  		});


			if(dtChk == false) {
				return false;
			}
			$("#trnngDtStr").val(dtArr.join(","));

			var nmChk = true;
			var nmArr = new Array;
	  		$('input[name=trnngNm]').each(function(){
	  			var inputId = $(this).attr("id");

	  			if($(this).val() == "") {
					alertify.alert("<spring:message code="mypage.instt.profile.errors.msg2"/>", function (e){
						$("#"+inputId).focus();
					});
					nmChk = false;
					return false;
	  			}
	  			nmArr.push($(this).val());
	  		});

			if(nmChk == false) {
				return false;
			}
			$("#trnngNmStr").val(nmArr.join(","));

			var idChk = true;
			var idArr = new Array;
	  		$('input[name=eduProgramId]').each(function(){
	  			var inputId = $(this).attr("id");

	  			if($(this).val() == "") {
					alertify.alert("<spring:message code="mypage.instt.profile.errors.msg3"/>", function (e){
						$("#"+inputId).focus();
					});
					idChk = false;
					return false;
	  			}
	  			idArr.push($(this).val());
	  		});

			if(idChk == false) {
				return false;
			}
			$("#eduProgramIdStr").val(idArr.join(","));

			if($('#logoImgFile').val() != ""){
				var form = $('#imgUploadForm')[0];
				var formData = new FormData(form);
				formData.append("uploadFile", $('#logoImgFile')[0].files[0]);

				$.ajax({
					type: 'post',
					url: contextPath + "/cpes/instt/member/insttLogoImgUpdate.do",
					dataType: 'json',
					data: formData,
					contentType: false,
					processData: false,
					success: function(data) {

					},
					error: function(xhr, status, error) {
						alertify.alert("<spring:message code="errors.ajax.fail"/>");
						return false;
					}
				});
			}

			$.ajax({
				url: contextPath + "/cpes/instt/member/profileModifyProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.update.ok"/>");

				} else {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});

		}

  	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.profile.title25"/></span>
					</h2>
				</div>
	      	</header>
	       	<div id="contents" class="insttMemberProfileModify">

			<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/instt/member/profileModifyProcessAjax.do" method="post">
				<input type="hidden" id="insttSeq" name="insttSeq" value="${result.insttSeq}"/>
				<input type="hidden" id="eduProgramIdStr" name="eduProgramIdStr"/>
				<input type="hidden" id="trnngDtStr" name="trnngDtStr"/>
				<input type="hidden" id="trnngNmStr" name="trnngNmStr"/>
				<input type="hidden" id="commonUploadResult" name="uploadResult">
				<input type="hidden" id="fileGrpSeq" name="fileGrpSeq" value="${result.fileGrpSeq }">

				<fieldset>
					<legend>Institution Profile</legend>

					<div class="recruitment_bottom type2"><!-- 프로필 사용할 때 type2 추가 -->
						<div class="contents_wrap">
							<div class="img_box">
								<c:choose>
									<c:when test="${empty result.filePath }">
										<button id="btn_imgAdd" type="button" class="add_photo btn_fileSelect">Add Logo</button>
										<img id="uploadImg" src="../../images/board/dummy_photo.png" alt="" class="photo btn_fileSelect" style="display: none; cursor: pointer;"/>
									</c:when>
									<c:otherwise>
										<button id="btn_imgAdd" type="button" class="add_photo btn_fileSelect" style="display: none;">Add Logo</button>
										<img id="uploadImg" src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result.filePath}" alt="" class="photo btn_fileSelect" style="cursor: pointer;"/>
									</c:otherwise>
								</c:choose>
								<form id="imgUploadForm">
									<input type="file" id="logoImgFile" name="logoImgFile" style="display: none;">
								</form>
							</div>
							<div class="title_box">
								<div class="tit_box">
									<strong class="title">${result.insttNm}</strong>
								</div>
							</div>
							<div class="contents_box">
								<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title33"/></strong>
										<span class="con">${result.insttOfficeTel}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="login.stop.email"/></strong>
										<span class="con">${result.insttEmail}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
										<span class="con"><a href="${result.insttWebsite}" target="_blank" title="open new window" class="em_blue">${result.insttWebsite}</a></span>
									</div>
								</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.compny.profile.title25"/></h3>
						<span class="cont"><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span>
					</div>
					<ul class="form_list type2 clearfix">
						<li>
							<div class="form_list_wrap">
								<div class="form_list_title">
									<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <label for="insttProfile"><spring:message code="mypage.compny.profile.title26"/></label></strong>
								</div>
								<div class="form_list_contents">
									<textarea id="insttProfile" name="insttProfile" onBlur="javascript:fnBytesHandler(this,null,4000);">${result.insttProfile}</textarea>
								</div>
							</div>
						</li>
						<li>
							<div class="form_list_wrap">
								<div class="form_list_title">
									<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <label for="institute_background"><spring:message code="mypage.compny.profile.title27"/></label></strong>
								</div>
								<div class="form_list_contents add_program">
									<ul id="historyUlId">
										<c:if test="${empty resultList}">
										<li id="historyLiId">
											<div class="contents_box">
												<div class="cont_box">
													<span class="bbs_time">
														<label for="trnngDt" class="skip">date</label>
														<input type="text" id="trnngDt" name="trnngDt" readonly>

													</span>
													<span class="name">
														<label for="trnngNm" class="skip"><spring:message code="mypage.instt.eduTrnng.title4"/></label>
														<input type="text" id="trnngNm" name="trnngNm" maxlength="200" placeholder="<spring:message code="mypage.instt.eduTrnng.title4"/>" />
													</span>
													<span class="id">
														<label for="eduProgramId" class="skip"><spring:message code="mypage.instt.eduTrnng.title34"/></label>
														<input type="text" id="eduProgramId" name="eduProgramId" maxlength="50" placeholder="<spring:message code="mypage.instt.eduTrnng.title34"/>" />
													</span>
												</div>
												<div class="button_box">
													<button type="button" class="add" onclick="fnPrgmHistoryAdd('historyUlId');">add</button>
												</div>
											</div>
										</li>
										</c:if>
										<c:if test="${!empty resultList}">
											<c:forEach var="data" items="${resultList}" varStatus="status">
												<li id="historyLiId_${status.count}">
													<div class="contents_box">
														<div class="cont_box">
															<span class="bbs_time">
																<label for="trnngDt_${status.count}" class="skip">date</label>
																<input type="text" id="trnngDt_${status.count}" name="trnngDt" value="${data.trnngDt}" readonly >

															</span>
															<span class="name">
																<label for="trnngNm_${status.count}" class="skip"><spring:message code="mypage.instt.eduTrnng.title4"/></label>
																<input type="text" id="trnngNm_${status.count}" name="trnngNm" value="${data.trnngNm}" maxlength="200" placeholder="<spring:message code="mypage.instt.eduTrnng.title4"/>" />
															</span>
															<span class="id">
																<label for="eduProgramId_${status.count}" class="skip"><spring:message code="mypage.instt.eduTrnng.title34"/></label>
																<input type="text" id="eduProgramId_${status.count}" name="eduProgramId" value="${data.eduProgramId}" maxlength="50" placeholder="<spring:message code="mypage.instt.eduTrnng.title34"/>" />
															</span>
														</div>
														<div class="button_box">
															<button type="button" class="add" onclick="fnPrgmHistoryAdd();"><spring:message code="mypage.instt.eduTrnng.title13"/></button>
															<c:if test="${status.count > 1}">
															<button type="button" class="del" onclick="fnPrgmHistoryDel(this);"><spring:message code="button.delete"/></button>
															</c:if>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:if>

									</ul>
								</div>
							</div>
						</li>
					</ul>

					<div class="form_title">
						<h3><spring:message code="mypage.compny.profile.title28"/> <span>※ <spring:message code="mypage.compny.profile.title3"/></span></h3>
					</div>
					<div class="form_photo">
						<div id="dext5uploadArea"></div>
					</div>

					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<a href="javascript:void(0);" onClick="fnResetForm();" class="btn type2 margin_r_5"><spring:message code="login.findPwd.btn.cancel"/></a>
							<input type="button" class="btn type1" onclick="fnFileUploadSave();" value="<spring:message code="button.save"/>" />
						</div>
					</div>

				</fieldset>
			</form>

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->

