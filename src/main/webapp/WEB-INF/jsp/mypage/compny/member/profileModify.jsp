<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>

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

		});

	  	function fnFileUploadSave(){
	  		dext5UploadTransfer(fnSave);
	  	}

	  	function fnSave() {
			//기업 프로필
			if($("#profile").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg"/>", function (e){
					$("#profile").focus();
				});
				return false;
			}

			//총근로자 수
			if($("#employeeTotCnt").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg2"/>", function (e){
					$("#employeeTotCnt").focus();
				});
				return false;
			}

			//여성 근로자 수
			if($("#femaleEmployeeTotCnt").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg3"/>", function (e){
					$("#femaleEmployeeTotCnt").focus();
				});
				return false;
			}

			//장애인 근로자 수
			if($("#forgnerTotCnt").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg4"/>", function (e){
					$("#forgnerTotCnt").focus();
				});
				return false;
			}

			//외국인 근로자 수
			if($("#employeeTotCnt").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg5"/>", function (e){
					$("#employeeTotCnt").focus();
				});
				return false;
			}

			// 주소 구글맵 링크
			if($("#googleMapLink").val() == "") {
				alertify.alert("<spring:message code="mypage.compny.profile.errors.msg6"/>", function (e){
					$("#googleMapLink").focus();
				});
				return false;
			}

			if(!fnValidUrl($("#googleMapLink").val())) {
				alertify.alert("<spring:message code="member.join.step.two.compnay.errors.msg7"/>", function (e){
					$("#googleMapLink").focus();
				});
				return false;
			}

			if($('#logoImgFile').val() != ""){
				var form = $('#imgUploadForm')[0];
				var formData = new FormData(form);
				formData.append("uploadFile", $('#logoImgFile')[0].files[0]);

				$.ajax({
					type: 'post',
					url: contextPath + "/cpes/compny/member/companyLogoImgUpdate.do",
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
				url: contextPath + "/cpes/compny/member/profileModifyProcessAjax.do",
				type: 'post',
				data: $("#frm").serialize(),
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert("<spring:message code="counsel.msg.update.ok"/>");

				} else {
	 				var msg = "<spring:message code="login.findId.no.data"/>";
					if(data.result.statCd == "03") {
						msg = "<spring:message code="errors.ajax.fail"/>";
					}
					alertify.alert(msg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});

	  	}





		function fnResetForm() {
		    $('#frm')[0].reset();
		}

  	</script>
	<main class="colgroup" id="colgroup">
		<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="mypage.compny.profile.title"/></span></h2>
				</div>
          	</header>
			<div id="contents" class="memberProfileModify">
			<form id="frm" name="frm" action="${pageContext.request.contextPath}/cpes/compny/member/profileModifyProcessAjax.do" method="post">
				<input type="hidden" id="commonUploadResult" name="uploadResult">
				<input type="hidden" id="fileGrpSeq" name="fileGrpSeq" value="${result.fileGrpSeq }">
				<fieldset>
					<legend>Institution Profile</legend>

					<div class="recruitment_bottom type2"><!-- 프로필 사용할 때 type2 추가 -->
						<div class="contents_wrap">
							<div class="img_box">
								<c:choose>
									<c:when test="${empty result2 }">
										<button id="btn_imgAdd" type="button" class="add_photo btn_fileSelect">Add Logo</button>
										<img id="uploadImg" src="../../images/board/dummy_photo.png" alt="" class="photo btn_fileSelect" style="display: none; cursor: pointer;"/>
									</c:when>
									<c:otherwise>
										<button id="btn_imgAdd" type="button" class="add_photo btn_fileSelect" style="display: none;">Add Logo</button>
										<img id="uploadImg" src="${pageContext.request.contextPath}/common/imgLoading.do?url=${result2.saveFilePath}" alt="" class="photo btn_fileSelect" style="cursor: pointer;"/>
									</c:otherwise>
								</c:choose>
								<form id="imgUploadForm">
									<input type="file" id="logoImgFile" name="logoImgFile" style="display: none;">
								</form>
							</div>
							<div class="title_box">
								<div class="tit_box">
									<strong class="title">${result.compnyNm}</strong>
								</div>
							</div>
							<div class="contents_box">
								<ul class="clearfix">
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="mypage.instt.eduTrnng.title33"/></strong>
										<span class="con">${result.mngerTel}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="login.stop.email"/></strong>
										<span class="con">${result.mngerEmail}</span>
									</div>
								</li>
								<li>
									<div class="cont">
										<strong class="tit"><spring:message code="member.join.step.two.compnay.msg15"/></strong>
										<span class="con"><a href="${result.compnyWebsite}" target="_blank" title="open new window" class="em_blue">${result.compnyWebsite}</a></span>
									</div>
								</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="form_title type2">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.compny.profile.title"/></h3>
						<span class="cont"><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span>
					</div>
					<ul class="form_list type2 clearfix">
						<li>
							<div class="form_list_wrap">
								<div class="form_list_title">
									<strong class="title"><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <label for="profile"><spring:message code="mypage.compny.profile.title2"/></label></strong>
								</div>
								<div class="form_list_contents">
									<textarea id="profile" name="profile" onBlur="javascript:fnBytesHandler(this,null,4000);">${result.profile}</textarea>
								</div>
							</div>
						</li>
					</ul>

					<div class="form_title">
						<h3><span class="bbs_ico necessary"><spring:message code="member.join.msg.required"/></span> <spring:message code="mypage.compny.profile.title4"/></h3>
					</div>
					<table class="bbs_table write type2">
						<caption>General information Input</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:75%" />
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="employeeTotCnt"><spring:message code="mypage.compny.profile.title5"/></label></th>
							<td><input type="text" id="employeeTotCnt" name="employeeTotCnt" value="${result.employeeTotCnt}" maxlength="6" onKeyPress="return fnCheckNumber(event);" /></td>
						</tr>
						<tr>
							<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="femaleEmployeeTotCnt"><spring:message code="mypage.compny.profile.title6"/></label></th>
							<td><input type="text" id="femaleEmployeeTotCnt" name="femaleEmployeeTotCnt" value="${result.femaleEmployeeTotCnt}" maxlength="6" onKeyPress="return fnCheckNumber(event);" /></td>
						</tr>
						<tr>
							<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="disablEmployeeTotCnt"><spring:message code="mypage.compny.profile.title7"/></label></th>
							<td><input type="text" id="disablEmployeeTotCnt" name="disablEmployeeTotCnt" value="${result.disablEmployeeTotCnt}" maxlength="6" onKeyPress="return fnCheckNumber(event);"/></td>
						</tr>
						<tr>
							<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="forgnerTotCnt"><spring:message code="mypage.compny.profile.title8"/></label></th>
							<td><input type="text" id="forgnerTotCnt" name="forgnerTotCnt" value="${result.forgnerTotCnt}" maxlength="6" onKeyPress="return fnCheckNumber(event);" /></td>
						</tr>
						<tr>
							<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="googleMapLink"><spring:message code="mypage.compny.profile.title9"/></label></th>
							<td class="subject"><input type="text" id="googleMapLink" name="googleMapLink" value="${result.googleMapLink}" maxlength="300" /></td>
						</tr>
						</tbody>
					</table>

					<div class="form_title">
						<h3>Photo <span>※  <spring:message code="mypage.compny.profile.title3"/></span></h3>
					</div>
					<div class="form_photo">
						<%-- <ul class="clearfix">
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<img src="${pageContext.request.contextPath}/images/board/dummy.png" alt="image" />
								<!-- <button type="button" class="add_photo">Add Photo</button> -->
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						<li>
							<div class="img_box"><!-- 이미지 등록되었을 경우 이미지 노출 -->
								<!-- <img src="../../images/board/dummy.png" alt="image" /> -->
								<button type="button" class="add_photo">Add Photo</button>
							</div>
						</li>
						</ul> --%>
						<div id="dext5uploadArea"></div>
					</div>

					<div class="bbs_btn_wrap">
						<div class="bbs_center">
							<button type="button"  onclick="fnResetForm();" class="bbs_btn type01"><spring:message code="login.findPwd.btn.cancel"/></button>
							<input type="button" onclick="fnFileUploadSave();" value="<spring:message code="button.save"/>" class="bbs_btn type02" />
						</div>
					</div>

				</fieldset>
			</form>
			</div>
       	<!-- //contents -->
    	</article>
	</main>
   <!-- //main.colgroup -->
