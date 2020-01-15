<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    var firstIndex = 1;
    var pageUnit = 10;
    var pageSize = 10;

    	$(document).ready(function() {
    		fnGoSrch();
    		//fnSetAdvanceSrch();

			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch();
				}
			});

			$('div.srch_box .contents_box button.submit').click(function() {
				fnGoSrch()
			});

			$('div.bbs_info .bbs_count span.order button').click(function() {
				fnGoSrchSort(fnGetAreaCd(), $(this).prop('id'));
			});

			$('div.srch_box .srch_location .box_wrap button').click(function() {
				$('div.srch_box .srch_location .box_wrap button').removeClass('on');
				$(this).addClass('on');
				fnGoSrch(fnMakeParams(1, $(this).prop('id'), ''));
			});
		});

    	function fnMakeParams(page, areaCd, sort) {
			var params = {
					condAreaCd : areaCd,
					condText : $('div.srch_area input#condText').val(),
					pageIndex : page,
					pageUnit : pageUnit,
					pageSize : pageSize,
					condSort : sort,
			};

			return params;
    	}

    	function fnSetAdvanceSrch() {
    		$('div.detail_area select#condAreaCd').val('');
    		$('div.detail_area input#condText').val('');
    	}

    	function fnGetAreaCd() {
    		//console.log('fnGetAreaCd', $('div.srch_box .srch_location .box_wrap button.on').length);
    		if ($('div.srch_box .srch_location .box_wrap button.on').length === 0) {
    			return '';
    		}
    		return $('div.srch_box .srch_location .box_wrap button.on').prop('id');
    	}

    	function fnGoSrch(params) {
			if(params == undefined) {
				params = fnMakeParams(1, fnGetAreaCd(), '');
			}
    		//console.log('params', params);

			$.ajax({
				type: METHOD_POST,
				url: contextPath + "/jobFair/locListAjax.do",
				dataType: AJAX_DATA_TYPE_JSON,
				data: params,
				success: function(data) {
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

       	function fnGoSrchSort(areaCd, gubun) {
       		fnGoSrch(fnMakeParams(1, areaCd, gubun));
    	}

       	function fnMakeHtml(lst) {

			$('ul.recruitment_list').empty();

       		for (var k=0; k<lst.length; k++) {
       			var data = lst[k];
       			var onClass = '', newClass = '';
       			if (data.bkmkSeq != '') {
       				onClass = 'on';
       			}
       			if (data.newYn == 'Y') {
       				newClass = 'new';
       			}
       			var fileUrl = '${pageContext.request.contextPath}'+data.filePath;
       			var html = '';
		       	    html += '   		<li>                                                                                                               ';
		        	html += '	<div class="contents_wrap">                                                                                                ';
		        	html += '		<div class="img_box"><img src="'+fileUrl+'" alt="image" onerror=\"fnNoImage(this)\" /></div>';
		        	html += '		<div class="contents_box '+data.fairDivClass+'">                               ';
		        	html += '			<div class="title_box '+newClass+'">                                               ';
		        	html += '				<a href="javascript:void(0);" onclick="fnGoView(\''+data.fairSeq+'\');" class="title">'+data.fairNm+'</a>                                             ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="cont_box">                                                                                             ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con"><spring:message code="resume.text.addrProvcCd"/> : <strong>'+data.addrNm+'</strong></span>                                            ';
		        	html += '				</span>                                                                                                        ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con">'+data.fairBgnDt+' ~ '+data.fairEndDt+'</span>                                       ';
		        	html += '				</span>                                                                                                        ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con"><a href="tel:000000000" class="mobile_phone">'+data.tel1+'</a></span>                      ';
		        	html += '					<span class="con"><a href="tel:000000000" class="mobile_phone">'+data.tel2+'</a></span>                      ';
		        	html += '					<span class="con">'+data.email+'</span>                                                             ';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="other_box">                                                                                            ';
		        	html += '				<span class="top_box">                                                                                         ';
		        	html += '					<span class="date">'+data.fairStsNm+'</span>                                                                         ';

		        	html += '<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">';
		        	html += '<span id="bkmkSapn_'+k+'"><button type="button" id="btnBkmk_'+k+'" onclick="fnBkmkType2(\''+data.bkmkSeq+'\',\''+data.fairSeq+'\', LIKE_CATEGORY_FAIR, \'btnBkmk_'+k+'\', \'bkmkSapn_'+k+'\');" class="interest '+onClass+'">interest</button>';
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
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="eduTrnng.free.search.title4"/></span></h2>
					</div>
                </header>

                <div id="contents" class="jobFairLocList">
					<div class="srch_box">
						<div class="srch_location">
							<div class="box_wrap">
								<ul class="clearfix">
								<c:forEach var="data" items="${locCd}" varStatus="status">
									<li><button type="button" id="${data.lvlCd}">${data.nm}</button></li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<div class="srch_area">
							<div class="box_wrap">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/jobFair/view.do" method="post">
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
					<input type="hidden" id="returnUrl" name="returnUrl" value="${pageContext.request.contextPath}/jobFair/locList.do"/>
								</form>
									<fieldset>
										<legend>Search</legend>
										<div class="contents_box">
										<%--
											<label for="condKeyword" class="skip">Category Selection</label>
											<select id="condKeyword" name="condKeyword">
												<option value="0"><spring:message code="counsel.msg.all"/></option>
												<option value="1"><spring:message code="resume.text.insttNm"/></option>
												<option value="2"><spring:message code="mypage.instt.eduTrnng.title4"/></option>
											</select>
										 --%>
											<label for="condText" class="skip">input the search</label>
											<input id="condText" name="condText" type="text" class="text" placeholder='<spring:message code="search.keyword"/>' />
											<button type="submit" class="submit"><spring:message code="button.search"/></button>
										</div>
									</fieldset>
							</div>
						</div>
					</div>
					<!-- //srch_box -->

					<div class="bbs_info clearfix">
						<div class="bbs_left bbs_count">
							<strong class="currently"></strong>
							<span class="total"></span>
							<span class="order">
								<h3 class="h0 skip">Change list order</h3>
								<button type="button" id="LATEST"><spring:message code="counsel.msg.sortBy.latest"/></button>
								<button type="button" id="POPULAR"><spring:message code="counsel.msg.sortBy.like"/></button>
							</span>
						</div>
					</div>
					<!-- //bbs_info -->

					<div class="bbs_basic">
						<ul class="recruitment_list edu clearfix">
						</ul>
					</div>
					<!-- //bbs_basic list -->

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
	<!-- //main.colgroup -->