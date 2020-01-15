<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script src="${pageContext.request.contextPath}/js/pageLib/login/login.js"></script>
    <script>
		$(function() {

			var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
			$("#userEmail").val(userInputId);

			if($("#userEmail").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
            	// 아이디 저장하기 체크되어있을 시,
				$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			}

			$("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
				if($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
					var userInputId = $("#userEmail").val();
					setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
				} else { // ID 저장하기 체크 해제 시,
					deleteCookie("userInputId");
			    }
			});

		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		   $("#userEmail").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            var userInputId = $("#userEmail").val();
					setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }
		    });




			common.invoker.invoke("Login");
			//$("#userAuthCd").val(USER_AUTH_CD_USER);//default tab

			$("#frm").ajaxForm({
				dataType : AJAX_DATA_TYPE_JSON,
				beforeSubmit : function(formData, $form, options) {
					if ($("#userEmail").val() == "") {
						alertify.alert("<spring:message code="login.errors.msg.id"/>", function (e){
							$("#userEmail").focus();
						});

						return false;
					}

					if ($("#password").val() == "") {
						alertify.alert("<spring:message code="login.errors.msg.pwd2"/>", function (e){
							$("#password").focus();
						});

						return false;
					}

				},
				success : function(json, statusText, xhr, $form) {

					if (json.successYn == "Y") {
						if("<c:out value="${param.retUrl}"/>" !="") {
							location.href= contextPath + "<c:out value="${param.retUrl}"/>";



						} else {
							fnGoMain();
						}
					} else {

						//alertify.alert("<spring:message code="login.errors.msg.fail5"/>", function (e){
						//	fnMoveLoginUrl("03");
						//});

						//alertify.alert("<spring:message code="login.errors.msg.pwd3month"/>", function (e){
						//	fnMoveLoginUrl("03");
						//});


						//alertify.alert("<spring:message code="login.errors.msg.stop"/>", function (e){
						//	fnMoveLoginUrl("05");
						//})

						if(json.statCd == "01") {//비밀번호오류 pwd fail
							alertify.alert(json.message, function (e){
								$("#password").val("");
							});
						} else if(json.statCd == "02") {//사용자없음 nothing user
							alertify.alert(json.message, function (e){
								$("#userEmail").val("");
								$("#password").val("");
							});
						} else if(json.statCd == "03") {//계정잠감 id lock
							alertify.alert("<spring:message code="login.errors.msg.stop"/>", function (e){
								fnMoveLoginUrl("05");
							});

						} else if(json.statCd == "04") {//비밀번호 기간 오류 pwd date over
							alertify.alert("<spring:message code="login.errors.msg.pwd3month"/>", function (e){
								fnMoveLoginUrl("04");
							});
						} else if(json.statCd == "05") {//5회이상 실패,pwd fail count 5 more
							alertify.alert("<spring:message code="login.errors.msg.fail5"/>", function (e){
								fnMoveLoginUrl("03");
							});
						}

					}
				},
				error : function(xhr) {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			});
		});


		function fnMoveLoginUrl(val) {
			var $form = $('<form></form>');
			var url = "";

			if(val == "03") {
				url = "<c:url value="/loginLock.do"/>";
			} else if(val == "04") {
				url = "<c:url value="/loginPwdOver.do"/>";
			} else if(val == "05") {
				url = "<c:url value="/loginStop.do"/>";
			}

			$form.attr('action', url);
			$form.attr('method', METHOD_POST);
			$form.appendTo('body');



			var userEmail = "<input type=\"hidden\" name=\"userEmail\" value=\""+$("#userEmail").val()+"\">";
			var userAuthCd = "<input type=\"hidden\" name=\"userAuthCd\" value=\""+$("#userAuthCd").val()+"\">";
			$form.append(userEmail).append(userAuthCd);
			$form.submit();
		}

	</script>


	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="login.title"/></span></h2>
				</div>
	      	</header>

	       	<div id="contents" class="login">
				<div class="login_box">
					<div class="box_wrap">
						<div class="contents_box">
							<form name="frm" id="frm" action="${pageContext.request.contextPath}/loginProcess.do" method="post">
								<fieldset>
									<legend><spring:message code="login.btn.login"/></legend>
									<ul>
									<li>
										<label for="userEmail" class="skip"><spring:message code="login.id"/></label>
										<input type="text" id="userEmail" name="userEmail" placeholder="ID" value="trustkst1@gmail.com" maxlength="100" />
									</li>
									<li>
										<label for="password" class="skip"><spring:message code="login.pwd"/></label>
										<input type="password" id="password" name="password" placeholder="Password" value="!Qwer12345" maxlength="15"/>
									</li>
									</ul>
									<p>
										<input type="checkbox" id="idSaveCheck" name="idSaveCheck" />
										<label for="saveId"><spring:message code="login.saveId"/></label>
									</p>
									<input type="submit" value="<spring:message code="login.btn.login"/>"/>

								</fieldset>
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
								<input id="userAuthCd" name="userAuthCd" type="hidden"/>
							</form>
						</div>
						<div class="put_box">
							<ul class="clearfix">
								<li><a href="javascript:void(0);" onclick="fnGoFindId();"><spring:message code="login.btn.findId"/></a></li>
								<li><a href="javascript:void(0);" onclick="fnGoFindPwd();"><spring:message code="login.btn.forgetPwd"/></a></li>
								<li><a href="javascript:void(0);" onclick="fnGoRegister();"><spring:message code="login.btn.signUp"/></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->