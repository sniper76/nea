function fnGoMain() {
	//alert("메인페이지로 이동 예정,메인페이지 개발예정");
	location.href=  contextPath + "/index.do?lang=en";

}

function fnGoFindPwd() {
	var $form = $('<form></form>');
	var url = contextPath + "/findPwd.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var userAuthCd = "<input type=\"hidden\" name=\"userAuthCd\" value=\""+$("#userAuthCd").val()+"\">";
	$form.append(userAuthCd);
	$form.submit();
}


function fnGoFindId() {
	var $form = $('<form></form>');
	var url = contextPath + "/findId.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var userAuthCd = "<input type=\"hidden\" name=\"userAuthCd\" value=\""+$("#userAuthCd").val()+"\">";
	$form.append(userAuthCd);
	$form.submit();
}


function fnGoList(id) {
	try{
		if($("#currentPageNo").val() == "") {
			$("#currentPageNo").val("1");
		}
	}catch(e){}
	$("#"+id).submit();
}

function fnGoWrite(id) {
	$("#"+id).submit();
}

/*
 * val(sorting value)
 * sortId(정렬할 hidden id)
 * formId(검색조건을 싸고있는 폼id)
 * curPageId(현재페이지 1페이지로 변경)
*/
function fnSetSort(val,sortId,formId,curPageId) {
	$("#"+sortId).val(val);
	$("#"+curPageId).val("1");
	$("#"+formId).submit();

}

/*

 * formId(검색조건을 싸고있는 폼id)
 * actionUrl(전송 url)
*/
function fnGoWrite(formId,actionUrl) {
	$("#"+formId).attr('action', actionUrl);
	$("#"+formId).submit();
}


/*
   좋아요 저장,like update
 * cateCd(좋아요 카테고리)
 * seq(좋아요 게시물 번호)
 * likeBtnId(좋아요 버튼  id)
 * likeCntId(좋아요 count tag id)
 * actionUrl(전송 url)
 * likeSeq(좋아요 seq, 이미 등록되어 있을 경우, 신규등록시 ""입력)
*/
function fnLike(cateCd, seq, likeBtnId, likeCntId, likeSeq) {
	$.ajax({
		url: contextPath + "/cpes/all/likeAjax.do",
		method: METHOD_POST,
		data: {
			cateCd: cateCd,
			tableKeySeq: seq,
			likeSeq : likeSeq
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {
		if(data.result.successYn == "Y") {
			if(data.result.statCd == "01") {//계정이 존재하지않음,no member
				alertify.alert(noMemberFailMsg, function (e){
					fnGoCounselList();
				});
				return false;
			}
		}
		//debugger;
		//console.log("===================likeCntId html="+$("#"+likeCntId).html());

		//$("#"+likeBtnId).addClass("send");
		//$("#"+likeBtnId).attr('onclick', '').unbind('click');

		var spanHtml = "";
		var cnt = 0;

		if(likeSeq == "" || typeof likeSeq == "undefined"){
			$("#"+likeBtnId).html("<button class=\"btn_like send\" onclick=\"javascript:fnLike('" +
					cateCd +"','" + seq + "','" + likeBtnId + "','" + likeCntId + "', '" + data.result.returnVal +
					"');\"><spring:message code='counsel.msg.reg.like.cnt'/></button>");

			cnt = Number($("#"+likeCntId).html())+1;
		}else{
			$("#"+likeBtnId).html("<button class=\"btn_like\" onclick=\"javascript:fnLike('" +
					cateCd +"','" + seq + "','" + likeBtnId + "','" + likeCntId + "', '');\"><spring:message code='counsel.msg.reg.like.cnt'/></button>");

			cnt = Number($("#"+likeCntId).html())-1;
		}

		$("#"+likeCntId).html(cnt);

	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	})
}




/*
   상담 삭제
* counsel delete
* seq(id)
*/
function fnGoCounselDelete(seq,div) {
	var url = contextPath + "/cpes/private/counsel/deleteAjax.do";
	if(div == "ONEANDONE") {
		url = contextPath + "/cpes/all/counsel/deleteAjax.do";
	} else if(div == "MYPAGE_COUNSEL") {
		url = contextPath + "/cpes/private/mypage/counsel/deleteAjax.do";
	} else if(div == "MYPAGE_ONEANDONE") {
		url = contextPath + "/cpes/all/mypage/counsel/deleteAjax.do";
	}

	alertify.confirm(confirmDeleteMsg, function (e) {
		if (e) {
			$.ajax({
				url: url,
				method: METHOD_POST,
				data: {
					condSeq: seq
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {
				if(data.result.successYn == "Y") {
					if(data.result.statCd == "01") {//계정이 존재하지않음,no member
						alertify.alert(noMemberFailMsg, function (e){
							//fnGoList('frmSearch');
						});
						return false;
					} else if(data.result.statCd == "00") {
						alertify.alert(deleteSuccessMsg, function (e){
							fnGoList('frmSearch');
						});
					}

				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			})
	    }
	});
}


/*

 * formId(검색조건을 싸고있는 폼id)
 * actionUrl(전송 url)
*/
function fnGoMoveUrl(formId,actionUrl) {

	try {
		if($("#currentPageNo").val() == "") {
			$("#currentPageNo").val("1");
		}
	}catch(e){}

	$("#"+formId).attr('action', actionUrl);
	$("#"+formId).submit();
}


/*
* 게시판상세이동
* bulletin move view
* formId 폼아이디,form id
* seq(id)
*
*/
function fnGoBulletinView(formId,seq) {
	$("#condSeq").val(seq);
	$("#"+formId).attr('action', contextPath + "/bulletin/view.do");
	$("#"+formId).submit();
}

/*
* 로그인페이지 이동
* loing move
*/
function fnGoLogin() {
	location.href = contextPath + "/login.do";
}



/*
* 회원등록 이동
* Register member move
*/
function fnGoRegister() {
	location.href = contextPath + "/member/join.do";
}


/*
* 상담목록 이동
* counsel move list
* targetCd 상담타켓cd
*/
function fnGoCounsel(targetCd) {
	var $form = $('<form></form>');
	var url = contextPath + "/cpes/private/counsel/list.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var condTargetCd = "<input type=\"hidden\" name=\"condTargetCd\" value=\""+targetCd+"\">";


	$form.append(condTargetCd);
	$form.submit();


}



/*
* 상담목록 이동
* counsel move list
* cateDivCd 상담카테고리 cd
* targetCd 상담타켓cd
*/
function fnGoBulletin(seq) {
	var $form = $('<form></form>');
	var url = contextPath + "/bulletin/list.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var condBulletinMngSeq = "<input type=\"hidden\" name=\"condBulletinMngSeq\" value=\""+seq+"\">";


	$form.append(condBulletinMngSeq);
	$form.submit();


}


/*
* 게시판상세이동
* bulletin move view
* formId 폼아이디,form id
* seq(id)
*
*/
function fnGoCommunityView(formId,seq) {
	$("#condSeq").val(seq);
	$("#"+formId).attr('action', contextPath + "/community/view.do");
	$("#"+formId).submit();
}


/*
* 댓글목록
* comment list
* seq bulletin seq
* id tag id
* pageNo 현재페이지
* depth 깊이
* moreBtnId 더보기버튼 아이디
*/
function fnCommentList(seq,id,pageNo,depth,moreBtnId) {
	$.ajax({
		url: contextPath + "/bulletin/commentListAjax.do",
		method: METHOD_POST,
		data: {
			condSeq: seq,
			currentPageNo: pageNo,
			condDepth: depth
		},
		dataType: AJAX_DATA_TYPE_HTML
	})
	.done(function(data) {
		//console.log("==========data.successYn="+data.result.successYn);
		$("#"+id).append(data);
		if(moreBtnId != null) {
			$("#"+moreBtnId).hide();
		}

/*		if(data.result.successYn == "Y") {
			if(data.resultList != null) {
				var strHmtl = "";
				strHmtl += "<ul>";
				for(var i=0; i<data.resultList.length; i++) {
					var obj = data.resultList[i];
					var content = obj.content.replace(/(?:\r\n|\r|\n)/g, '<br />');

					strHmtl += "<li>";

					strHmtl += "<div class=\"reply_title\">";
					strHmtl += "<strong class=\"name\">"+obj.regNm+"</strong>";
					strHmtl += "<span class=\"date\">"+obj.regDt+"</span>";
					if(obj.modifyYn == "Y") {
						strHmtl += "<button type=\"button\" class=\"delete\">Delete</button>";
					}
					strHmtl += "</div>";

					strHmtl += "<div class=\"reply_cont\">"+content+"</div>";

					if(obj.commentCnt > 0) {
						strHmtl += "<div class=\"reply_more\">";
						strHmtl += "<button type=\"button\" class=\"btn_more\">Reply</button><strong>20</strong>";
						strHmtl += "</div>";
					}


					strHmtl += "</li>";
				}
				strHmtl += "</ul>";

				$("#"+id).html(strHmtl);
			}
		}*/

	})
	.fail(function(xhr, status, errorThrown) {
		console.log("==========fnCommentList error");
	});
}


/*
* 댓글등록
* comment insert
* seq bulletin seq
* upperSeq comment parent seq
* depth 깊이
* sort 정렬
* contentId 컨텐츠아이디
*
*/
function fnCommentWrite(seq,upperSeq,depth,sort,contentId) {
	if($("#"+contentId).val() == "") {
		alertify.alert(contentFailMsg, function (e){
			$("#"+contentId).focus();
		});
		return false;
	}

	$.ajax({
		url: contextPath + "/bulletin/commentWriteAjax.do",
		method: METHOD_POST,
		data: {
			bulletinSeq: seq,
			upperCommentSeq: upperSeq,
			depth: depth,
			sort: sort,
			content: $("#"+contentId).val()
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {
		if(data.result.successYn == "Y") {
			$("#"+contentId).val("");
			$("#commentList").empty();
			fnCommentList(seq,"commentList","1","1");
		} else {
			if(data.result.statCd == "01") {
				alertify.alert(loginAfterMsg, function (e){

				});
			} else if(data.result.statCd == "02") {
				alertify.alert(noMemberFailMsg, function (e){

				});
			}
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


/*
* 댓글에 댓글 목록
* comment reply list
* id comment reply list 활성화 id
* id2 comment reply list id
* id3 comment reply count id
* seq 부모댓글 seq
* depth 깊이
*
*/
function fnGoCommentReplyList(id,id2,id3, bulletinSeq,commentSeq, depth ) {
	$("#"+id).addClass("active");//댓글에 댓글 입력폼, 댓글 목록 활성화

	/*
	* 댓글에 댓글목록
	* comment reply list
	* seq bulletin seq
	* id tag id
	* pageNo 현재페이지
	* depth 깊이
	* moreBtnId 더보기버튼 아이디
	*/
	fnCommentReplyList(bulletinSeq,commentSeq, depth, id2, id3 );//댓글에 댓글목록 조회

}



/*
* 댓글에 댓슬 등록
* comment reply insert
* seq bulletin seq
* upperSeq comment parent seq
* depth 깊이
* sort 정렬
* contentId 컨텐츠아이디
* replyListId 댓글에 댓글 목록 id
*
*/
function fnCommentReplyWrite(seq,upperSeq,depth,sort,contentId,replyListId, replyCntId) {
	if($("#"+contentId).val() == "") {
		alertify.alert(contentFailMsg, function (e){
			$("#"+contentId).focus();
		});
		return false;
	}

	$.ajax({
		url: contextPath + "/bulletin/commentWriteAjax.do",
		method: METHOD_POST,
		data: {
			bulletinSeq: seq,
			upperCommentSeq: upperSeq,
			depth: depth,
			sort: sort,
			content: $("#"+contentId).val()
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {
		console.log("==========data.result.successYn="+data.result.successYn);
		if(data.result.successYn == "Y") {

			$("#"+replyListId).empty();
			fnCommentReplyList(seq,upperSeq,"2",replyListId, replyCntId);//댓글에 댓글 목록
		} else {
			if(data.result.statCd == "01") {
				alertify.alert(loginAfterMsg, function (e){

				});
			} else if(data.result.statCd == "02") {
				alertify.alert(noMemberFailMsg, function (e){

				});
			}
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


/*
* 댓글에 댓글목록
* comment reply list
* seq bulletin seq
* upperSeq 현재페이지
* depth 깊이
* replyListId 댓글에 댓글 목록 id
* replyCntId  댓글에 댓글 갯수 id
*/
function fnCommentReplyList(seq,upperSeq, depth, replyListId, replyCntId ) {
	$.ajax({
		url: contextPath + "/bulletin/commentReplyListAjax.do",
		method: METHOD_POST,
		data: {
			condSeq: seq,
			condUpperSeq: upperSeq,
			condDepth: depth
		},
		dataType: AJAX_DATA_TYPE_HTML
	})
	.done(function(data) {
		$("#"+replyListId).html(data);
		var cnt = $('#'+replyListId).find('li').length;
		$("#"+replyCntId).html(cnt);//첫번째 댓글에 하위 댓글 갯수

	})
	.fail(function(xhr, status, errorThrown) {
		console.log("==========fnCommentReplyList error");
	});
}


/*
* 댓글에 댓글 삭제
* comment reply delete
* obj 이벤트객체
* bulletinSeq bulletin seq
* commentSeq comment seq
* upperCommentSeq 상위 comment seq
* depth 깊이
*/
function fnGoDeleteReplyComment(obj,bulletinSeq, commentSeq, upperCommentSeq,depth) {
	var replyListId = $(obj).parents("ul").attr("id");//댓글에 댓글 목록 id
	var replyCntId = "replyCnt_"+replyListId.replace("commentReplyList_","");//댓글에 댓글 갯수 id

	alertify.confirm(confirmCommentDeleteMsg, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/bulletin/commentDeleteAjax.do",
				method: METHOD_POST,
				data: {
					bulletinSeq: bulletinSeq,
					commentSeq: commentSeq,
					upperCommentSeq: upperCommentSeq,
					depth: depth
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {
				console.log("==========data.result.successYn="+data.result.successYn);
				if(data.result.successYn == "Y") {
					$("#"+replyListId).empty();
					fnCommentReplyList(bulletinSeq,upperCommentSeq,"2",replyListId, replyCntId);//댓글에 댓글 목록
				} else {
					if(data.result.statCd == "01") {
						alertify.alert(loginAfterMsg, function (e){

						});
					} else if(data.result.statCd == "02") {
						alertify.alert(noMemberFailMsg, function (e){

						});
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}



/*
* 댓글 삭제
* comment delete
* id comment list id
* bulletinSeq bulletin seq
* commentSeq comment seq
* depth 깊이
*/
function fnGoDeleteComment(id,bulletinSeq, commentSeq,depth) {

	alertify.confirm(confirmCommentDeleteMsg, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/bulletin/commentDeleteAjax.do",
				method: METHOD_POST,
				data: {
					bulletinSeq: bulletinSeq,
					commentSeq: commentSeq,
					upperCommentSeq: commentSeq,
					depth: depth
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					$("#commentList").empty();
					fnCommentList(bulletinSeq,"commentList","1","1");
				} else {
					if(data.result.statCd == "01") {
						alertify.alert(loginAfterMsg, function (e){

						});
					} else if(data.result.statCd == "02") {
						alertify.alert(noMemberFailMsg, function (e){

						});
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}


/*
* 게시물 삭제
* bulletin delete
* formId form id
* seq bulletin seq
*/
function fnGoBulletinDelete(formId, seq) {
	alertify.confirm(confirmDeleteMsg, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/community/deleteAjax.do.do",
				method: METHOD_POST,
				data: {
					bulletinSeq: seq
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					 if(data.result.statCd == "00") {
						alertify.alert(deleteSuccessMsg, function (e){
							fnGoList('frmSearch');
						});
					 }
				} else {
					if(data.result.statCd == "01") {//로그인하지 않음,no member
						alertify.alert(loginAfterMsg, function (e){
							fnGoList('frmSearch');
						});
						return false;
					} else if(data.result.statCd == "02"){//회원정보가 없음
						alertify.alert(noMemberFailMsg);
					}  else {
						alertify.alert(systemMsg);
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}


/*
* 입사지원
* formId form id
*/
function fnApplicSave(seq,seq2,frmId) {
	alertify.confirm(confirmApplicSaveMsg, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/cpes/private/applic/writeProcessAjax.do",
				method: METHOD_POST,
				data: {
					condSeq: seq,
					condSeq2: seq2
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					alertify.alert(saveMsg, function (e){
						fnGoList(frmId);
					});

				} else {
					if(data.result.statCd == "01") {
						alertify.alert(noMemberFailMsg);
					} else {
						alertify.alert(systemMsg);
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}


function fnDelBkmk(seq, frmId) {
	alertify.confirm(confirmDeleteMsg2, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/cpes/all/bookMarkAjax.do",
				method: METHOD_POST,
				data: {
					bkmkSeq: seq
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					alertify.alert(deleteSuccessMsg, function (e){
						fnGoList(frmId);
					});

				} else {
					if(data.result.statCd == "01") {
						alertify.alert(noMemberFailMsg);
					} else {
						alertify.alert(systemMsg);
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}


/*
* 북마크 등록(seq 가 값이 없을경우 삭제 처리)
* seq bookmark seq
* contentSeq contentSeq
* cateCd bookmark category
* formId form id
* tagId tag id(북마크 클릭 버튼을 싸고 있는 tag)
* btnId button id
*/
function fnBkmk(seq, contentSeq, cateCd, tagId, btnId) {

	$.ajax({
		url: contextPath + "/cpes/all/bookMarkAjax.do",
		method: METHOD_POST,
		data: {
			bkmkSeq: seq,
			tableKeySeq: contentSeq,
			cateCd: cateCd
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {

		if(data.result.successYn == "Y") {
			var resultConfirmMsg = deleteSuccessMsg;
			if(seq == null || seq == "") {//북마크 추가
				resultConfirmMsg = saveMsg;
			}
			alertify.alert(resultConfirmMsg, function (e){
				var btnText = $("#"+btnId).html();
				$("#"+tagId).empty();
				var btnHtml = "";
				if(seq == null || seq == "") {//북마크 추가
					btnHtml = "<button type=\"button\" id=\""+btnId+"\" onclick=\"fnBkmk('"+data.result.returnVal+"','"+contentSeq+"','"+cateCd+"', '"+tagId+"', '"+btnId+"');\" class=\"button save on\">"+ btnText +"</button>";
				} else {
					btnHtml = "<button type=\"button\" id=\""+btnId+"\" onclick=\"fnBkmk('','"+contentSeq+"','"+cateCd+"', '"+tagId+"', '"+btnId+"');\" class=\"button save\">"+ btnText +"</button>";
				}

				//console.log("=============btnHtml="+btnHtml);
				$("#"+tagId).html(btnHtml);

			});

		} else {
			if(data.result.statCd == "01") {
				alertify.alert(noMemberFailMsg);
			} else {
				alertify.alert(systemMsg);
			}
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});

}


/*
* 이력서 상세 화면
* seq 이력서 seq
* seq2 채용공고 seq
*/
function fnGoCompnyResumeView(seq,seq2){
	var $form = $('<form></form>');
	var url = contextPath + "/cpes/compny/resume/resumeDetail.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var tempFlag = "<input type=\"hidden\" name=\"tempFlag\" value=\"0\">";
	var resumeSeq = "<input type=\"hidden\" name=\"resumeSeq\" value=\""+seq+"\">";

	if(seq2 != null) {
		var vacancySeq = "<input type=\"hidden\" name=\"vacancySeq\" value=\""+seq2+"\">";
		$form.append(tempFlag).append(resumeSeq).append(vacancySeq);
	} else {
		$form.append(tempFlag).append(resumeSeq);
	}


	$form.submit();
}

//채용공고 상세
function fnVacancyView(seq,frmId) {
	$("#condSeq").val(seq);
	$("#"+frmId).attr('action', contextPath + "/vacancy/view.do");
	$("#"+frmId).submit();
}


function fnFairCompnyVacancyList(seq,frmId) {
	$("#condSeq").val(seq);
	$("#"+frmId).attr('action', contextPath + "/cpes/compny/fair/vacancyList.do");
	$("#"+frmId).submit();
}


function fnLogout() {
	$.ajax({
		url: contextPath + "/loginOutAjax.do",
		method: METHOD_POST,
		data: {},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {

		if(data.result.successYn == "Y") {
			fnGoMain();
		} else {
			alertify.alert(systemMsg);
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


/*
* 학위 list
* major list
* lvl 레벨,level
* id selectbox id
* cd upper cd
* selectedVal selected val
*/
function fnIscedCdList(lvl,id,cd,selectedVal) {
	$.ajax({
		url: contextPath + "/common/iscedCdAjax.do",
		method: METHOD_POST,
		data: {
			condLvl: lvl,
			condUpperCd: cd
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {

		if(data.result.successYn == "Y") {

			$("#"+id).empty();
			$("#"+id).append("<option value=''>"+choiceSelectOptionMsg+"</option>");

			for(var i=0; i<data.resultList.length; i++) {
				$("#"+id).append("<option value='"+data.resultList[i].iscedCd+"'>"+data.resultList[i].nm+"</option>");
			}

			if(selectedVal !=null && selectedVal !="") {
				$("#"+id).val(selectedVal);
			}
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}

/*
* 학위 list(upper cd가 있을경우)
* major list
* id 상위 selectbox id
* id2 하위 selectbox id
*/
function fnIscedCdUpperList(id,id2,val) {
	if($("#"+id).val() == "") {
		alertify.alert(isicedCdChoiceMsg, function (e){
			$("#"+id).focus();
		});
		return false;
	} else {
		fnIscedCdList('2',id2,$("#"+id).val(),val);
	}
}


//교육프로그램 상세
function fnEduTrnngView(seq,frmId) {
	$("#condSeq").val(seq);
	$("#"+frmId).attr('action', contextPath + "/eduTrnng/view.do");
	$("#"+frmId).submit();
}

//교육기관 상세
function fnInsttView(seq) {
	var $form = $('<form></form>');
	var url = contextPath + "/instt/view.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var condSeq = "<input type=\"hidden\" name=\"condSeq\" value=\""+seq+"\">";


	$form.append(condSeq);
	$form.submit();
}


//기업 상세
function fnCompnyView(seq) {
	var $form = $('<form></form>');
	var url = contextPath + "/compny/view.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var condSeq = "<input type=\"hidden\" name=\"condSeq\" value=\""+seq+"\">";


	$form.append(condSeq);
	$form.submit();
}


//기업별 진행중인 채용공고 목록
function fnContinueVacancyList(seq, tagId, pageNo) {
	$.ajax({
		url: contextPath + "/compny/vacancyContinueListAjax.do",
		method: METHOD_POST,
		data: {
			condSeq: seq,
			currentPageNo: pageNo
		},
		dataType: AJAX_DATA_TYPE_HTML
	})
	.done(function(data) {
		$("#"+tagId).html(data);
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


/*
* 북마크 등록(seq 가 값이 없을경우 삭제 처리)
* seq bookmark seq
* contentSeq contentSeq
* cateCd bookmark category
* tagId tag id(북마크 클릭 버튼을 싸고 있는 tag)
* btnId button id
*/
function fnBkmkType2(seq, contentSeq, cateCd, btnId, tagId) {

	$.ajax({
		url: contextPath + "/cpes/all/bookMarkAjax.do",
		method: METHOD_POST,
		data: {
			bkmkSeq: seq,
			tableKeySeq: contentSeq,
			cateCd: cateCd
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {

		if(data.result.successYn == "Y") {
			var resultConfirmMsg = deleteSuccessMsg;
			if(seq == null || seq == "") {//북마크 추가
				resultConfirmMsg = saveMsg;
			}
			alertify.alert(resultConfirmMsg, function (e){
				var btnText = $("#"+btnId).html();

				//console.log("=========================tagId="+tagId+",btnId="+btnId+",btnText="+btnText+",seq="+seq);

				$("#"+tagId).empty();
				var btnHtml = "";
				if(seq == null || seq == "") {//북마크 추가
					btnHtml = "<button type=\"button\" id=\""+btnId+"\" onclick=\"fnBkmkType2('"+data.result.returnVal+"','"+contentSeq+"','"+cateCd+"', '"+btnId+"', '"+tagId+"');\" class=\"interest on\">"+ btnText +"</button>";
				} else {
					btnHtml = "<button type=\"button\" id=\""+btnId+"\" onclick=\"fnBkmkType2('','"+contentSeq+"','"+cateCd+"',  '"+btnId+"', '"+tagId+"');\" class=\"interest save\">"+ btnText +"</button>";
				}

				//console.log("=============btnHtml="+btnHtml);
				$("#"+tagId).html(btnHtml);
			});

		} else {
			if(data.result.statCd == "01") {
				alertify.alert(noMemberFailMsg);
			} else {
				alertify.alert(systemMsg);
			}
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});

}


/*
* 입사지원
* seq vacancy seq
* seq2 resume seq
* tagId onclic a tag를싸고 있는 tagId
* tagId a tag id
*/
function fnApplicSaveType2(seq, seq2, aTagid) {
	alertify.confirm(confirmApplicSaveMsg, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/cpes/private/applic/writeProcessAjax.do",
				method: METHOD_POST,
				data: {
					condSeq: seq,
					condSeq2: seq2
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					alertify.alert(saveMsg, function (e){

						$("#"+aTagid).prop("onclick", null);
						$("#"+aTagid).removeClass("on");

					});

				} else {
					if(data.result.statCd == "01") {
						alertify.alert(noMemberFailMsg);
					} else {
						alertify.alert(systemMsg);
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}

/*
* isiccd list(upper cd가 있을경우)
* 산업분류 list
* id 상위 selectbox id
* id2 하위 selectbox id
*/
function fnIsicCdUpperList(id,id2,val) {
	if($("#"+id).val() == "") {
		alertify.alert(isicCdChoiceMsg, function (e){
			$("#"+id).focus();
		});
		return false;
	} else {
		fnIsicCdList('2',id2,$("#"+id).val(),val);
	}
}


/*
* isiccd list
* 산업분류 list
* lvl 레벨,level
* id selectbox id
* cd upper cd
* selectedVal selected val
*/
function fnIsicCdList(lvl,id,cd,selectedVal) {
	$.ajax({
		url: contextPath + "/common/isicCdAjax.do",
		method: METHOD_POST,
		data: {
			condLvl: lvl,
			condUpperCd: cd
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {

		if(data.result.successYn == "Y") {

			$("#"+id).empty();
			$("#"+id).append("<option value=''>"+choiceSelectOptionMsg+"</option>");

			for(var i=0; i<data.resultList.length; i++) {
				$("#"+id).append("<option value='"+data.resultList[i].isicCd+"'>"+data.resultList[i].nm+"</option>");
			}

			if(selectedVal !=null && selectedVal !="") {
				$("#"+id).val(selectedVal);
			}
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


function fnGoEduTrnng() {
	var $form = $('<form></form>');
	var url = contextPath + "/eduTrnng/eduTrnngList.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	$form.submit();
}


function fnGoNeaEduTrnng() {
	var $form = $('<form></form>');
	var url = contextPath + "/eduTrnng/eduTrnngNeaList.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	$form.submit();
}


function fnGoEduTrnngArea() {
	var $form = $('<form></form>');
	var url = contextPath + "/eduTrnng/eduTrnngAreaList.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	$form.submit();
}

function fnGoEduTrnngByUrl(url) {
	var $form = $('<form></form>');
	var url = contextPath + url;

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	$form.submit();
}

/*
* 북마크 일괄 삭제
* 삭제할 북마크 seq array
* frmId 폼아이디
*/
function fnBkmkDelList(seqArr, frmId) {
	alertify.confirm(confirmDeleteMsg2, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/cpes/all/bookMarkDeListAjax.do",
				method: METHOD_POST,
				data: {
					bkmkSeqStr: seqArr.join(",")
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					alertify.alert(deleteSuccessMsg, function (e){
						fnGoList(frmId);
					});

				} else {
					alertify.alert(systemMsg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}


function fnContinueEduTrnngList(seq,pageNo,tagId) {
	//console.log("#####################seq="+seq+",pageNo="+pageNo+",tagId="+tagId);

	$.ajax({
		url: contextPath + "/instt/eduTrnngContinueListAjax.do",
		method: METHOD_POST,
		data: {
			condSeq: seq,
			currentPageNo: pageNo
		},
		dataType: AJAX_DATA_TYPE_HTML
	})
	.done(function(data) {
		//console.log("#####################data="+data);
		$("#"+tagId).html(data);
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}



//교육훈련 상세
function fnEduTrnngNeaView(seq,frmId) {
	$("#condSeq").val(seq);
	$("#"+frmId).attr('action', contextPath + "/eduTrnng/viewNea.do");
	$("#"+frmId).submit();
}



//채용행사 상세
function fnJobFairView(seq,frmId) {
	$("#condSeq").val(seq);
	$("#"+frmId).attr('action', contextPath + "/jobFair/view.do");
	$("#"+frmId).submit();
}



/*
* offer save
* 입사제의 저장
* seq offer seq
* seq2 vacancy seq
* div 수락,거절 구분
*/
function fnOfferSave(seq,seq2,div) {
	var url = contextPath + "/cpes/private/applic/offerOkAjax.do";
	if(div == "REJECT") {
		url = contextPath + "/cpes/private/applic/offerRejectAjax.do";
	}

	alertify.confirm(referralMsg, function (e) {
		if (e) {
			$.ajax({
				url: url,
				method: METHOD_POST,
				data: {
					offerSeq: seq,
					vacancySeq: seq2
				},
				dataType: AJAX_DATA_TYPE_JSON
			})
			.done(function(data) {

				if(data.result.successYn == "Y") {
					alertify.alert(saveMsg, function (e){
						location.reload();
					});

				} else {
					alertify.alert(systemMsg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
	    }
	});
}

/*
* 입사지원 취소
* applic cancel
* seq resume seq
* seq2 vacancy seq
*/
function fnApplicCancel(seq,seq2) {
	alertify.confirm(cancelApplicMsg, function (e) {
		if (e) {
			$.ajax({
				url: contextPath + "/cpes/private/applic/cancelProcessAjax.do",
				type: 'post',
				data: {
					condSeq : seq,
					condSeq2 : seq2
				},
				datatype: 'json'
			})
			.done(function(data) {
				if (data.result.successYn == "Y") {
					alertify.alert(cancelResultMsg, function (e){
						location.reload();
					});

				} else {
					alertify.alert(systemMsg);
				}
			})
			.fail(function(xhr, status, errorThrown) {
				alertify.alert(systemMsg);
			});
		}
	});

}


/*
* 직종 조회
* isco list
* obj selectbox object(this)
* lvl 레벨
* id1 1레벨 id
* id1 2레벨 id
* id1 3레벨 id
* id1 4레벨 id
* selectedVal 강제선택
*/
function fnIscoCdList(obj,lvl,id1,id2,id3,id4,selectedVal,requiredValYn) {
	var val = $(obj).val();

	if(val == "" && (requiredValYn == null || requiredValYn == 'Y')) {
		alertify.alert(iscoCdNotValueMsg, function (e){

		});
		return false;
	}
	if(val == "") {
		if(lvl == "" || lvl == null) {
			if(id1 !=null && id1 !="") fnSelectBoxEmpty(id1,"Y");
			if(id2 !=null && id2 !="") fnSelectBoxEmpty(id2,"Y");
			if(id3 !=null && id3 !="") fnSelectBoxEmpty(id3,"Y");
			if(id4 !=null && id4 !="") fnSelectBoxEmpty(id4,"Y");
		} else if(lvl == "1") {
			if(id2 !=null && id2 !="") fnSelectBoxEmpty(id2,"Y");
			if(id3 !=null && id3 !="") fnSelectBoxEmpty(id3,"Y");
			if(id4 !=null && id4 !="") fnSelectBoxEmpty(id4,"Y");
		} else if(lvl == "2") {
			if(id3 !=null && id3 !="") fnSelectBoxEmpty(id3,"Y");
			if(id4 !=null && id4 !="") fnSelectBoxEmpty(id4,"Y");
		} else if(lvl == "3") {
			if(id4 !=null && id4 !="") fnSelectBoxEmpty(id4,"Y");
		}
		return false;
	}

	$.ajax({
		url: contextPath + "/common/iscoCdListAjax.do",
		type: 'post',
		data: {
			depth : lvl,
			cd : val
		},
		datatype: 'json'
	})
	.done(function(data) {
		if (data.result.successYn == "Y") {

			if(lvl == "" || lvl == null) {
				fnSelectBoxEmpty(id1,"Y");

				fnSelectBoxIscoCdMake(id1,data.resultList);

				if(id2 !=null && id2 !="") {
					fnSelectBoxEmpty(id2,"Y")
				}

				if(id3 !=null && id3 !="") {
					fnSelectBoxEmpty(id3,"Y")
				}

				if(id4 !=null && id4 !="") {
					fnSelectBoxEmpty(id4,"Y")
				}
			} else if(lvl == "1") {
				fnSelectBoxEmpty(id2,"Y");
				fnSelectBoxIscoCdMake(id2,data.resultList);

				if(id3 !=null && id3 !="") {
					fnSelectBoxEmpty(id3,"Y");
				}

				if(id4 !=null && id4 !="") {
					fnSelectBoxEmpty(id4,"Y");
				}

			} else if(lvl == "2") {
				fnSelectBoxEmpty(id3,"Y");
				fnSelectBoxIscoCdMake(id3,data.resultList);

				if(id4 !=null && id4 !="") {
					fnSelectBoxEmpty(id4,"Y");
				}

			} else if(lvl == "3") {
				fnSelectBoxEmpty(id4,"Y");
				fnSelectBoxIscoCdMake(id4,data.resultList);
			}

		} else {
			alertify.alert(systemMsg);
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


function fnSelectBoxIscoCdMake(id, resultList, selectedVal) {

	for(var i=0; i<resultList.length; i++) {
		$("#"+id).append("<option value='"+resultList[i].cd+"'>"+resultList[i].cdNm+"</option>");
	}


	console.log("######################fnSelectBoxIscoCdMake val="+selectedVal);
	if(selectedVal != null) {
		$("#"+id).val(selectedVal);
	}
}


function fnSelectBoxEmpty(id,noOptionYn) {
	$("#"+id).empty();
	if(noOptionYn == "Y") {
		$("#"+id).append("<option value=''>"+allMsg+"</option>");
	}
}


/*
* 지역 조회
* area list
* obj selectbox object(this)
* lvl 레벨
* id selectbox id
* id2 selectbox
* cntryId 국가코드
* selectedVal 강제선택
*/
function fnAreaCdList(obj,lvl,id,id2,cntryId,selectedVal,requiredValYn) {
	var val = $(obj).val();
	if(cntryId == null | cntryId == "") {
		cntryId = CONTRY_CD_CAMBODIA;
	}

	if(val == "" && (requiredValYn == null || requiredValYn == 'Y')) {
		alertify.alert(areaNotValueMsg, function (e){

		});
		return false;
	}
	if(val == "") {
		if(lvl == "" || lvl == null) {
			if(id1 !=null && id1 !="") fnSelectBoxEmpty(id1,"Y");
			if(id2 !=null && id2 !="") fnSelectBoxEmpty(id2,"Y");
		} else if(lvl == "1") {
			if(id2 !=null && id2 !="") fnSelectBoxEmpty(id2,"Y");
		}
		return false;
	}

	$.ajax({
		url: contextPath + "/common/nextDepthSelectAjax.do",
		type: 'post',
		data: {
			condCntryId: cntryId,
			depth: lvl,
			condGrpCd: val,
			cdLength: 3
		},
		datatype: 'json'
	})
	.done(function(data) {
		if (data.result2.successYn == "Y") {
			if(lvl == "" || lvl == null) {
				fnSelectBoxEmpty(id1,"Y");
				fnSelectBoxAreaMake(id,data.result,selectedVal);

				if(id2 !=null && id2 !="") {
					fnSelectBoxEmpty(id2,"Y")
				}


			} else if(lvl == "1") {
				fnSelectBoxEmpty(id2,"Y");
				fnSelectBoxAreaMake(id2,data.result,selectedVal);
			}

		} else {
			alertify.alert(systemMsg);
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}



function fnSelectBoxAreaMake(id, resultList, selectedVal) {
	for(var i=0; i<resultList.length; i++) {
		$("#"+id).append("<option value='"+resultList[i].lvlCd+"'>"+resultList[i].nm+"</option>");
	}

	if(selectedVal != null) {
		$("#"+id).val(selectedVal);
	}
}


/*
* 직종 조회
* isco list
* obj selectbox object(this)
* lvl 레벨
* id1 1레벨 id
* id1 2레벨 id
* id1 3레벨 id
* id1 4레벨 id
* selectedVal 강제선택
*/
function fnIscoCdListType2(val,lvl,id1,id2,id3,id4,selectedVal) {
	$.ajax({
		url: contextPath + "/common/iscoCdListAjax.do",
		type: 'post',
		data: {
			depth : lvl,
			cd : val
		},
		datatype: 'json'
	})
	.done(function(data) {
		if (data.result.successYn == "Y") {

			if(lvl == "" || lvl == null) {
				fnSelectBoxEmpty(id1,"Y");

				fnSelectBoxIscoCdMake(id1,data.resultList,selectedVal);

				if(id2 !=null && id2 !="") {
					fnSelectBoxEmpty(id2,"Y")
				}

				if(id3 !=null && id3 !="") {
					fnSelectBoxEmpty(id3,"Y")
				}

				if(id4 !=null && id4 !="") {
					fnSelectBoxEmpty(id4,"Y")
				}
			} else if(lvl == "1") {
				fnSelectBoxEmpty(id2,"Y");


				fnSelectBoxIscoCdMake(id2,data.resultList,selectedVal);

				if(id3 !=null && id3 !="") {
					fnSelectBoxEmpty(id3,"Y");
				}

				if(id4 !=null && id4 !="") {
					fnSelectBoxEmpty(id4,"Y");
				}

			} else if(lvl == "2") {
				fnSelectBoxEmpty(id3,"Y");
				fnSelectBoxIscoCdMake(id3,data.resultList,selectedVal);

				if(id4 !=null && id4 !="") {
					fnSelectBoxEmpty(id4,"Y");
				}

			} else if(lvl == "3") {
				fnSelectBoxEmpty(id4,"Y");
				fnSelectBoxIscoCdMake(id4,data.resultList,selectedVal);
			}

		} else {
			alertify.alert(systemMsg);
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	});
}


/*
* 상담목록 이동
* counsel move list
* targetCd 상담타켓cd
*/
function fnGoNewEduTrnngView(seq,div) {
	var $form = $('<form></form>');

	var url = contextPath + "/eduTrnng/softSkillView.do";

	if(div == "employement") {
		url = contextPath + "/eduTrnng/view.do";
	}



	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var condSeq = "<input type=\"hidden\" name=\"condSeq\" value=\""+seq+"\">";


	$form.append(condSeq);
	$form.submit();
}


//채용공고 상세
function fnVacancyView2(seq) {
	var $form = $('<form></form>');

	var url = contextPath + "/vacancy/view.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var condSeq = "<input type=\"hidden\" name=\"condSeq\" value=\""+seq+"\">";


	$form.append(condSeq);
	$form.submit();
}

// 이력서 상세 화면
function fnResumeView(seq, tempFlag){
	var tempVal = "0";
	if(tempFlag == "Y"){
		tempVal = "1";
	}

	var $form = $('<form></form>');

	var url = contextPath + "/cpes/private/resume/resumeDetail.do";

	$form.attr('action', url);
	$form.attr('method', 'post');
	$form.appendTo('body');

	var resumeSeq = "<input type=\"hidden\" name=\"resumeSeq\" value=\""+seq+"\">";
	var tempFlag = "<input type=\"hidden\" name=\"tempFlag\" value=\""+tempVal+"\">";

	$form.append(resumeSeq).append(tempFlag);
	$form.submit();

}


function fnVideoIntvwOpen(seq, seq2, dialogId) {



	$(".ui-dialog-titlebar").remove();//다이얼로그 상단 타이틀 제거

	$.ajax({
		url: contextPath + "/cpes/all/common/videoIntvwViewAjax.do",
		method: METHOD_POST,
		data: {
			condSeq: seq,
			condSeq2: seq2
		},
		dataType: AJAX_DATA_TYPE_JSON
	})
	.done(function(data) {
		if(data.result.successYn == "Y") {
			$("#videoUserNm").html(data.result2.userNm);
			$("#videoUserCell").html(data.result2.userCell);
			$("#videoCompnyNm").html(data.result2.compnyNm);
			$("#videoVacancyTitle").html(data.result2.vacancyTitle);
			$("#videoMngerNm").html(data.result2.mngerNm);
			$("#videoMngerCell").html(data.result2.mngerCell);
			$("#videoJobskJcNm").html(data.result2.jobskJcNm);
			$("#videoCompnyJcNm").html(data.result2.compnyJcNm);
			$("#videoIntvwDt").html(data.result2.videoIntvwDt +" " + data.result2.videoTimeTableNm);

			$('#'+dialogId).dialog({
		    	title: '',
		      	modal: true,
		      	width: '700',
		      	height: '300',
		      	hideCloseButton: true
			});
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alertify.alert(systemMsg);
	})
}
