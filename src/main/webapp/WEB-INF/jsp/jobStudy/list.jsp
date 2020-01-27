<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    	$(document).ready(function() {
			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}
			//검색키워드 enter
			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
					//fnSetPageing("1");
					fnGoList('frm');
				}
			});

			//fnSetSelecteBox("condType", "<c:out value="${param.condType}"/>");

    	});

      	function fnJobStudyTwoLvl(cdLvl,lvl,lvlTlt,btn) {

			$.ajax({
				url: contextPath + "/jobStudy/lvlListAjax.do",
				type: 'post',
				data: {
					condLvl: lvl,
					condLvlCd: cdLvl
				},
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {

					if(lvl == "2") {
						$('div.dictionary_child h4.title').text(lvlTlt);
						$('div.dictionary_child ul.list').empty();

						for(var i=0; i<data.resultList.length; i++) {
							var obj = data.resultList[i];

							var strHtml = "<li>";
							strHtml += "<button type=\"button\" class=\"bbs_question\" onclick=\"fnJobStudyTwoLvl('"+obj.cdLvl+"','4','"+obj.iscoNm+"',this);\">"+obj.iscoNm + " <span class=\"nums\">("+obj.lvlCnt+")</span></button>";
							strHtml += "<div class=\"bbs_answer_area\"><div class=\"child_box\"><ul class=\"clearfix\"></ul></div></div>";
							strHtml += "</li>";

							$("div.dictionary_child ul.list").append(strHtml);
						}
					} else {

						var item = $(btn).parent('li');
						var liList=$(item).siblings('li');

						liList.not(item).each(function() {
							$(this).removeClass('active');
							$(this).find('.bbs_answer_area').slideUp();
						});

						$(btn).siblings('div').find('ul li').remove();

						for(var i=0; i<data.resultList.length; i++) {
							var obj = data.resultList[i];

							var html = "<li><a href=\"javascript:void(0);\" onclick=\"fnJobStudyView('"+obj.iscoCd+"');\">"+ obj.iscoNm + "</a></li>";

							$(btn).siblings('div').find('ul').append(html);
						}

						item.addClass('active');
						$(btn).siblings('div').slideDown();
					}

				} else {
					alertify.alert("<spring:message code="errors.ajax.fail"/>");
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert("<spring:message code="errors.ajax.fail"/>");
			});
      	}


      	function fnJobStudyView(seq) {
			$("#condSeq").val(seq);
			$("#frm").attr('action', "${pageContext.request.contextPath}/jobStudy/view.do");
			$("#frm").submit();
      	}



	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="mypage.compny.vacancy.msg12"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="studyList">

<div class="srch_box">
	<div class="srch_area">
		<div class="box_wrap">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/jobStudy/selectJobStudySearch.do" method="post">
					<input type="hidden" id="condSeq" name="condSeq" value=""/>

				<fieldset>
					<legend>Search</legend>
					<div class="contents_box">
						<label for="condType" class="skip">Category Selection</label>
						<select id="condType" name="condType" title="Select classification">
							<option value="TITLE"><spring:message code="mypage.compny.vacancy.msg13"/></option>
							<%-- <option value="CONTENT"><spring:message code="bulletin.msg.content"/></option> --%>
							<option value="CATE"><spring:message code="mypage.compny.vacancy.msg14"/></option>
						</select>
						<label for="condText" class="skip">input the search</label>
						<input type="text" id="condText" name="condText" value="<c:out value="${param.condText}"/>" class="text" placeholder="<spring:message code="mypage.compny.vacancy.msg15"/>" maxlength="50" />
						<button type="button" class="submit" onclick="fnGoList('frm');">Search</button>

					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<!-- //srch_box -->

<div class="dictionary_box">
	<div class="dictionary_top">
		<h3 class="title">What kind of jobs are there?</h3>
		<p class="cont">Check out the different types and contents of the job.</p>
	</div>

	<c:if test="${!empty resultList}">
	<div class="dictionary_depth1">
		<ul class="clearfix">
		<c:forEach var="data" items="${resultList}" varStatus="status">
		<li>
			<button type="button" class="cont_box" title="Contents View" onclick="fnJobStudyTwoLvl('${data.cdLvl}','2','${data.iscoNm}');">
				<span class="img_box">
					<img src="${pageContext.request.contextPath}/common/imgLoading.do?url=${data.filePath}" alt="image" onerror="fnNoImage(this)"/>
				</span>
				<span class="cont">${data.iscoNm}</span>
			</button>
		</li>
		</c:forEach>
		</ul>
	</div>
	</c:if>
	<!-- //bbs_basic list -->
	<c:if test="${empty resultList}">
	<div class="bbs_empty">
		<p><spring:message code="counsel.msg.no.data"/></p>
	</div>
	<!-- //bbs_empty -->
	</c:if>

	<!-- //dictionary_depth1 -->

	<div class="dictionary_child">
		<div class="title_box">
			<h4 class="title"></h4>
		</div>
		<div class="bbs_faq type2" data-list="faq">
			<ul class="list">
			</ul>
		</div>
		<!-- //bbs_faq -->
	</div>
	<!-- //dictionary_child -->
</div>
<!-- //dictionary_box -->




			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->