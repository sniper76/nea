<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
		$(document).ready(function(){

			fnInputValidation('inputNo', '1');

			var simpleCurrentPageNo = $('#simpleSearchForm').find('input[name=currentPageNo]').val();
			var detailCurrentPageNo = $('#detailSearchForm').find('input[name=currentPageNo]').val();

			if(simpleCurrentPageNo == ""){
				$('#simpleSearchForm').find('input[name=currentPageNo]').val("1");
			}
			if(detailCurrentPageNo == ""){
				$('#detailSearchForm').find('input[name=currentPageNo]').val("1");
			}

			$('#province_selection').on('change', function(e){
				var selectVal = $(e.target).val();

				if(selectVal != ""){
					$.ajax({
						type: 'post',
						url: contextPath + "/common/nextDepthCdSelectAjax.do",
						dataType: 'json',
						data: {
							"flag" : 'addr',
							"depth" : '1',
							"cd" : selectVal,
							"condGrpCd" : selectVal,
							"cdLength" : selectVal.length
						},
						success: function(data) {

							var html = "<option value=''>District</option>";
							if(data.result.length > 0){
								for(var i in data.result){
									var resultObj = data.result[i];
									html += "<option value='" + resultObj.cd +"'>" + resultObj.cdNm + "</option>";
								}
							}

							$('#district_selection').empty();
							$('#district_selection').html(html);

						},
						error: function(xhr, status, error) {
							alertify.alert("error to connecting server");
						}
					});
				}

			});

			$('.occupation').on('change', function(e){
				var selectVal = $(e.target).val();
				var depthFlag = $(e.target).attr('id');
				var depth = "";

				if(depthFlag == "occupation_1depth"){
					depth = "1";
				}else if(depthFlag == "occupation_2depth"){
					depth = "2";
				}else if(depthFlag == "occupation_3depth"){
					depth = "3";
				}

				if(selectVal != ""){
					$.ajax({
						type: 'post',
						url: contextPath + "/common/nextDepthCdSelectAjax.do",
						dataType: 'json',
						data: {
							"flag" : 'isco',
							"depth" : depth,
							"cd" : selectVal,
							"condGrpCd" : selectVal,
							"cdLength" : selectVal.length
						},
						success: function(data) {

							var html = "";
							depth = (Number(depth) + 1);

							html += "<option value=''>" + depth + " Depth</option>";
							if(data.result.length > 0){
								for(var i in data.result){
									var resultObj = data.result[i];
									html += "<option value='" + resultObj.cd +"'>" + resultObj.cdNm + "</option>";
								}
							}

							$('#occupation_' + depth + 'depth').empty();
							$('#occupation_' + depth + 'depth').html(html);

						},
						error: function(xhr, status, error) {
							alertify.alert("error to connecting server");
						}
					});
				}
			});

		});

		function fnGoSearch(){


		}

	</script>
<div class="top_area">
	<!-- <span class="cont_box">
		<strong class="title">Total CV</strong>&nbsp;:
		<span class="cont">5,000</span>
	</span>
	<span class="cont_box">
		<strong class="title">Due Today</strong>&nbsp;:
		<span class="cont">300</span>
	</span> -->
</div>
<div class="srch_area advanced"><!-- 상세 검색 있을 때 클래스 advanced 추가 -->
	<div class="box_wrap">
		<form id="simpleSearchForm" method="post" action="${pageContext.request.contextPath}/cpes/compny/hrSearch/hrSearchResult.do">
			<input type="hidden" name="currentPageNo" value=""/>
			<input type="hidden" name="searchFlag" value="simple">
			<input type="hidden" name="sortFlag" value="latest">
			<fieldset>
				<legend>Search</legend>
				<div class="contents_box">
					<label for="serch_sel" class="skip">Category Selection</label>
					<select id="serch_sel" name="simpleLocCd">
						<option value="">Location</option>
						<c:forEach items="${locCdList }" var="locCd">
							<option value="${locCd.cd }" <c:if test="${locCd.cd eq paramInfo.simpleLocCd}">selected="selected"</c:if>>
								<c:out value="${locCd.cdNm }" />
							</option>
						</c:forEach>
					</select>
					<label for="serch_text" class="skip">input the search</label>
					<input type="text" id="serch_text" name="simpleKeyword" class="text" placeholder="Keyword" value="${paramInfo.simpleKeyword }"/>
					<button type="submit" class="submit">Search</button>
				</div>
			</fieldset>
		</form>
		<div class="put_box">
			<button type="button" class="advanced_search">Advanced Search</button>
		</div>
	</div>
</div>
<div class="detail_area">
	<div class="box_wrap">
		<form id="detailSearchForm" method="post" action="${pageContext.request.contextPath}/cpes/compny/hrSearch/hrSearchResult.do">
			<input type="hidden" name="currentPageNo" value=""/>
			<input type="hidden" name="searchFlag" value="detail">
			<input type="hidden" name="sortFlag" value="latest">
			<fieldset>
				<legend>Detail search</legend>
				<div class="title_box">
					<h3>Advanced Search</h3>
				</div>
				<table class="bbs_table">
					<caption>Detail search</caption>
					<colgroup>
						<col style="width:15%;" />
						<col style="width:85%;" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="col"><label for="input_keyword">Keyword</label></th>
						<td>
							<input id="input_keyword" name="keyword" type="text" value="${paramInfo.keyword }"/>
						</td>
					</tr>
					<tr>
						<th scope="col">Occupation</th>
						<td>
							<label for="occupation_1depth" class="skip">Occupation 1depth</label>
							<select id="occupation_1depth" class="occupation" name="iscoCd_1depth">
								<option value="">1 Depth</option>
								<c:forEach items="${iscoCdList }" var="iscoCd">
									<option value="${iscoCd.cd }" <c:if test="${iscoCd.cd eq paramInfo.iscoCd_1depth}">selected="selected"</c:if>>
										<c:out value="${iscoCd.cdNm }" />
									</option>
								</c:forEach>
							</select>
							<label for="occupation_2depth" class="skip">Occupation 2depth</label>
							<select id="occupation_2depth" class="occupation" name="iscoCd_2depth">
								<option value="">2 Depth</option>
								<c:forEach items="${iscoCd2DepthList }" var="iscoCd">
									<option value="${iscoCd.cd }" <c:if test="${iscoCd.cd eq paramInfo.iscoCd_2depth}">selected="selected"</c:if>>
										<c:out value="${iscoCd.cdNm }" />
									</option>
								</c:forEach>
							</select>
							<label for="occupation_3depth" class="skip">Occupation 3depth</label>
							<select id="occupation_3depth" class="occupation" name="iscoCd_3depth">
								<option value="">3 Depth</option>
								<c:forEach items="${iscoCd3DepthList }" var="iscoCd">
									<option value="${iscoCd.cd }" <c:if test="${iscoCd.cd eq paramInfo.iscoCd_3depth}">selected="selected"</c:if>>
										<c:out value="${iscoCd.cdNm }" />
									</option>
								</c:forEach>
							</select>
							<label for="occupation_4depth" class="skip">Occupation 4depth</label>
							<select id="occupation_4depth" name="iscoCd_4depth">
								<option value="">4 Depth</option>
								<c:forEach items="${iscoCd4DepthList }" var="iscoCd">
									<option value="${iscoCd.cd }" <c:if test="${iscoCd.cd eq paramInfo.iscoCd_4depth}">selected="selected"</c:if>>
										<c:out value="${iscoCd.cdNm }" />
									</option>
								</c:forEach>
							</select>
						</td>
					<tr>
						<th scope="col">Location</th>
						<td>
							<label for="province_selection" class="skip">Province selection</label>
							<select id="province_selection" name="locCd_1depth">
								<option value="">Province</option>
								<c:forEach items="${locCdList }" var="locCd">
									<option value="${locCd.cd }" <c:if test="${locCd.cd eq paramInfo.locCd_1depth}">selected="selected"</c:if>>
										<c:out value="${locCd.cdNm }" />
									</option>
								</c:forEach>
							</select>
							<label for="district_selection" class="skip">District selection</label>
							<select id="district_selection" name="locCd_2depth">
								<option value="">District</option>
								<c:forEach items="${locCd2DepthList }" var="locCd">
									<option value="${locCd.cd }" <c:if test="${locCd.cd eq paramInfo.locCd_2depth}">selected="selected"</c:if>>
										<c:out value="${locCd.cdNm }" />
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="col">Vacancy Type</th>
						<td>
							<c:forEach items="${employmentFormList }" var="employmentForm">
								<c:set var="efcFlag" value="false" />
								<c:forEach items="${paramInfo.employFormCd }" var="paramEfc">
									<c:if test="${employmentForm.dtlCd eq paramEfc }">
										<c:set var="efcFlag" value="true" />
									</c:if>
								</c:forEach>
								<span class="bbs_input_box">
									<input type="checkbox" name="employFormCd" id="${employmentForm.dtlCd }" value="${employmentForm.dtlCd }"
										<c:if test="${efcFlag eq 'true' }">checked="checked"</c:if> />
									<label for="${employmentForm.dtlCd }"><c:out value="${employmentForm.cdNm }" /></label>
								</span>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col">Wage</th>
						<td>
							<input id="salary" name="salary" class="inputNo" type="text" value="${paramInfo.salary }"/>
						</td>
					</tr>
					<tr>
						<th scope="col">Working Time</th>
						<td>
							<!-- <span class="bbs_input_box">
								<input type="radio" name="preferEmployTypeCd" id="preferEmployTypeCdAll" />
								<label for="preferEmployTypeCdAll">All</label>
							</span> -->
							<c:forEach items="${preferEmploymtTypeCdList }" var="preferEmploymtTypeCd">
								<span class="bbs_input_box">
									<input type="radio" name="preferEmployTypeCd" id="${preferEmploymtTypeCd.dtlCd }" value="${preferEmploymtTypeCd.dtlCd }"
										<c:if test="${preferEmploymtTypeCd.dtlCd eq paramInfo.preferEmployTypeCd }">checked="checked"</c:if>/>
									<label for="${preferEmploymtTypeCd.dtlCd }"><c:out value="${preferEmploymtTypeCd.cdNm }" /></label>
								</span>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col">Contract Type</th>
						<td>
							<!-- <span class="bbs_input_box">
								<input type="radio" name="preferCrtctType" id="preferCrtctTypeAll" />
								<label for="preferCrtctTypeAll">All</label>
							</span> -->
							<c:forEach items="${termOfEmploymentContractList }" var="termOfEmploymentContract">
								<span class="bbs_input_box">
									<input type="radio" name="preferCrtctType" id="${termOfEmploymentContract.dtlCd }" value="${termOfEmploymentContract.dtlCd }"
										<c:if test="${termOfEmploymentContract.dtlCd eq paramInfo.preferCrtctType }">checked="checked"</c:if>/>
									<label for="${termOfEmploymentContract.dtlCd }"><c:out value="${termOfEmploymentContract.cdNm }" /></label>
								</span>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col">Education</th>
						<td>
							<c:forEach items="${educationDegreeCodeList }" var="educationDegreeCode">
								<c:set var="edcFlag" value="false" />
								<c:forEach items="${paramInfo.eduDegreeCd }" var="paramEdc">
									<c:if test="${educationDegreeCode.dtlCd eq paramEdc }">
										<c:set var="edcFlag" value="true" />
									</c:if>
								</c:forEach>
								<span class="bbs_input_box">
									<input type="checkbox" name="eduDegreeCd" id="${educationDegreeCode.dtlCd }" value="${educationDegreeCode.dtlCd }"
										<c:if test="${edcFlag eq 'true' }">checked="checked"</c:if> />
									<label for="${educationDegreeCode.dtlCd }"><c:out value="${educationDegreeCode.cdNm }" /></label>
								</span>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col">Privilege</th>
						<td>
							<span class="bbs_input_box">
								<input type="checkbox" name="disablYn" id="disablYn" value="Y" <c:if test="${paramInfo.disablYn eq 'Y' }">checked="checked"</c:if>/>
								<label for="disablYn">Disability</label>
							</span>
							<span class="bbs_input_box">
								<input type="checkbox" name="retMigratYn" id="retMigratYn" value="Y" <c:if test="${paramInfo.retMigratYn eq 'Y' }">checked="checked"</c:if>/>
								<label for="retMigratYn">Migrant Worker</label>
							</span>
							<span class="bbs_input_box">
								<input type="checkbox" name="youthYn" id="youthYn" value="Y" <c:if test="${paramInfo.youthYn eq 'Y' }">checked="checked"</c:if>/>
								<label for="youthYn">Youth (15~35 Age)</label>
							</span>
						</td>
					</tr>
					<tr>
						<th scope="col">Foreign Language</th>
						<td>
							<span class="bbs_input_box">
								<input type="checkbox" name="checkbox8" id="checkbox8_1" />
								<label for="checkbox8_1">English</label>
							</span>
							<span class="bbs_input_box">
								<input type="checkbox" name="checkbox8" id="checkbox8_2" />
								<label for="checkbox8_2">Chinese</label>
							</span>
							<span class="bbs_input_box">
								<input type="checkbox" name="checkbox8" id="checkbox8_3" />
								<label for="checkbox8_3">Korean</label>
							</span>
							<span class="bbs_input_box">
								<input type="checkbox" name="checkbox8" id="checkbox8_4" />
								<label for="checkbox8_4">Japanese</label>
							</span>
							<span class="bbs_input_box">
								<input type="checkbox" name="checkbox8" id="checkbox8_5" />
								<label for="checkbox8_5">French</label>
							</span>
						</td>
					</tr>
					<tr>
						<th scope="col">Gender</th>
						<td>
							<!-- <span class="bbs_input_box">
								<input type="radio" name="genderCd" id="genderCdAll" />
								<label for="genderCdAll">All</label>
							</span> -->
							<c:forEach items="${genderCdList }" var="genderCd">
								<span class="bbs_input_box">
									<input type="radio" name="genderCd" id="${genderCd.dtlCd }" value="${genderCd.dtlCd }"
										<c:if test="${genderCd.dtlCd eq paramInfo.genderCd }">checked="checked"</c:if>/>
									<label for="${genderCd.dtlCd }"><c:out value="${genderCd.cdNm }" /></label>
								</span>
							</c:forEach>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="put_box">
					<button type="submit" class="submit">Search</button>
				</div>
			</fieldset>
		</form>
	</div>
	<button type="button" class="detail_close">Close Detail search</button>
</div>