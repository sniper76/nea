<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>

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
				<c:import url="${pageContext.request.contextPath}/cpes/compny/hrSearch/searchForm.do">
					<c:param value="${param}" name="HrSearchBean"></c:param>
				</c:import>
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