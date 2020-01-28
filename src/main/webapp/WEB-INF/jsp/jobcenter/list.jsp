<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    var firstIndex = 1;
    var pageUnit = 4;
    var pageSize = 10;

    	$(document).ready(function() {
			if("<c:out value="${connYn}"/>" != "Y") {//잘못된 접근
				alertify.alert("<spring:message code="errors.wrong.approach.msg"/>", function (e){
					fnGoMain();
				});
				return false;
			}

			if("<c:out value="${userExistYn}"/>" == "N") {//사용자가 존재하지않음
				alertify.alert("<spring:message code="login.findId.no.data"/>", function (e){
					fnGoMain();
				});
				return false;
			}

    		fnGoSrch(1);

			$("div.bbs_right input#condText").keypress(function( event ) {
				if( event.which == 13 ) {
		    		fnGoSrch(1);
				}
			});

			$('div.bbs_right input#search').click(function() {
				fnGoSrch(1)
			});

			$('div.bbs_left span.order button').click(function() {
				fnGoSrchSort(this.id);
			});
		});

       	function fnGoView(seq) {
    		$("#condSeq").val(seq);
    		$("#frm").attr('action', "<c:url value='/jobcenter/view.do' />");
    		$("#frm").submit();
    	}

    	function fnGoSrch(page, params) {
    		//console.log('params', params);
			if(params == undefined) {
				params = {
						condType : $('div.bbs_right select#condType').val(),
						condText : $('div.bbs_right input#condText').val(),
						pageIndex : page,
						pageUnit : pageUnit,
						pageSize : pageSize,
				};
			}

			$.ajax({
				type: METHOD_POST,
				url: contextPath + "/jobcenter/listAjax.do",
				dataType: AJAX_DATA_TYPE_JSON,
				data: params,
				success: function(data) {
					if(data.result) {
						fnMakeHtml(data.result);

						$('div.pagination').empty();
						$('div.pagination').append(data.paginationInfo);

						$('div.center_list').show();
						$('div.bbs_empty').hide();
					}
					else {
						$('div.bbs_empty').show();
						$('div.center_list').hide();
					}

					$('div.bbs_left strong.currently').text(fnNumberWithCommas(data.currentPageNo));
					$('div.bbs_left span.total').text('/ '+fnNumberWithCommas(data.totalPageCount));
				},
				error: function(xhr, status, error) {
					alertify.alert("error to connecting server");
				}
			});
    	}

       	function fnMakeHtml(lst) {

			$('div.center_list ul.clearfix').empty();

       		for (var k=0; k<lst.length; k++) {
       			var data = lst[k];
	       		var html = '', newClass = '';
       			if (data.newYn == 'Y') {
       				newClass = 'new';
       			}
       			var imgUrl = '${pageContext.request.contextPath}/common/imgLoading.do?url='+data.filePath;

				html += '<li>                                                                                                                               ';
				html += '	<div class="center_item">                                                                                                       ';
				html += '		<div class="img_box"><img src="'+imgUrl+'" alt="image" onerror="fnNoImage(this)" /></div>                                ';
				html += '		<div class="contents_box">                                                                                                  ';
				html += '			<div class="title_box '+newClass+'">                                                                                                 ';
				html += '				<strong class="title">'+data.jc+'</strong>                                                               ';
				html += '			</div>                                                                                                                  ';
				html += '			<div class="cont_box">                                                                                                  ';
				//html += '				<address class="add">'+fnCutByteLength(data.addr, 50)+'</address>';
				html += '				<address class="add">'+nvl(data.addr)+'</address>';
				html += '				<div class="margin_t_5">                                                                                            ';
				html += '					<a href="javascript:fnViewMap(\''+data.mapLink+'\', 1024, 768, \'MapWin\');" class="bbs_btn_map"><spring:message code="mypage.compny.profile.title17"/></a>                                                                     ';
				html += '				</div>                                                                                                              ';
				html += '			</div>                                                                                                                  ';
				html += '			<div class="put_box">                                                                                                   ';
				html += '				<div class="call">                                                                                                  ';
				html += '					<a href="tel:0000000000" class="mobile_phone">'+nvl(data.tel1)+'</a>                                                  ';
				html += '					,&nbsp;                                                                                                         ';
				html += '					<a href="tel:0000000000" class="mobile_phone">'+nvl(data.tel2)+'</a>                                                  ';
				html += '				</div>                                                                                                              ';
				html += '				<div class="email">'+nvl(data.email)+'</div>                                                                           ';
				html += '			</div>                                                                                                                  ';
				html += '		</div>                                                                                                                      ';
				html += '	</div>                                                                                                                          ';
				html += '</li>                                                                                                                              ';

				$('div.center_list ul.clearfix').append(html);
       		}
       	}

       	function fnGoSrchSort(gubun) {
			var params = {
					condType : $('div.bbs_right select#condType').val(),
					condText : $('div.bbs_right input#condText').val(),
					pageIndex : firstIndex,
					pageUnit : pageUnit,
					pageSize : pageSize,
					condSort : gubun,
			};

       		fnGoSrch(1, params);
    	}

	</script>
	<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">
                    <div class="sub_title">
						<h2>
							<span><spring:message code="jobcenter.list.title1"/></span>
						</h2>
					</div>
                </header>

                <div id="contents" class="jobcenterList">
					<div class="bbs_info clearfix">
						<div class="bbs_left bbs_count">
							<strong class="currently"></strong>
							<span class="total"></span>
							<span class="order">
								<strong class="skip">Change list order</strong>
								<button type="button" id="LATEST"><spring:message code="counsel.msg.sortBy.latest"/></button>
								<%-- <button type="button" id="VIEW"><spring:message code="counsel.msg.sortBy.view"/></button>
								<button type="button" id="POPULAR"><spring:message code="counsel.msg.sortBy.like"/></button> --%>
							</span>
						</div>
						<div class="bbs_right bbs_category">
								<fieldset>
									<legend>Posts Search</legend>
									<select id="condType" name="condType" title="Select classification">
										<option value=""><spring:message code="counsel.msg.all"/></option>
										<option value="TITLE"><spring:message code="eduTrnng.free.search.title40"/></option>
										<%-- <option value="ADDR"><spring:message code="mypage.compny.profile.title12"/></option> --%>
									</select>
									<input type="text" id="condText" name="condText" value="" class="input_text" title="<spring:message code="search.keyword"/>" placeholder="<spring:message code="search.keyword"/>" />
									<input type="submit" id="search" value="Search" class="submit" />
								</fieldset>
						</div>
					</div>
					<!-- //bbs_info -->

					<div class="center_list">
						<ul class="clearfix">
						</ul>
					</div>
					<!--  //center_list -->

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