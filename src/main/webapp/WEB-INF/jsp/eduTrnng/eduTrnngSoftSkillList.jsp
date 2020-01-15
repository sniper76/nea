<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    var firstIndex = 1;
    var pageUnit = 10;
    var pageSize = 10;

    	$(document).ready(function() {
    		fnGoSrch(1);
    		fnSetAdvanceSrch();

			$("#condText").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch(1);
				}
			});
			$("#condText2").keypress(function( event ) {
				if( event.which == 13 ) {
					var params = {
							condAreaCd2 : $('div.detail_area select#condAreaCd2').val(),
							condText2 : $('div.detail_area input#condText2').val(),
							condKeyword : $('div.detail_area select#condKeyword').val(),
							condRecruitStsCd : $('div.detail_area input:radio[name=condRecruitStsCd]:checked').val(),
							pageIndex : firstIndex,
							pageUnit : pageUnit,
							pageSize : pageSize,
					};
		    		fnGoSrch(1, params);
				}
			});

			$('div.srch_box .contents_box button.submit').click(function() {
				fnGoSrch(1)
			});

			$('div.detail_area .box_wrap .put_box button.submit').click(function() {
				/*
				if($('div.detail_area input#condText2').val() === '') {
					alertify.alert("<spring:message code="mypage.compny.vacancy.msg15"/>", function (e){
					});
					return false;
				}*/
				var params = {
						condAreaCd2 : $('div.detail_area select#condAreaCd2').val(),
						condText2 : $('div.detail_area input#condText2').val(),
						condKeyword : $('div.detail_area select#condKeyword').val(),
						condRecruitStsCd : $('div.detail_area input:radio[name=condRecruitStsCd]:checked').val(),
						pageIndex : firstIndex,
						pageUnit : pageUnit,
						pageSize : pageSize,
				};

				fnGoSrch(1, params)
			});

			$('div.bbs_info .bbs_count span.order button').click(function() {
				fnGoSrchSort(this.id);
			});
		});

    	function fnSetAdvanceSrch() {
    		$('div.detail_area select#condAreaCd2').val('');
    		$('div.detail_area input#condText2').val('');
    		$('div.detail_area select#condKeyword').val('0');
    		$('div.detail_area input:radio[name=condRecruitStsCd]:eq(0)').prop("checked", true);
    	}

    	function fnGoSrch(page, params) {
    		//console.log('params', params);
			if(params == undefined) {
				params = {
						condAreaCd : $('div.srch_area select#condAreaCd').val(),
						condText : $('div.srch_area input#condText').val(),
						pageIndex : page,
						pageUnit : pageUnit,
						pageSize : pageSize,
				};
				// detail init
				fnSetAdvanceSrch();
				if($('button.advanced_search').is('.on')){
					$('button.advanced_search').trigger('click');
				}
			}

			$.ajax({
				type: METHOD_POST,
				url: contextPath + "/eduTrnng/eduTrnngSoftSkillListAjax.do",
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
			var params = {
					condAreaCd : $('div.srch_area select#condAreaCd').val(),
					condText : $('div.srch_area input#condText').val(),
					pageIndex : firstIndex,
					pageUnit : pageUnit,
					pageSize : pageSize,
					condSort : gubun,
			};

			if ($('div.detail_area').is(":visible")) {
				//console.log('active');
				params = {
						condAreaCd2 : $('div.detail_area select#condAreaCd2').val(),
						condText2 : $('div.detail_area input#condText2').val(),
						condKeyword : $('div.detail_area select#condKeyword').val(),
						condRecruitStsCd : $('div.detail_area input:radio[name=condRecruitStsCd]:checked').val(),
						pageIndex : firstIndex,
						pageUnit : pageUnit,
						pageSize : pageSize,
						condSort : gubun,
				};
			}

       		fnGoSrch(1, params);
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
		        	html += '		<div class="contents_box skill">                               ';
		        	html += '			<div class="title_box '+newClass+'">                                               ';
		        	html += '				<a href="javascript:void(0);" onclick="fnGoView(\''+data.eduTrnngSeq+'\');" class="title">'+data.eduTrnngNm+'</a>                                             ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="cont_box">                                                                                             ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con">'+data.addrNm+'</span>                                            ';
		        	html += '					<span class="con"><spring:message code="compny.vacancy.msg.title8"/> : <strong>'+data.recrumtMemb+'</strong></span>                                            ';
		        	html += '				</span>                                                                                                        ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con"><spring:message code="mypage.instt.eduTrnng.title9"/> : <strong>'+data.teachDt+' '+data.teachBgnTime+' ~ '+data.teachEndTime+'</strong></span>                                       ';
		        	html += '					<span class="con"><spring:message code="mypage.compny.applic.title10"/> : <strong>'+data.teacherNm1+'</strong></span>                                       ';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="other_box">                                                                                            ';
		        	html += '				<span class="top_box">                                                                                         ';
		        	html += '					<span class="date">'+data.recrumtStsNm+'</span>                                                                         ';

		        	html += '<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">';
		        	html += '<span id="bkmkSapn_'+k+'"><button type="button" id="btnBkmk_'+k+'" onclick="fnBkmkType2(\''+data.bkmkSeq+'\',\''+data.eduTrnngSeq+'\', LIKE_CATEGORY_NEA_TRNCT, \'btnBkmk_'+k+'\', \'bkmkSapn_'+k+'\');" class="interest '+onClass+'">interest</button>';
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
						<h2><span><spring:message code="eduTrnng.free.search.title5"/></span></h2>
					</div>
                </header>

                <div id="contents" class="eduTrnngEduTrnngSoftSkillList">

					<div class="srch_box">
						<div class="srch_area advanced">
							<div class="box_wrap">
									<fieldset>
										<legend>Search</legend>
										<div class="contents_box">
											<label for="condAreaCd" class="skip">Category Selection</label>
											<select id="condAreaCd" name="condAreaCd">
												<option value=""><spring:message code="counsel.msg.all"/></option>
													<c:forEach var="data" items="${locCd}" varStatus="status">
														<option value="${data.lvlCd}">${data.nm}</option>
													</c:forEach>
											</select>
											<label for="condText" class="skip"><spring:message code="search.keyword"/></label>
											<input type="text" id="condText" name="condText" class="text" placeholder='<spring:message code="search.keyword"/>' />
											<button type="submit" class="submit"><spring:message code="button.search"/></button>
										</div>
									</fieldset>
								<div class="put_box">
									<button type="button" class="advanced_search"><spring:message code="eduTrnng.free.search.title3"/></button>
								</div>
							</div>
						</div>
						<div class="detail_area">
							<div class="box_wrap">
					<form id="frm" name="frm" action="${pageContext.request.contextPath}/eduTrnng/softSkillView.do" method="post">
					<input type="hidden" id="condSeq" name="condSeq" value=""/>
								</form>
									<fieldset>
										<legend>Detail search</legend>
										<div class="title_box">
											<h3><spring:message code="eduTrnng.free.search.title3"/></h3>
										</div>
										<table class="bbs_table">
											<caption>Detail search</caption>
											<colgroup>
												<col style="width:15%;" />
												<col style="width:85%;" />
											</colgroup>
											<tbody>
											<tr>
												<th scope="col"><spring:message code="resume.text.addrProvcCd"/></th>
												<td colspan="3">
													<label for="condAreaCd2" class="skip"><spring:message code="counsel.msg.all"/></label>
													<select id="condAreaCd2" name="condAreaCd2">
													<option value=""><spring:message code="counsel.msg.all"/></option>
													<c:forEach var="data" items="${locCd}" varStatus="status">
														<option value="${data.lvlCd}">${data.nm}</option>
													</c:forEach>
													</select>
													<!--
													<label for="district_selection" class="skip"><spring:message code="counsel.msg.all"/></label>
													<select id="district_selection">
														<option value="">1111</option>
														<option value="">1111</option>
													</select>
													 -->
												</td>
											</tr>
											<tr>
												<th scope="col"><spring:message code="compny.vacancy.msg.title64"/></th>
												<td colspan="3">
													<label for="condKeyword" class="skip"><spring:message code="counsel.msg.all"/></label>
													<select id="condKeyword" name="condKeyword">
														<option value="0"><spring:message code="counsel.msg.all"/></option>
														<option value="11"><spring:message code="eduTrnng.free.search.title9"/></option>
														<option value="22"><spring:message code="mypage.compny.applic.title10"/></option>
													</select>
													<label for="condText2" class="skip"><spring:message code="search.keyword"/></label>
													<input id="condText2" name="condText2" type="text" placeholder='<spring:message code="search.keyword"/>' />
												</td>
											</tr>
											<tr>
												<th scope="col"><spring:message code="eduTrnng.free.search.title2"/></th>
												<td>
													<span class="bbs_input_box">
														<input type="radio" name="condRecruitStsCd" id="condRecruitStsCd_1" value="" />
														<label for="condRecruitStsCd_1"><spring:message code="counsel.msg.all"/></label>
													</span>
													<span class="bbs_input_box">
														<input type="radio" name="condRecruitStsCd" id="condRecruitStsCd_2" value="RSC0000000002" />
														<label for="condRecruitStsCd_2"><spring:message code="gnb.menu.vacancy.title7"/></label>
													</span>
													<span class="bbs_input_box">
														<input type="radio" name="condRecruitStsCd" id="condRecruitStsCd_3" value="RSC0000000003" />
														<label for="condRecruitStsCd_3"><spring:message code="button.close"/></label>
													</span>
												</td>
											</tr>
											</tbody>
										</table>
										<div class="put_box">
											<button type="submit" class="submit"><spring:message code="button.search"/></button>
										</div>
									</fieldset>
							</div>
							<button type="button" class="detail_close">Close Detail search</button>
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
						<ul class="recruitment_list type2 clearfix">
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