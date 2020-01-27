<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    var firstIndex = 1;
    var pageUnit = 100;
    var pageSize = 10;

    	$(document).ready(function() {
    		fnGoSrch(1);

			$('div.bbs_info .bbs_count span.order button').click(function() {
				fnGoSrchSort(this.id);
			});
    	});

       	function fnGoSrch(page, gubun) {
   			var params = {
   					employCtrctDecidCd : '${srchBean.employCtrctDecidCd}',
   					employCtrctUndecidCd : '${srchBean.employCtrctUndecidCd}',
   					workTimeFullCd : '${srchBean.workTimeFullCd}',
   					workTimePartCd : '${srchBean.workTimePartCd}',
   					hopeSalary : '${srchBean.hopeSalary}',
   					minWorkExp : '${srchBean.minWorkExp}',
   					maxWorkExp : '${srchBean.maxWorkExp}',
   					iscoCdStr : '${srchBean.iscoCdStr}',
   					locCdStr : '${srchBean.locCdStr}',
   					langCdStr : '${srchBean.langCdStr}',
   					privilegeCdStr : '${srchBean.privilegeCdStr}',
   					eduDegreeCdStr : '${srchBean.eduDegreeCdStr}',
					pageIndex : firstIndex,
					pageUnit : pageUnit,
					pageSize : pageSize,
   			};
   			if(gubun != undefined) {
   				params.condSort = gubun;
   			}
       		//console.log('params', params);

   			$.ajax({
   				type: METHOD_POST,
   				url: contextPath + "/cpes/private/matching/listAjax.do",
   				dataType: AJAX_DATA_TYPE_JSON,
   				data: params,
   				success: function(data) {
   					//console.log('data', data);
   					if(data.result) {
   						fnMakeHtml(data.result);

   						$('div.pagination').empty();
   						$('div.pagination').append(data.paginationInfo);

   						$('div.bbs_basic').show();
   						$('div.bbs_empty').hide();
   					}
   					else {
   						$('div.bbs_empty').show();
   						$('div.bbs_basic').hide();
   					}

   					$('div.bbs_info strong.currently').text(fnNumberWithCommas(data.currentPageNo));
   					$('div.bbs_info span.total').text('/ '+fnNumberWithCommas(data.totalPageCount));
   				},
   				error: function(xhr, status, error) {
   					alertify.alert("error to connecting server");
   				}
   			});
       	}

       	function fnGoSrchSort(gubun) {
       		fnGoSrch(1, gubun);
    	}

       	function fnMakeHtml(lst) {

			$('ul.recruitment_list').empty();

       		for (var k=0; k<lst.length; k++) {
       			var data = lst[k];
       			var onClass = '', newClass = '', remainClass = '';
       			if (data.bkmkSeq != '') {
       				onClass = 'on';
       			}
       			if (data.newYn == 'Y') {
       				newClass = 'new';
       			}
       			if (data.remainDiv == 'hurry') {
       				remainClass = 'Hour';
       			}
       			var imgUrl = '${pageContext.request.contextPath}/common/imgLoading.do?url='+data.filePath;
       			var html = '';
		       	    html += '   		<li>                                                                                                               ';
		        	html += '	<div class="contents_wrap">                                                                                                ';
		        	html += '		<div class="img_box"><img src="'+imgUrl+'" alt="image" onerror="fnNoImage(this)" /></div>';
		        	html += '		<div class="contents_box ">                               ';
		        	html += '			<div class="title_box '+newClass+'">                                               ';
		        	html += '				<span class="tit">'+data.compnyNm+'</span>';
		        	html += '				<a href="javascript:void(0);" onclick="fnGoView(\''+data.vacancySeq+'\');" class="title">'+data.vacancyTitle+'</a>';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="cont_box">                                                                                             ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con">'+data.preferEmploymtTypeNm+'</span>                                            ';
		        	html += '					<span class="con"><spring:message code="compny.vacancy.msg.title8"/>:'+data.recrumtMemb+'</span>                                            ';
		        	html += '					<span class="con">'+data.addrFullNm+'</span>                                       ';
		        	html += '					<span class="con"><spring:message code="mypage.compny.profile.title18"/>:'+fnNumberWithCommas(data.minSalaryAmt)+' ~ '+fnNumberWithCommas(data.maxSalaryAmt)+'</span>';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="other_box">                                                                                            ';
		        	html += '				<span class="top_box">                                                                                         ';
		        	if(data.vacancyStsCd == 'VCS0000000002') {
		        	html += '					<span class="close">'+data.vacancyStsNm+'</span>';
		        	}else{
		        	html += '					<span class="'+data.remainDiv+'">'+data.remainDt+remainClass+'</span> ';
		        	}

		        	html += '<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">';
		        	html += '<span id="bkmkSapn_'+k+'"><button type="button" id="btnBkmk_'+k+'" onclick="fnBkmkType2(\''+data.bkmkSeq+'\',\''+data.vacancySeq+'\', LIKE_CATEGORY_VACANCY, \'btnBkmk_'+k+'\', \'bkmkSapn_'+k+'\');" class="interest '+onClass+'">interest</button>';
		        	html += '</span>';
		        	html += '</sec:authorize>';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '		</div>                                                                                                                 ';
		        	html += '	</div>                                                                                                                     ';
		        	html += '</li>                                                                                                                        ';

				$('ul.recruitment_list').append(html);
       		}

       	}

       	function fnGoView(seq) {
    		$("input#condSeq").val(seq);
    		$("form#frm").submit();
       	}

	</script>

<main class="colgroup" id="colgroup">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/vacancy/view.do" method="post">
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
								</form>
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="lnb.mypage.left.menu2"/></span></h2>
					</div>
                </header>

                <div id="contents" class="matchingList">

					<div class="box type2 icon matching">
					    <div class="box_wrap">
					        <div class="title">Please Set your preferred conditions for finding your employee!</div>
					        <p>Set your preference on job seeker such as occupation, sector, location, etc., <br />then <span class="em_point">you will receive job seeker list based on your preference.</span></p>
							<a href="${pageContext.request.contextPath}/cpes/private/matching/regist.do" class="bbs_btn type01 matching_btn"><spring:message code="lnb.mypage.left.menu4"/></a>
					    </div>
					</div>

					<div class="bbs_info clearfix">
						<div class="bbs_left bbs_count">
							<strong class="currently"></strong>
							<span class="total"></span>
							<span class="order">
								<h3 class="h0 skip">Change list order</h3>
								<button type="button" id="LATEST"><spring:message code="counsel.msg.sortBy.latest"/></button>
								<button type="button" id="VIEW"><spring:message code="counsel.msg.sortBy.view"/></button>
								<button type="button" id="POPULAR"><spring:message code="counsel.msg.sortBy.like"/></button>
							</span>
						</div>
					</div>
					<!-- //bbs_info -->

					<div class="bbs_basic">
						<ul class="recruitment_list my clearfix">
						</ul>
					</div>

					<div class="bbs_empty">
						<p><spring:message code="counsel.msg.no.data"/></p>
					</div>
					<!-- //bbs_empty -->

					<div class="pagination">
					</div>
					<!--  //pagination -->

                </div>
                <!-- //contents -->
            </article>
</main>