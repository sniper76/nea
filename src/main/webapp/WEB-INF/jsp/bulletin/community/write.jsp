<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {

    		CKEDITOR.replace('content', {
    			height: 500,
    			filebrowserImageUploadUrl: contextPath + '/common/ckeditorImgUpload.do'
    		});
			// ckeditor 입력값
			// CKEDITOR.instances.(ckeditor가 적용된 요소의 id).getData();
			// ex) CKEDITOR.instances.content.getData();
    		// ex) CKEDITOR.instances.content.setData('test');


			if("<c:out value="${connYn}"/>" == "N") {//잘못된 접근
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			$('#btn_submit').on('click', function(){

				var contentVal = CKEDITOR.instances.content.getData();

				if(contentVal == "") {
					alertify.alert("<spring:message code="counsel.errors.contents"/>", function (e){
						$("#content").focus();
					});
					return false;
				}else{
					$('#contentForm').val(contentVal);
				}

				$("#frm").submit();

			});

			$("#frm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {

					//제목,title
					if($("#title").val() == "") {
						alertify.alert("<spring:message code="counsel.errors.title"/>", function (e){
							$("#title").focus();
						});
						return false;
					}

					//내용,content ckeditor 로 변경
					/* if($("#content").val() == "") {
						alertify.alert("<spring:message code="counsel.errors.contents"/>", function (e){
							$("#content").focus();
						});
						return false;
					} */

				},
				success : function(json, statusText, xhr, $form) {
					if (json.result.successYn == "Y") {
						alertify.alert("<spring:message code="counsel.msg.reg.ok"/>", function (e){
							fnGoMoveUrl('frmSearch', '${pageContext.request.contextPath}/community/list.do');
						});

					} else {
						if(json.result.statCd == "01") {
							alertify.alert("<spring:message code="bulletin.errors.login.after"/>", function (e){
								location.href= contextPath + "/community/list.do"
							});
							return false;
						} else {
							alertify.alert("<spring:message code="errors.ajax.fail"/>");
						}
					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});

		});

	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><c:out value="${result.bulletinNm}"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="communityWrite">
				<input type="hidden" id="banwordListStr" value="${banwordList}">
				<div class="bbs_basic">
					<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/community/list.do" method="post">
						<input type="hidden" id="condType" name="condType" value="${param.condType}"/>
						<input type="hidden" id="condText" name="condText" value="${param.condText}"/>
						<input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo}"/>
						<input type="hidden" id="condSort" name="condSort" value="${param.condSort}"/>
					</form>
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/community/writeProcessAjax.do" method="post">
						<input type="hidden" id="bulletinMngSeq" name="bulletinMngSeq" value="${result.bulletinMngSeq}"/>
						<input type="hidden" id="contentForm" name="content" value=""/>

						<fieldset>
							<legend>Write a post</legend>
							<div class="bbs_write_top"><span><span class="exactly y"><spring:message code="member.join.msg.required"/></span><spring:message code="member.join.msg.required"/></span></div>
							<table class="bbs_table write">
								<caption><c:out value="${result.bulletinNm}"/>  Write</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:85%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span class="exactly y"><spring:message code="member.join.msg.required"/></span> <label for="title"><spring:message code="member.join.msg.required"/></label></th><!-- 필수 황목일 경우 exacly 에 클래스 y 추가 -->
										<td class="subject"><input type="text" id="title" name="title" placeholder="Input Title" maxlength="100" /></td><!-- 인풋 100%여야 할 경우 td에 클래스 subject 추가 또는 style="width:100%;" 추가 -->
									</tr>
									<tr>
										<td colspan="2">
											<label for="content" class="skip"><spring:message code="bulletin.msg.content"/></label>
											<textarea id="content" cols="30" rows="10" title="Contents" class="bbs_write_content"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- //bbs_table write -->

							<div class="bbs_btn_wrap clearfix">
								<span class="bbs_left">
									<a href="javascript:fnGoList('frmSearch');" class="bbs_btn list"><spring:message code="button.list"/></a>
								</span>
								<span class="bbs_right">
									<input type="button" id="btn_submit" value="<spring:message code="button.create"/>" class="bbs_btn write" />
									<a href="javascript:fnClearForm('frm');" class="bbs_btn cancel"><spring:message code="login.findPwd.btn.cancel"/></a>
								</span>
							</div>
							<!-- //bbs_btn_wrap -->

						</fieldset>
					</form>

				</div>
				<!-- //bbs_basic write -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->