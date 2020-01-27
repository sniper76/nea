<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>
    <script>
    var firstIndex = 1;
    var pageUnit = 10;
    var pageSize = 10;

    	$(document).ready(function() {
    		fnGoSrch(1);

			$('div.bbs_info .bbs_count span.order button').click(function() {
				fnGoSrchSort(this.id);
			});
    	});

    	function fnGoSrch(page, params) {
    		//console.log('params', params);
			if(params == undefined) {
				params = {
						pageIndex : page,
						pageUnit : pageUnit,
						pageSize : pageSize,
				};
			}

			$.ajax({
				type: METHOD_POST,
				url: contextPath + "/cpes/private/workshop/listAjax.do",
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
       			var newClass = '', stsClass = 'close';
       			if (data.newYn == 'Y') {
       				newClass = 'new';
       			}
       			if (data.jcAgreeStsCd == 'JAS0000000001') {
       				stsClass = 'recruiting';
       			}
       			var imgUrl = '${pageContext.request.contextPath}/common/imgLoading.do?url='+data.filePath;
       			var html = '';
		       	    html += '   		<li>                                                                                                               ';
		       	 	html += '	<span class="check_box">';
		       		html += '		<label for="chk_'+k+'" class="skip">Select</label>';
		       		html += '		<input type="checkbox" id="chk_'+k+'" name="chk" value="'+data.fairWorkshopPatcptnSeq+'" />';
		       		html += '	</span>';
		        	html += '	<div class="contents_wrap">                                                                                                ';
		        	html += '		<div class="img_box"><img src="'+imgUrl+'" alt="image" onerror="fnNoImage(this)" /></div>                                        ';
		        	html += '		<div class="contents_box">                               ';
		        	html += '			<div class="title_box '+newClass+'">                                               ';
		        	html += '				<a href="javascript:void(0);" onclick="fnGoView(\''+data.fairSeq+'\', \''+data.fairWorkshopSeq+'\', \''+data.fairWorkshopPatcptnSeq+'\', \''+data.cancelYn+'\');" class="title">'+data.workshopNm+'</a>                                             ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="cont_box">                                                                                             ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con">'+data.lectureRoom+'</span>                                            ';
		        	html += '					<span class="con"><spring:message code="compny.vacancy.msg.title8"/>:'+data.recurmtMan+'</span>                                            ';
		        	html += '					<span class="con">'+data.tuition+'</span>                                            ';
		        	html += '				</span>                                                                                                        ';
		        	html += '				<span class="cont">                                                                                            ';
		        	html += '					<span class="con"><strong>'+data.fairBgnDt+' ~ '+data.fairEndDt+'</strong></span>                                       ';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '			<div class="other_box type2">                                                                                            ';
		        	html += '				<span class="top_box">                                                                                         ';
		        	html += '					<span class="date">'+data.jcAgreeStsNm+'</span>';
		        	html += '				</span>                                                                                         ';
		        	html += '				<span class="bottom_box">                                                                                         ';
		        	html += '<sec:authorize access="hasAnyRole('ROLE_USER,ROLE_STDIT')">';
		        	if(data.cancelYn == 'N') {
		        		if(data.jcAgreeStsCd == 'JAS0000000001') {
			        		if(data.workshopStsCd == 'WSC0000000002') {
			        html += '<button type="button" class="bbs_btn type08 small" onclick="javascript:fnCancel(\''+data.fairSeq+'\', \''+data.fairWorkshopSeq+'\', \''+data.fairWorkshopPatcptnSeq+'\')"><spring:message code="mypage.compny.applic.msg11"/></button>';
			        		}
			        		else {
			        html += '<button type="button" class="bbs_btn type08 small" onclick="javascript:fnApply(\''+data.fairSeq+'\', \''+data.fairWorkshopSeq+'\', \''+data.fairWorkshopPatcptnSeq+'\', \''+data.workshopStsCd+'\');"><spring:message code="apply.participate"/></button>';
			        		}
		        		}
		        	}
		        	else {
		        	html += '<span class="close"><spring:message code="login.findPwd.btn.cancel"/></span>';
		        	}
		        	html += '</sec:authorize>';
		        	html += '				</span>                                                                                                        ';
		        	html += '			</div>                                                                                                             ';
		        	html += '		</div>                                                                                                                 ';
		        	html += '	</div>                                                                                                                     ';
		        	html += '</li>                                                                                                                        ';

				$('ul.recruitment_list').append(html);
       		}

       	}

       	function fnGoSrchSort(gubun) {
			var params = {
					pageIndex : firstIndex,
					pageUnit : pageUnit,
					pageSize : pageSize,
					condSort : gubun,
			};

       		fnGoSrch(1, params);
    	}

       	function fnCancel(seq, workshopSeq, workshopPatcptnSeq) {
			alertify.confirm("<spring:message code="eduTrnng.free.search.title38"/>", function (e) {
    			if (e) {
    	    		var params = {
    	    				fairSeq : seq,
    	    				fairWorkshopSeq : workshopSeq,
    	    				fairWorkshopPatcptnSeq : workshopPatcptnSeq,
    	    				cancelYn : 'Y',
    	    				delYn : 'N',
    	    		};

    				$.ajax({
    					type: METHOD_POST,
    					url: contextPath + '/jobFair/workshopApply.do',
    					dataType: AJAX_DATA_TYPE_JSON,
    					data: params,
    					success: function(data) {
    						if(data.result == "Y"){
        						alertify.alert("<spring:message code="mypage.private.fair.errors.msg2"/>", function (e){
	    							fnGoSrch(1);
    							});
    						}
    					},
    					error: function(xhr, status, error) {
    						alertify.alert("error to connecting server");
    					},
    				});
    			}
			});
       	}

    	function fnApply(seq, workshopSeq, workshopPatcptnSeq, stsCd) {
    		if('WSC0000000002' != stsCd) {
				alertify.alert("<spring:message code="eduTrnng.free.search.title33"/>", function (e){

				});
				return false;
    		}
			alertify.confirm("<spring:message code="eduTrnng.free.search.title32"/>", function (e) {
    			if (e) {
    	    		var params = {
    	    				fairSeq : seq,
    	    				fairWorkshopSeq : workshopSeq,
    	    				fairWorkshopPatcptnSeq : workshopPatcptnSeq,
    	    				cancelYn : 'N',
    	    				delYn : 'N',
    	    		};

    				$.ajax({
    					type: METHOD_POST,
    					url: contextPath + '/jobFair/workshopApply.do',
    					dataType: AJAX_DATA_TYPE_JSON,
    					data: params,
    					success: function(data) {
    						if(data.result == "Y"){
        						alertify.alert("<spring:message code="counsel.msg.update.ok"/>", function (e){
	    							fnGoSrch(1);
    							});
    						}
    					},
    					error: function(xhr, status, error) {
    						alertify.alert("error to connecting server");
    					},
    				});
    			}
			});
    	}

       	function fnDeleteWorkshop() {
    		var seqArr = new Array;

    		if(!$("input:checkbox[name=chk]").is(":checked") == true) {
				alertify.alert("<spring:message code="mypage.compny.applic.errors.msg"/>", function (e){

				});
				return false;
    		}

    		$("input:checkbox[name=chk]:checked").each(function() {
    			seqArr.push($(this).val());
			});

    		alertify.confirm("<spring:message code="compny.vacancy.msg.btn.delete"/>", function (e) {
    			if (e) {
    				$.ajax({
    					url: contextPath + "/cpes/private/workshop/deleteAjax.do",
    					type: METHOD_POST,
    					data: {
    						condSeqStr : seqArr.join(",")
    					},
    					datatype: AJAX_DATA_TYPE_JSON
    				})
    				.done(function(data) {
    					if (data.result == "Y") {
    						alertify.alert("<spring:message code="counsel.msg.delete.success"/>", function (e){
    							fnGoSrch("1");
    						});
    					}
    				})
    				.fail(function(xhr, status, errorThrown) {
    					alertify.alert("<spring:message code="errors.ajax.fail"/>");
    				});
    			}
    		});
       	}

       	function fnGoView(seq, seq2, seq3, yn) {
       		var viewUrl = '${pageContext.request.contextPath}';
       		var f = $("form#frm");
       		f.empty();

       		viewUrl += '/jobFair/workshopView.do';

       		f.append($('<input/>').attr('name', 'condSeq').attr('type','hidden').val(seq));
       		f.append($('<input/>').attr('name', 'condFairSeq').attr('type','hidden').val(seq));
       		f.append($('<input/>').attr('name', 'condFairWorkshopSeq').attr('type','hidden').val(seq2));
       		f.append($('<input/>').attr('name', 'condFairWorkshopPatcptnSeq').attr('type','hidden').val(seq3));
       		f.append($('<input/>').attr('name', 'newYn').attr('type','hidden').val(yn));

			f.attr('action', viewUrl);
			f.attr('method', "post");
	   		f.submit();
       	}
	</script>
	<main class="colgroup" id="colgroup">
		<article>
	    	<header class="sub_head">
				<div class="sub_title">
					<h2>
						<span><spring:message code="eduTrnng.free.search.title39"/></span>
					</h2>
				</div>
	      	</header>

	       	<div id="contents" class="workshopList">
	       	<form id="frm" name="frm" hidden="true"></form>
				<div class="bbs_info clearfix">
					<div class="bbs_left bbs_count">
						<strong class="currently"></strong>
						<span class="total"></span>
						<span class="order">
							<h3 class="h0 skip"><spring:message code="counsel.msg.sort.change"/></h3>
							<button type="button" id="LATEST"><spring:message code="counsel.msg.sortBy.latest"/></button>
						</span>
					</div>
				</div>
				<!-- //bbs_info -->
				<div class="bbs_basic">
					<ul class="recruitment_list recruitment my clearfix">

					</ul>
				</div>
				<!-- //bbs_basic list -->

				<div class="bbs_empty">
					<p><spring:message code="counsel.msg.no.data"/></p>
				</div>
				<!-- //bbs_empty -->

				<div class="bbs_btn_wrap clearfix">
					<span class="bbs_left">

					</span>
					<span class="bbs_right">
						<button type="button" onclick="fnDeleteWorkshop();" class="bbs_btn delete"><spring:message code="button.delete"/></button>
					</span>
				</div>
				<!-- //bbs_btn_wrap -->

				<div class="pagination">
				</div>
				<!--  //pagination -->

			</div>
	    	<!-- //contents -->
	    </article>
	</main>
	<!-- //main.colgroup -->