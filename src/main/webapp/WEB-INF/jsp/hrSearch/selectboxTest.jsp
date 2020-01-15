<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
		$(document).ready(function(){
			$('#province_selection').select2();
			$('#district_selection').select2();

			$('#province_selection').on('change', function(e){
				var selectVal = $(e.target).val();

				if(selectVal != ""){
					$.ajax({
						type: 'post',
						url: contextPath + "/common/nextDepthCdSelect2Ajax.do",
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
									html += "<optgroup label='" + resultObj.cdNm + "'>";

									for(var j in resultObj.commonList){
										var underObj = resultObj.commonList[j];

										html += "<option value='" + underObj.cd + "'>" + underObj.cdNm + "</option>";
									}

									html += "</optgroup>";
								}
							}

							$('#district_selection').select2('destroy');
							$('#district_selection').empty();
							$('#district_selection').html(html);
							$('#district_selection').select2();
						},
						error: function(xhr, status, error) {
							alertify.alert("error to connecting server");
						}
					});
				}

			});

		});
	</script>
<main class="colgroup" id="colgroup">
	<article>
		<header class="sub_head">
			<div class="sub_title">
				<h2><span>CV Search</span></h2>
			</div>
		</header>

		<div id="contents" class="hrSearchHrSearchForm">
			<div class="srch_box">
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
					<form id="simpleSearchForm" method="post" action="">
						<fieldset>
							<legend>Search</legend>
							<div class="contents_box">
								<label for="serch_sel" class="skip">Category Selection</label>
								<select id="serch_sel" name="simpleLocCd">
									<option value="">Location</option>

								</select>
								<label for="serch_text" class="skip">input the search</label>
								<input type="text" id="serch_text" name="simpleKeyword" class="text" placeholder="Keyword" value=""/>
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
					<form id="detailSearchForm" method="post" action="">
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
									<th scope="col">Location</th>
									<td>
										<label for="province_selection" class="skip">Province selection</label>
										<select id="province_selection" name="locCd_1depth" class="" style="width: 100%;">
											<option value="">Province</option>
											<c:forEach items="${locCdList }" var="locCd">
												<optgroup label="${locCd.cdNm }">
													<c:forEach items="${locCd.commonList }" var="underLocCd">
														<option value="${underLocCd.cd }"><c:out value="${underLocCd.cdNm }" /></option>
													</c:forEach>
												</optgroup>
											</c:forEach>
										</select>
										<label for="district_selection" class="skip">District selection</label>
										<select id="district_selection" name="locCd_2depth" style="width: 100%;">
											<option value="">District</option>
										</select>
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
			</div>
			<!-- //srch_box -->

			<div class="talent_info">
				<div class="box_wrap">
					<div class="contents_box">
						<div class="title_box">
							<h3 class="title">Special Service</h3>
						</div>
						<ul class="clearfix">
						<li>
							<a href="" class="cont_box">
								<strong class="title">Find Interns</strong>
								<span class="cont">Looking for Interns?</span>
							</a>
						</li>
						<li>
							<a href="" class="cont_box">
								<strong class="title">Find the Disabled</strong>
								<span class="cont">Lokking for the disabled?</span>
							</a>
						</li>
						<li>
							<a href="" class="cont_box">
								<strong class="title">Find Migrant Workers</strong>
								<span class="cont">Looking for workers from overseas?</span>
							</a>
						</li>
						<li>
							<a href="" class="cont_box">
								<strong class="title">Find Youth</strong>
								<span class="cont">Looking for young people for work?</span>
							</a>
						</li>
						</ul>
					</div>
				</div>
			</div>
			<!--  //talent_info -->

			<h3>Guide For Finding Job Seekers</h3>
			<div class="talent_info02">
				<ul class="clearfix">
				<li>
					<div class="contents_box">
						<div class="title_box">
							<span class="tit">Find by</span>
							<strong class="title">Job Seeker Search</strong>
						</div>
						<div class="cont_box">
							<p class="cont">You can search job seekers after registration of Job Vacancy <br />and getting an approval by Job Centers</p>
						</div>
						<div class="put_box">
							<a href="">Job Vacancy</a>
							<a href="">Register Job Vacancy</a>
						</div>
					</div>
				</li>
				<li>
					<div class="contents_box">
						<div class="title_box">
							<span class="tit">Find by</span>
							<strong class="title">Auto Matching</strong>
						</div>
						<div class="cont_box">
							<p class="cont">NEA online service automatically matches based on your <br />approved job vacancies, and recommends you people you need</p>
						</div>
						<div class="put_box">
							<a href="">Auto Match Results</a>
							<a href="">What is Auto Matching?</a>
						</div>
					</div>
				</li>
				<li>
					<div class="contents_box">
						<div class="title_box">
							<span class="tit">Find by</span>
							<strong class="title">Tailored Matching</strong>
						</div>
						<div class="cont_box">
							<p class="cont">Set the people you need. The system will recommend you <br />the people you want.</p>
						</div>
						<div class="put_box">
							<a href="">Tailored Matching <br />Setting</a>
							<a href="">What is Tailored <br />Matching?</a>
						</div>
					</div>
				</li>
				<li>
					<div class="contents_box">
						<div class="title_box">
							<span class="tit">Find by</span>
							<strong class="title">Job Center Job Referral</strong>
						</div>
						<div class="cont_box">
							<p class="cont">You register for job referral service by Job Center, <br />then Job Center will find people you need.</p>
						</div>
						<div class="put_box">
							<a href="">Go to Job Center <br />Referral</a>
							<a href="">What is Job Center <br />Referral?</a>
						</div>
					</div>
				</li>
				</ul>
			</div>
			<!--  //talent_info02 -->

			<div class="talent_info03">
				<ul class="clearfix">
				<li>
					<div class="contents_box">
						<div class="title_box">
							<strong class="title">You are not registered yet?</strong>
							<p class="cont">Register as an employer user, and use various services to find your employee</p>
						</div>
						<div class="cont_box">
							<a href="" class="cont"><span>USER REGISTRATION</span></a>
						</div>
					</div>
				</li>
				<li>
					<div class="contents_box">
						<div class="title_box">
							<strong class="title">Still curious on NEA Online Service?</strong>
							<p class="cont">Find what services we provide in the manual.</p>
						</div>
						<div class="cont_box">
							<a href="" class="cont"><span>MANUAL</span></a>
						</div>
					</div>
				</li>
				</ul>
			</div>
			<!--  //talent_info03 -->
		</div>
                <!-- //contents -->
	</article>
</main>