<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
<script>
  	$(document).ready(function() {

  		$('#all_check').on('click', function(){
  			var $check = $(this);
  			if($check.prop('checked')){
  				$('.signup_checkbox').find('input:radio:first-child').prop('checked', true);
  			}else{
  				$('.signup_checkbox').find('input:radio').prop('checked', true);
  				$('.signup_checkbox').find('input:radio:first-child').prop('checked', false);
  			};			
		});
  		
		$("#frm").submit(function(event) {
			//event.preventDefault();



			if(!$("input:radio[name='membTacAgreeYn']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.one.errors.msg1"/>", function (e){
					$("input:radio[name='membTacAgreeYn']").focus();
				});

				return false;
			}


			if(!$("input:radio[name='privateInfoCollctAgreeYn']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.one.errors.msg2"/>", function (e){
					$("input:radio[name='privateInfoCollctAgreeYn']").focus();
				});

				return false;
			}


			if(!$("input:radio[name='infoProvdInfoAgreeYn']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.one.errors.msg3"/>", function (e){
					$("input:radio[name='infoProvdInfoAgreeYn']").focus();
				});

				return false;
			}

			if(!$("input:radio[name='emailNtceAgreeYn']").is(":checked")) {
				alertify.alert("<spring:message code="member.join.step.one.errors.msg4"/>", function (e){
					$("input:radio[name='emailNtceAgreeYn']").focus();
				});

				return false;
			}


		});

	});
  </script>



<form id="frm" name="frm" action="${pageContext.request.contextPath}/member/joinStepTwo.do" method="post">
	<input type="hidden" id="userAuthCd" name="userAuthCd"/>
	<fieldset>
		<legend>Get consent</legend>
		<div class="signup_checkbox">
			<div class="title_box">
				<h3 class="h0"><spring:message code="member.join.msg.agree"/> <strong>(<spring:message code="member.join.msg.required"/>)</strong></h3>
			</div>
			<div class="cont_box">
				<div class="cont">
					Terms of services will be displayed(NEA 회원약관 동의 html)
				</div>
			</div>

			<div class="put_box">
				<input type="radio" name="membTacAgreeYn" id="membTacAgreeYn_1" value="Y"/>
				<label for="membTacAgreeYn_1"><spring:message code="member.join.msg.agree.ok"/></label>
				<input type="radio" name="membTacAgreeYn" id="membTacAgreeYn_2" value="N"/>
				<label for="membTacAgreeYn_2"><spring:message code="member.join.msg.agree.no"/></label>
			</div>
		</div>

		<div class="signup_checkbox">
			<div class="title_box">
				<h3 class="h0"><spring:message code="member.join.msg.agree2"/> <strong>(<spring:message code="member.join.msg.required"/>)</strong></h3>
			</div>
			<div class="cont_box">
				<div class="cont">
					Agree on the Personal Information Collection(개인정보 수집 이용동의  html)
				</div>
			</div>
			<div class="put_box">
				<input type="radio" name="privateInfoCollctAgreeYn" id="privateInfoCollctAgreeYn_1" value="Y"/>
				<label for="privateInfoCollctAgreeYn_1"><spring:message code="member.join.msg.agree.ok"/></label>
				<input type="radio" name="privateInfoCollctAgreeYn" id="privateInfoCollctAgreeYn_2" value="N"/>
				<label for="privateInfoCollctAgreeYn_2"><spring:message code="member.join.msg.agree.no"/></label>
			</div>
		</div>

		<div class="signup_checkbox">
			<div class="title_box">
				<h3 class="h0"><spring:message code="member.join.msg.agree3"/> <strong>(<spring:message code="member.join.msg.required"/>)</strong></h3>
			</div>
			<div class="cont_box">
				<div class="cont">
					Guidance on Third Party Offerings(제 3자 제공에 대한 안내 html)
				</div>
			</div>

			<div class="put_box">
				<input type="radio" name=infoProvdInfoAgreeYn id="infoProvdInfoAgreeYn_1" value="Y"/>
				<label for="infoProvdInfoAgreeYn_1"><spring:message code="member.join.msg.agree.ok"/></label>
				<input type="radio" name="infoProvdInfoAgreeYn" id="infoProvdInfoAgreeYn_2" value="N"/>
				<label for="infoProvdInfoAgreeYn_2"><spring:message code="member.join.msg.agree.no"/></label>
			</div>


		</div>

		<div class="signup_checkbox">
			<div class="title_box">
				<h3 class="h0"><spring:message code="member.join.msg.agree4"/> <strong class="type2">(<spring:message code="member.join.msg.choice"/>)</strong></h3>
			</div>
			<div class="cont_box">
				<div class="cont">
					NEA provides various notifications on job fairs, event, seminar etc. through e-mail and SMS.(이메일 문자 수신동의 html)
				</div>
			</div>


			<div class="put_box">
				<input type="radio" name="emailNtceAgreeYn" id="emailNtceAgreeYn_1" value="Y" />
				<label for="emailNtceAgreeYn_1"><spring:message code="member.join.msg.agree.ok"/></label>
				<input type="radio" name="emailNtceAgreeYn" id="emailNtceAgreeYn_2" value="N" />
				<label for="emailNtceAgreeYn_2"><spring:message code="member.join.msg.agree.no"/></label>
			</div>
		</div>
		
		<p>NEA provides various notifications on job fairs, event, seminar etc. through e-mail and SMS. <label for="all_check" class="bbs_right"><input type="checkbox" id="all_check" /> All consend</label></p>

		<div class="box_center">
			<a href="javascript:fnGoMain();" class="btn type2 margin_r_5"><spring:message code="member.join.btn.cancel"/></a>
			<input type="submit" class="btn type1" value="<spring:message code="member.join.btn.next"/>" />
		</div>
	</fieldset>
</form>

