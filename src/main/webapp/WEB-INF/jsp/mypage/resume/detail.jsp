<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
    		var insertCompleteMsg = "<spring:message code='bookMark.insertComplete'/>";
    		var deleteCompleteMsg = "<spring:message code='bookMark.deleteComplete'/>";

			$('.btn_bookMark').on('click', function(e){
				var cateCd = $('#cateCd').val();
				var tableKeySeq = $('#tableKeySeq').val();
				var bkmkSeq = $('#bkmkSeq').val();

				$.ajax({
					type: 'post',
					url: contextPath + "/cpes/all/bookMarkAjax.do",
					dataType: 'json',
					data: {
						"cateCd" : cateCd,
						"tableKeySeq" : tableKeySeq,
						"bkmkSeq" : bkmkSeq
					},
					success: function(data) {
						var msg = "";
						if(bkmkSeq == ""){
							msg = insertCompleteMsg;
						}else{
							msg = deleteCompleteMsg;
						}

						if(data.result.successYn == "Y"){
							alertify.alert(msg, function(){
								$('#bkmkSeq').val(data.result.returnVal);
							});
						}else{
							alertify.alert(errorMsg);
						}

					},
					error: function(xhr, status, error) {
						alertify.alert(errorMsg);
					}
				});
			});
		});

    	function goResumeList(){
    		//location.href = contextPath + "/cpes/private/resume/list.do";
    		history.back();
    	}

    	function goResumeUpdate(){
    		$('#detailForm').attr('action', contextPath + '/cpes/private/resume/updateResume.do');
			$('#detailForm').submit();
    	}

	</script>
<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span><spring:message code="resume.text.resumeDetail"/></span></h2>
			</div>
		</header>

		<div id="contents" class="resumeDetail">
			<form id="detailForm" method="post">
				<input type="hidden" id="resumeSeq" name="resumeSeq" value="${resumeDetail.resumeSeq}">
				<input type="hidden" id="tempFlag" name="tempFlag" value="${paramInfo.tempFlag}">
				<input type="hidden" id="cateCd" name="cateCd" value="USER_CD">
				<input type="hidden" id="tableKeySeq" name="tableKeySeq" value="${resumeDetail.userSeq}">
				<input type="hidden" id="bkmkSeq" name="bkmkSeq" value="${resumeDetail.bkmkSeq}">
			</form>

			<div class="profile_title view">
				<h3 class="h0 title"><c:out value="${resumeDetail.resumeTitle }" escapeXml="false" /></h3>
			</div>

			<div class="profile_box">
				<div class="img_box"><!-- 등록된 사진이 있는 경우 주석 사용 -->
					<img id="uploadImg" src="${pageContext.request.contextPath}/common/imgLoading.do?url=${resumeDetail.filePath}" alt="" class="photo" onerror="fnNoImage(this)"/>
				</div>
				<div class="contents_box">
					<div class="title_box">
						<strong class="title">${masking:getNmMasking(memberBean.userNm, resumeDetail.displayYn)}</strong>
					</div>
					<div class="cont_box">
						<ul class="clearfix">
						<li>
							<div class="cont">
								<strong class="title">email</strong>
								<span class="con">${masking:getEmailMasking(memberBean.userEmail, resumeDetail.displayYn)}</span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="title">Mobile</strong>
								<span class="con">${masking:getPhoneNumberMasking(memberBean.userCell, resumeDetail.displayYn)}</span>
							</div>
						</li>
						<li>
							<div class="cont">
								<strong class="title">address</strong>
								<span class="con">
									<address>
										<c:out value="${memberBean.addrCdNm }" escapeXml="false"/>
										<c:out value="${memberBean.addrDtl }" escapeXml="false"/>
									</address>
								</span>
							</div>
						</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //profile_box -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.personalInformation"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.placeOfBirth"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.addrFullNm}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box count4">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.maritalStatus"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.marriCdNm}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.insertFamilyCnt"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.familyCnt}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.insertUnderAge15"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.underAge15FamilyCnt}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.insertOverAge65"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.overAge64FamilyCnt}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box">
						<div class="view_form">
							<strong class="title">해당하는 사항이 있다면 체크해 주세요</strong>
							<p class="cont_box">Street Kmapuchea Krom, Sangkat Teuk Laak1, Phonm penh</p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box count2">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.insertDisabl"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.disablYn}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title">any disabilities</strong>
							<p class="cont_box">
								<c:forEach items="${disableList }" var="disable" varStatus="stat">
									<c:choose>
										<c:when test="${stat.count eq 1 }">
											<c:out value="${disable.disableCdNm}" escapeXml="false"/>
										</c:when>
										<c:otherwise>
											, <c:out value="${disable.disableCdNm}" escapeXml="false"/>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box count2">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.insertSelfemp"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.selfempYn}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.insertUrgentJobseek"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.urgentJobseekYn}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.workingConditions"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box count4">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.preferJobTitle"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.preferJobTitle}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.preferPosition"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.preferPosition}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.hopeJob"/></strong>
							<p class="cont_box">
								<c:forEach items="${iscoList }" var="iscoCd" varStatus="stat">
									<c:choose>
										<c:when test="${stat.count eq 1 }">
											<c:out value="${iscoCd.iscoCdNm}" escapeXml="false"/>
										</c:when>
										<c:otherwise>
											, <c:out value="${iscoCd.iscoCdNm}" escapeXml="false"/>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</p>
						</div>
					</div>
					<!-- //view_box -->

					<!-- <div class="view_box">
						<div class="view_form">
							<strong class="title">희망 부문</strong>
							<p class="cont_box">Street Kmapuchea Krom, Sangkat Teuk Laak1, Phonm penh</p>
						</div>
					</div> -->
					<!-- //view_box -->

					<div class="view_box">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.hopeLocCd"/></strong>
							<p class="cont_box">
								<c:forEach items="${hopeWorkLocList }" var="hopeWork" varStatus="stat">
									<c:choose>
										<c:when test="${stat.count eq 1 }">
											<c:out value="${hopeWork.addrCdNm}" escapeXml="false"/>
										</c:when>
										<c:otherwise>
											, <c:out value="${hopeWork.addrCdNm}" escapeXml="false"/>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.employFormCd"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.employFormCdNm}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box count4">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.preferEmployTypeCd"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.preferEmployTypeCdNm}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.typeEmployHourDay"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.typeEmployHourDay}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.typeEmployDayWeek"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.typeEmployDayWeek}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.hopeWorkDay"/></strong>
							<p class="cont_box">
								<c:if test="${resumeDetail.preferDayMon eq 'Y'}">Monday. </c:if>
								<c:if test="${resumeDetail.preferDayTue eq 'Y'}">Tuesday. </c:if>
								<c:if test="${resumeDetail.preferDayWed eq 'Y'}">Wednesday. </c:if>
								<c:if test="${resumeDetail.preferDayThu eq 'Y'}">Thursday. </c:if>
								<c:if test="${resumeDetail.preferDayFri eq 'Y'}">Friday. </c:if>
								<c:if test="${resumeDetail.preferDaySat eq 'Y'}">Saturday. </c:if>
								<c:if test="${resumeDetail.preferDaySun eq 'Y'}">Sunday. </c:if>
							</p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box count2">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.preferCrtctType"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.preferCrtctTypeNm}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.overtimeAvailability"/></strong>
							<p class="cont_box">
								<c:if test="${resumeDetail.nightWorkYn eq 'Y'}">Night shift(pm 10:00~am 05:00). </c:if>
								<c:if test="${resumeDetail.overTimeWorkYn eq 'Y'}">Overtime. </c:if>
								<c:if test="${resumeDetail.hldayWorkYn eq 'Y'}">Work on Sunday/Public Holidays. </c:if>
							</p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box count2">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.expctSalaryAmt"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.expctMinSalaryAmt}" escapeXml="false"/> ~ <c:out value="${resumeDetail.expctMaxSalaryAmt}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.diffProvcWork"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.diffProvcWorkYn}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.workBgnAble"/></strong>
							<p class="cont_box"><c:out value="${resumeDetail.workBgnAbleYn}" escapeXml="false"/> / <c:out value="${resumeDetail.workBgnAbleWithin}" escapeXml="false"/> Month</p>
						</div>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.eduproFessionalTraining"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box count2">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.eduDegreeCd"/></strong>
							<p class="cont_box"><c:out value="${genrlEdu.eduDegreeCdNm}" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.technicalVocational"/></strong>
							<p class="cont_box">Street Kmapuchea Krom, Sangkat Teuk Laak1, Phonm penh</p>
						</div>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.researchAndSpecialty"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<c:forEach items="${specialStudyList }" var="specialStudy" varStatus="stat">

							<div class="view_form type2">
								<strong class="title"><c:out value="${specialStudy.specialStudyNm}" escapeXml="false"/></strong><!-- 연구/전문 분야명 -->
								<div class="cont_box">
									<span class="cont"><c:out value="${specialStudy.insttNm}" escapeXml="false"/></span><!-- 교육기관명 -->
									<span class="cont"><c:out value="${specialStudy.cntryCdNm}" escapeXml="false"/></span><!-- 국가 -->
									<span class="cont"><c:out value="${specialStudy.provcCdNm}" escapeXml="false"/></span><!-- 시/도 -->
									<span class="cont">
										<c:out value="${specialStudy.bgnDtMm}" escapeXml="false"/>/<c:out value="${specialStudy.bgnDtYy}" escapeXml="false"/> ~
										<c:out value="${specialStudy.endDtMm}" escapeXml="false"/>/<c:out value="${specialStudy.endDtYy}" escapeXml="false"/>
									</span><!-- 연구기간 -->
								</div>
							</div>
							<!-- //view_box -->
						</c:forEach>

					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.certificate"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<c:forEach items="${resumeDetail.proLicnsSpecList }" var="proLicnsSpec" varStatus="stat">
							<div class="view_form type3">
								<div class="cont_box"><c:out value="${proLicnsSpec}" /></div>
							</div>
						</c:forEach>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.otherEducation"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<c:forEach items="${otherTrnngList}" var="otherTrnng" varStatus="stat">

							<div class="view_form type2">
								<strong class="title"><c:out value="${otherTrnng.trnngEduDegreeCd}" escapeXml="false"/></strong><!-- 전공/전문/분야 -->
								<div class="cont_box">
									<strong class="cont"><c:out value="${otherTrnng.iscedCd}" escapeXml="false"/></strong><!-- 레벨/수료/학위졸업/학위 -->
									<span class="cont"><c:out value="${otherTrnng.insttNm}" escapeXml="false"/></span><!-- 기관이름 -->
									<span class="cont"><c:out value="${otherTrnng.addrProvcCdNm}" escapeXml="false"/></span><!-- 지역 -->
									<span class="cont">
										<c:out value="${otherTrnng.bgnDtMm}" escapeXml="false"/>/<c:out value="${otherTrnng.bgnDtYy}" escapeXml="false"/> ~
										<c:out value="${otherTrnng.endDtMm}" escapeXml="false"/>/<c:out value="${otherTrnng.endDtYy}" escapeXml="false"/>
									</span><!-- 연구기간 -->
								</div>
							</div>

						</c:forEach>

					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.languageStudy"/></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<div class="view_form">
							<strong class="title"><spring:message code="resume.text.langUseCd"/></strong>
							<p class="cont_box"><c:out value="${langList.langCdNm}" escapeXml="false"/></p>
						</div>
					</div>
					<!-- //view_box -->

					<div class="view_box">
						<c:forEach items="${langList.list }" var="lang" varStatus="stat">
							<div class="view_form type4">
								<div class="cont_box">
									<span class="cont"><c:out value="${lang.langCdNm }" /></span><!-- 외국어명 -->
									<span class="cont"><c:out value="${lang.langLvlCdNm}" escapeXml="false"/></span><!-- 외국어레벨 -->
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3><spring:message code="resume.text.career"/> <span class="tit">12Year 6Months</span></h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="career_box">
						<c:forEach items="${workExpList }" var="workExp" varStatus="stat">
							<div class="contents_box">
								<div class="box_wrap">
									<span class="date_box">
										<c:out value="${workExp.bgnDtMm}" escapeXml="false"/>/<c:out value="${workExp.bgnDtYy}" escapeXml="false"/> ~
										<c:out value="${workExp.endDtMm}" escapeXml="false"/>/<c:out value="${workExp.endDtYy}" escapeXml="false"/>
									</span><!-- 재직기간 -->
									<div class="title_box">
										<strong class="title"><c:out value="${workExp.orgnzNm}" escapeXml="false"/></strong><!-- 회사명 -->
										<span class="cont">
											<span><c:out value="${workExp.iscoCd}" escapeXml="false"/></span><!-- 부문 -->
											<span>Position/title</span><!-- 직급/직책 -->
										</span>
									</div>
									<div class="cont_box">
										<span class="cont">
											<strong><spring:message code="resume.text.selfemp"/></strong>
											<span><c:out value="${workExp.selfempYn}" escapeXml="false"/></span>
										</span>
										<span class="cont">
											<strong><spring:message code="resume.text.leaveReason"/></strong>
											<span><c:out value="${workExp.leaveReason}" escapeXml="false"/></span>
										</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- //career_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3>Skill</h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<c:forEach items="${skillList}" var="skillCd">
							<div class="view_form type5">
								<strong class="title"><c:out value="${skillCd.cdNm }" escapeXml="false"/></strong>
								<p class="cont_box">
									<c:forEach items="${skillCd.list }" var="cd" varStatus="stat">
										<c:choose>
											<c:when test="${stat.count eq 1}">
												<c:out value="${cd.cdNm }" escapeXml="false"/>
											</c:when>
											<c:otherwise>
												, <c:out value="${cd.cdNm }" escapeXml="false"/>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</p>
							</div>
						</c:forEach>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3>Keyword</h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<div class="view_form type7">
							<div class="cont_box">
								<c:forEach items="${resumeDetail.resumeKeywordList}" var="resumeKeyword">
									<span><c:out value="${resumeKeyword}" escapeXml="false" /></span>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3>추천인</h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="reference_box">
						<c:forEach items="${refManList }" var="refMan" varStatus="stat">
							<div class="contents_box">
								<div class="title_box"><c:out value="${refMan.nm }" escapeXml="false"/></div><!-- 추천인명 -->
								<div class="cont_box">
									<div class="tit_box">
										<strong class="title"><c:out value="${refMan.orgnzNm }" escapeXml="false"/></strong><!-- 기업/조직명 -->
										<span><c:out value="${refMan.position }" escapeXml="false"/></span><!-- 직급/직책 -->
										<span><c:out value="${refMan.ref }" escapeXml="false"/></span><!-- 본인과의 관계 -->
										<span><c:out value="${refMan.cell }" escapeXml="false"/></span><!-- 연락처 -->
										<span><c:out value="${refMan.email }" escapeXml="false"/></span><!-- 이메일 -->
									</div>
									<address class="cont"><c:out value="${refMan.addrFullNm}" escapeXml="false"/></address><!-- 주소 -->
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- //reference_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

			<div class="form_wrap">
				<div class="form_title">
					<h3>Declaration and agreement</h3>
				</div>
				<!-- //form_title -->
				<div class="form_view">
					<div class="view_box">
						<div class="view_form type6">
							<p class="cont_box">I solemnly declare that all the information provided above are true and accurate from the best of my knowledge. <br />I agree to allow the National Employment Agency (NEA) to provide all the above information to any employers and (or) make any public disclosure deemed necessary. <br />I agree to continue update NEA about my latest status and to notify NEA about the results of my job search, referral and placement. <br />In case of any inaccuracy, default and/or contravention, I shall be held liable to all applicable laws and regulations.</p>
						</div>
					</div>
					<!-- //view_box -->
				</div>
				<!-- //form_view -->
			</div>
			<!-- //form_wrap -->

<!-- <p class="box_center">위의 모든 기재사항은 사실과 다름 없음을 확인합니다. </p> -->
			<c:if test="${not empty jobskReqDetail}">
				<div class="view_bottom_box">
					<div class="contents_box">
						<div class="view_form">
							<strong class="title">Job Center</strong>
							<p class="cont_box"><c:out value="${jobskReqDetail.jcNm }" /></p>
						</div>
						<div class="view_form">
							<strong class="title">Job Center Officer Name</strong>
							<p class="cont_box"><c:out value="${jobskReqDetail.jcUserNm }" /></p>
						</div>
						<div class="view_form">
							<strong class="title">Signed</strong>
							<p class="cont_box"><c:out value="${jobskReqDetail.jcAgreeDt }" /></p>
						</div>
					</div>
					<div class="contents_box">
						<div class="view_form">
							<strong class="title">Name</strong>
							<p class="cont_box"><c:out value="${memberBean.userNmKh }" escapeXml="false"/></p>
						</div>
						<div class="view_form">
							<strong class="title">Signed on</strong>
							<p class="cont_box"><c:out value="${jobskReqDetail.regDt }" escapeXml="false"/></p>
						</div>
					</div>
				</div>
				<!-- //view_bottom_box -->
			</c:if>

			<div class="bbs_btn_wrap clearfix">
				<span class="bbs_left">
					<a href="javascript:goResumeList();" class="bbs_btn list">LIST</a>
				</span>
				<span class="bbs_right on">
					<c:if test="${loginMember.userSeq eq resumeDetail.userSeq }">
						<a href="javascript:goResumeUpdate();" class="bbs_btn modify">MODIFY</a>
					</c:if>
				</span>
				<sec:authorize access="hasRole('ROLE_CMPNY')">
					<span class="bbs_right on">
						<c:if test="${empty applic }">
							<c:choose>
								<c:when test="${not empty offer }">
									<c:choose>
										<c:when test="${offer.offerAcptYn eq 'N' }">
											<span>입사 거절 <a href="javascript:void(0);" class="bbs_btn modify">거절 사유 보기</a></span>
										</c:when>
										<c:otherwise>
											<span>입사 준비 중</span>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:if test="${onGoingVacCnt gt 0}">
										<a href="javascript:commonOfferPopup('${resumeDetail.resumeSeq}');" class="bbs_btn modify"><spring:message code="mypage.compny.jobOffer"/></a>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${not empty applic }">
							<c:choose>
								<c:when test="${empty Intvw }">
									<a href="javascript:void(0);" class="bbs_btn modify">인터뷰 제의</a>
									<c:if test="${applic.applicProcCd eq 'APC0000000002' }">
										<a href="javascript:void(0);" class="bbs_btn modify">서류합격</a>
										<a href="javascript:void(0);" class="bbs_btn modify">채용확정</a>
										<a href="javascript:void(0);" class="bbs_btn modify">미채용</a>
									</c:if>
									<c:if test="${applic.applicProcCd eq 'APC0000000003' }">
										<a href="javascript:void(0);" class="bbs_btn modify">채용확정</a>
										<a href="javascript:void(0);" class="bbs_btn modify">미채용</a>
									</c:if>
									<c:if test="${applic.applicProcCd eq 'APC0000000004' }">
										<span>채용 확정 완료</span>
									</c:if>
									<c:if test="${applic.applicProcCd eq 'APC0000000001' }">
										<span>미채용 <a href="javascript:void(0);" class="bbs_btn modify">미채용 사유 보기</a></span>
									</c:if>
								</c:when>
								<c:otherwise>
									<!-- 인터뷰 테이블 상태 코드 컬럼 추가 후  -->
									<!-- <span>인터뷰 제안 후</span> -->
								</c:otherwise>
							</c:choose>
						</c:if>
					</span>
					<div class="recruitment_btnbox">
					<div class="bbs_center" id="bkmkDiv">
						<sec:authorize access="hasAnyRole('ROLE_CMPNY')">
							<button type="button" id="btnBkmk" onclick="fnBkmk('${resumeDetail.bkmkSeq}','${resumeDetail.resumeSeq}',LIKE_CATEGORY_RESUME, 'bkmkDiv', 'btnBkmk');" class="button save <c:if test="${!empty resumeDetail.bkmkSeq}">on</c:if>"><spring:message code="mypage.compny.profile.title13"/></button>
						</sec:authorize>
					</div>

					</div>
				</sec:authorize>
			</div>
			<!-- //bbs_btn_wrap -->
		</div>
		<!-- //contents -->
	</article>
</main>
	<!-- //main.colgroup -->