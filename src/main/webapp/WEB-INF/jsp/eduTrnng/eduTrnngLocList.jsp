<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    var firstIndex = 1;
    var pageUnit = 10;
    var pageSize = 10;

    	$(document).ready(function() {
    		fnGoSrch();
    		//fnSetAdvanceSrch();

			$("#condText2").keypress(function( event ) {
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
					condAreaCd2 : areaCd,
					condKeyword : $('div.srch_area select#condKeyword').val(),
					condText2 : $('div.srch_area input#condText2').val(),
					pageIndex : page,
					pageUnit : pageUnit,
					pageSize : pageSize,
					condSort : sort,
			};

			return params;
    	}

    	function fnSetAdvanceSrch() {
    		$('div.detail_area select#condAreaCd2').val('');
    		$('div.detail_area input#condText2').val('');
    		//$('div.detail_area select#condKeyword').val('');
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
				url: contextPath + "/eduTrnng/eduTrnngLocListAjax.do",
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
       			var html = '';
		       	    html += '   		<li>                                                                                                               ';
		        	html += '	<div class="contents_wrap">                                                                                                ';
		        	html += '		<div class="img_box"><img src="'+contextPath+data.filePath+'" alt="image" onerror="fnNoImage(this)" /></div>                                        ';
		        	html += '		<div class="contents_box '+data.trnngNatnexpDivClass+'">                               ';
		        	html += '			<div class="title_box '+newClass+'">                                               ';
		        	html += '				<a href="javascript:void(0);" onclick="fnEduTrnngView(\''+data.eduTrnngSeq+'\', \'frm\');" class="title">'+data.eduTrnngNm+'</a>                                             ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="cont_box">                                                                                             ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con">'+data.addrNm+'</span>                                            ';
		        	html += '					<span class="con">'+data.skillJobProgramCorsNm+'</span>                                            ';
		        	html += '					<span class="con">'+data.tuition+'</span>                                            ';
		        	html += '				</span>                                                                                                        ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con"><spring:message code="mypage.instt.eduTrnng.title8"/> : <strong>'+data.recurmtBgnDt+' ~ '+data.recurmtEndDt+'</strong></span>                                       ';
		        	html += '					<span class="con"><spring:message code="mypage.instt.eduTrnng.title9"/> : <strong>'+data.eduBgnDt+' ~ '+data.eduEndDt+'</strong></span>                                       ';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="other_box">                                                                                            ';
		        	html += '				<span class="top_box">                                                                                         ';
		        	html += '					<span class="date">'+data.recrumtStsNm+'</span>                                                                         ';

		        	html += '<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">';
		        	html += '<span id="bkmkSapn_'+k+'"><button type="button" id="btnBkmk_'+k+'" onclick="fnBkmkType2(\''+data.bkmkSeq+'\',\''+data.eduTrnngSeq+'\', LIKE_CATEGORY_TRNCT, \'btnBkmk_'+k+'\', \'bkmkSapn_'+k+'\');" class="interest '+onClass+'">interest</button>';
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

       	function fnGoSrchSort(areaCd, gubun) {
       		fnGoSrch(fnMakeParams(1, areaCd, gubun));
    	}

	</script>
	<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="eduTrnng.msg2"/></span></h2>
					</div>
                </header>

                <div id="contents" class="eduTrnngEduTrnngLocList">
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
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/eduTrnng/view.do" method="post">
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
								</form>
									<fieldset>
										<legend>Search</legend>
										<div class="contents_box">
											<label for="condKeyword" class="skip">Category Selection</label>
											<select id="condKeyword" name="condKeyword">
												<option value="0"><spring:message code="counsel.msg.all"/></option>
												<option value="1"><spring:message code="resume.text.insttNm"/></option>
												<option value="2"><spring:message code="mypage.instt.eduTrnng.title4"/></option>
											</select>
											<label for="condText2" class="skip">input the search</label>
											<input id="condText2" name="condText2" type="text" class="text" placeholder='<spring:message code="search.keyword"/>' />
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
								<button type="button" id="VIEW"><spring:message code="counsel.msg.sortBy.view"/></button>
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