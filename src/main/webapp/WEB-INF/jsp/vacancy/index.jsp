<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
	<script src="${pageContext.request.contextPath}/js/mypage/compny/vacancy/vacancy.js"></script>
    <script>
    	$(document).ready(function() {

			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					fnSearch();
				}
			});


    	});

    	function fnSearch() {
			$("#frmSearch").submit();
    	}

    	function fnDtlSearch() {
    		$("#frmDtlSearch").submit();
    	}

	</script>
	<main class="colgroup" id="colgroup">
    	<article>
			<header class="sub_head">
				<div class="sub_title">
					<h2><span><spring:message code="jobfair.type.detail.title7"/></span></h2>
				</div>
           	</header>
           	 <div id="contents" class="vacancyIndex">

				<div class="srch_box">
<!-- 					<div class="top_area">
						<span class="cont_box">
							<strong class="title">Total CV</strong>&nbsp;:
							<span class="cont">5,000</span>
						</span>
						<span class="cont_box">
							<strong class="title">Due Today</strong>&nbsp;:
							<span class="cont">300</span>
						</span>
					</div> -->
					<div class="srch_area advanced"><!-- 상세 검색 있을 때 클래스 advanced 추가 -->
						<div class="box_wrap">
							<form id="frmSearch" name="frmSearch" action="${pageContext.request.contextPath}/vacancy/dtlSearch.do" method="post">
								<input type="hidden" name="condDiv" value="SEARCH">
								<fieldset>
									<legend>Search</legend>
									<div class="contents_box">
										<label for="serch_sel" class="skip">Category Selection</label>
										<select id="condAreaCd" name="condAreaCd" title="Select classification">
											<option value=""><spring:message code="counsel.msg.all"/></option>
											<c:forEach var="data" items="${resultList2}" varStatus="status">
												<option value="${data.lvlCd}">${data.nm}</option>
											</c:forEach>
										</select>
										<label for="condText" class="skip">input the search</label>
										<input type="text" id="condText" name="condText" class="text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
										<input type="text" class="skip" style="visibility: hidden; with: 0px" title="hidden text"><!-- on submit 방지 -->
										<button type="button" onclick="fnSearch();" class="submit"><spring:message code="button.search"/></button>
									</div>
								</fieldset>
							</form>
							<div class="put_box">
								<button type="button" class="advanced_search"><spring:message code="mypage.private.interest.msg6"/></button>
							</div>
						</div>
					</div>
					<div class="detail_area">
						<div class="box_wrap">
							<form id="frmDtlSearch" name="frmDtlSearch" action="${pageContext.request.contextPath}/vacancy/dtlSearch.do" method="post">
								<input type="hidden" name="condDiv" value="SEARCH_DTL">
								<fieldset>
									<legend>Detail search</legend>
									<div class="title_box">
										<h3><spring:message code="mypage.private.interest.msg6"/></h3>
									</div>
									<table class="bbs_table">
										<caption>Detail search</caption>
										<colgroup>
											<col style="width:15%;" />
											<col style="width:85%;" />
										</colgroup>
										<tbody>
										<tr>
											<th scope="col"><label for="condDtlText"><spring:message code="compny.vacancy.msg.title64"/></label></th>
											<td>
												<input type="text" id="condDtlText" name="condDtlText" class="text" title="<spring:message code="mypage.compny.vacancy.msg15"/>" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="mypage.compny.applic.title6"/></th>
											<td>
												<label for="condIscoLvlOne" class="skip">Occupation 1depth</label>
												<select id="condIscoLvlOne" name="condIscoLvlOne" onchange="fnIscoCdList(this,'1','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
													<c:forEach var="data" items="${resultListIsco}" varStatus="status">
														<option value="${data.cd}">${data.cdNm}</option>
													</c:forEach>
												</select>
												<label for="condIscoLvlTwo" class="skip">Occupation 2depth</label>
												<select id="condIscoLvlTwo" name="condIscoLvlTwo" onchange="fnIscoCdList(this,'2','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
												<label for="condIscoLvlThree" class="skip">Occupation 3depth</label>
												<select id="condIscoLvlThree" name="condIscoLvlThree" onchange="fnIscoCdList(this,'3','condIscoLvlOne','condIscoLvlTwo','condIscoLvlThree','condIscoLvlFour',null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
												<label for="condIscoLvlFour" class="skip">Occupation 4depth</label>
												<select id="condIscoLvlFour" name="condIscoLvlFour">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
											</td>
										<tr>
											<th scope="col"><spring:message code="resume.text.addrProvcCd"/></th>
											<td>
												<label for="condAreaCdLvlOne" class="skip">Province selection</label>
												<select id="condAreaCdLvlOne" name="condAreaCdLvlOne" onchange="fnAreaCdList(this,'1','condAreaCdLvlOne','condAreaCdLvlTwo',CONTRY_CD_CAMBODIA,null);">
													<option value=""><spring:message code="counsel.msg.all"/></option>
													<c:forEach var="data" items="${resultList2}" varStatus="status">
														<option value="${data.lvlCd}">${data.nm}</option>
													</c:forEach>
												</select>
												<label for="condAreaCdLvlTwo" class="skip">District selection</label>
												<select id="condAreaCdLvlTwo" name="condAreaCdLvlTwo">
													<option value=""><spring:message code="counsel.msg.all"/></option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title3"/></th>
											<td>
												<c:forEach var="data" items="${employFormCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condVacancyTypeCd_${status.count}" name="condVacancyTypeCd"  value="${data.dtlCd}"/>
														<label for="condVacancyTypeCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>

											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="mypage.private.interest.msg7"/></th>
											<td>
												<input id="condSalAmt" name="condSalAmt" type="text" maxlength="6" style="width:80px;" onKeyPress="return fnCheckNumber(event);" />$
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title17"/></th>
											<td>
												<c:forEach var="data" items="${preferEmploymtTypeCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condPreferEmploymtTypeCd_${status.count}" name="condPreferEmploymtTypeCd"  value="${data.dtlCd}"/>
														<label for="condPreferEmploymtTypeCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title15"/></th>
											<td>
												<c:forEach var="data" items="${employCtrctCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condEmployCtrctCd${status.count}" name="condEmployCtrctCd"  value="${data.dtlCd}"/>
														<label for="condEmployCtrctCd${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title52"/></th>
											<td>
												<c:forEach var="data" items="${minEduDegreeCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condMinEduDegreeCd${status.count}" name="condMinEduDegreeCd"  value="${data.dtlCd}"/>
														<label for="condMinEduDegreeCd${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title61"/></th>
											<td>
												<span class="bbs_input_box">
													<input type="radio"  id="condMinWorkExp_0" name="condMinWorkExp" value="0"/>
													<label for="condMinWorkExp_0">None</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio"  id="condMinWorkExp_1" name="condMinWorkExp" value="1"/>
													<label for="condMinWorkExp_1">~ 1 Year</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio"  id="condMinWorkExp_2" name="condMinWorkExp" value="2"/>
													<label for="condMinWorkExp_2">1~2 Years</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio"  id="condMinWorkExp_3" name="condMinWorkExp" value="3"/>
													<label for="condMinWorkExp_3">2~5 Years</label>
												</span>
												<span class="bbs_input_box">
													<input type="radio"  id="condMinWorkExp_4" name="condMinWorkExp" value="4"/>
													<label for="condMinWorkExp_4">More than 5 Years</label>
												</span>

											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="compny.vacancy.msg.title46"/></th>
											<td>
												<c:forEach var="data" items="${preferntCondCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condPreferntCondCd_${status.count}" name="condPreferntCondCd"  value="${data.dtlCd}"/>
														<label for="condPreferntCondCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th scope="col"><spring:message code="mypage.compny.profile.title23"/></th>
											<td>
												<c:forEach var="data" items="${langCd}" varStatus="status">
													<span class="bbs_input_box">
														<input type="checkbox" id="condLangCd_${status.count}" name="condLangCd"  value="${data.dtlCd}"/>
														<label for="condLangCd_${status.count}">${data.cdNm}</label>
													</span>
												</c:forEach>
											</td>
										</tr>
										</tbody>
									</table>
									<div class="put_box">
										<button type="button" onclick="fnDtlSearch();" class="submit"><spring:message code="button.search"/></button>
									</div>
								</fieldset>
							</form>
						</div>
						<button type="button" class="detail_close">Close Detail search</button>
					</div>
				</div>
				<!-- //srch_box -->

				<div class="recruitment_notice">
					<h3>Providers latest job vacancys</h3>
					<div class="company_list type2"><!-- 채용공고 상단 노축 리스트일 경우 클래스 type2 추가 -->
						<div class="count_box">
							<span class="current">2</span>/<span class="total">3</span>
						</div>
						<div class="slide_box clearfix">
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
							<div class="slide_item">
								<div class="contents_box">
									<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></span>
									<a href="" class="title_box">
										<span class="tit">SAMSUNG CAMBODIA</span>
										<strong class="title">News SubjectNews SubjectNews SubjectNews SubjectNews SubjectNews Subject</strong>
									</a>
									<span class="put_box">
										<span class="career">Experiencw:2+</span>
										<strong class="date">~20/10/2019</strong>
									</span>
									<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
								</div>
							</div>
						</div>
					</div>
					<!-- //company_list -->


				</div>














				<div class="recruitment_notice02">
					<div class="box_wrap clearfix">
						<div class="col_box col_box01">
							<div class="title_box">
								<h3 class="title">Company of the Month</h3>
							</div>
							<div class="contents_box">
								<ul class="clearfix">
								<li>
									<a href="" class="cont_box">
										<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt=" image" /></span>
										<strong class="title">Kt m&amp;s</strong>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt=" image" /></span>
										<strong class="title">Kt m&amp;s</strong>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt=" image" /></span>
										<strong class="title">Kt m&amp;s</strong>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt=" image" /></span>
										<strong class="title">Kt m&amp;s</strong>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt=" image" /></span>
										<strong class="title">Kt m&amp;s</strong>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt=" image" /></span>
										<strong class="title">Kt m&amp;s</strong>
									</a>
								</li>
								</ul>
								<a href="" class="more">Company of the Month more view</a>
							</div>
						</div>
						<div class="col_box col_box02">
							<div class="title_box">
								<h3 class="title">Special Service</h3>
							</div>
							<div class="contents_box">
								<ul class="clearfix">
								<li>
									<a href="" class="cont_box">
										<span class="cont">Internship</span>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="cont">Part time</span>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="cont">People width <br />Disabilities</span>
									</a>
								</li>
								<li>
									<a href="" class="cont_box">
										<span class="cont">Migrant <br />Workers</span>
									</a>
								</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<h3>Today's Popular</h3>
				<div class="bbs_basic">
					<ul class="recruitment_list clearfix"><!-- 인기채용공고 목록일 경우 클래스 popularity 추가, 교육기관,교육프로그램일 경우 클래스 adu 추가 -->
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box new"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="cont_box">
									<span class="con">Part time</span>
									<span class="con">Vacancy&nbsp;:&nbsp;<strong>1</strong></span>
									<span class="con">Phonm Penh</span>
									<span class="con">$300</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="day">30</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest on">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="cont_box">
									<span class="con">Part time</span>
									<span class="con">Vacancy&nbsp;:&nbsp;<strong>1</strong></span>
									<span class="con">Phonm Penh</span>
									<span class="con">$300</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="hurry">18Hour</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="cont_box">
									<span class="con">Part time</span>
									<span class="con">Vacancy&nbsp;:&nbsp;<strong>1</strong></span>
									<span class="con">Phonm Penh</span>
									<span class="con">$300</span>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="close">Closed</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest close">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="contents_wrap">
							<div class="img_box"><img src="../../images/contents/recruitment_dummy.png" alt="image" /></div>
							<div class="contents_box deleted"><!-- 모집중일 경우 클래스 recruiting , 교육 마감일 경우 클래스 closed 추가, 삭제된 글일 경우 클래스 deleted 추가 -->
								<div class="title_box"><!-- 새글일 경우 클래스 new 추가 -->
									<span class="tit">SAMSUNG Cambodiagy</span>
									<a href="" class="title">Construction Project Planning Manager</a>
								</div>
								<div class="other_box">
									<span class="top_box">
										<span class="close">Closed</span><!-- 시간으로 표시해야 할 경우 클래스 hurry 추가, 마감일 때 클래스 close 추가 -->
										<button type="button" class="interest close">interest</button><!--  활성화 되어야 할 때 클래스 on 추가, 비활성 되어야 할 때 클래스 close 추가  -->
									</span>
								</div>
							</div>
						</div>
					</li>
					</ul>
				</div>
				<!-- //bbs_basic list -->

				<div class="pagination">
					<a href="" class="prev_end">First page</a>
					<a href="" class="prev_one">Prev page</a>
					<strong title="Current page">1</strong>
					<a href="" title="Go to page 2">2</a>
					<a href="" title="Go to page 3">3</a>
					<a href="" title="Go to page 4">4</a>
					<a href="" title="Go to page 5">5</a>
					<a href="" title="Go to page 6">6</a>
					<a href="" title="Go to page 7">7</a>
					<a href="" title="Go to page 8">8</a>
					<a href="" title="Go to page 9">9</a>
					<a href="" title="Go to page 10">110</a>
					<a href="" class="next_one">Next page</a>
					<a href="" class="next_end">Last page</a>
				</div>
				<!--  //pagination -->

        	</div>
        	<!-- //contents -->

		</article>
	</main>
	<!-- //main.colgroup -->