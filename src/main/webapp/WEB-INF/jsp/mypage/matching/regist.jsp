<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/inc.jsp" %>

    <script>
    	$(document).ready(function() {
    		$('select#locLvl1').change(function() {
    			locSelectObject.level1Change(true, 1, 3, $(this).find('option:selected').val(), 'locLvl2');
    		});

    		$('select#iscoLvl1').change(function() {
    			//iscoSelectObject.level1Change(true, 1, $(this).find('option:selected').val(), 'iscoLvl2')
    			iscoChainObj.chain1Change(1,$(this).find('option:selected').val(),'iscoLvl2')
    			.chain2Change(2,'','iscoLvl3')
    			.chain3Change(3,'','iscoLvl4');
    		});
    		$('select#iscoLvl2').change(function() {
    			//iscoSelectObject.level2Change(true, 2, $(this).find('option:selected').val(), 'iscoLvl3')
    			iscoChainObj.chain2Change(2,$(this).find('option:selected').val(),'iscoLvl3')
    			.chain3Change(3,'','iscoLvl4');
    		});
    		$('select#iscoLvl3').change(function() {
    			//iscoSelectObject.level3Change(true, 3, $(this).find('option:selected').val(), 'iscoLvl4')
    			iscoChainObj.chain3Change(3,$(this).find('option:selected').val(),'iscoLvl4');
    		});

    		$('div.bbs_btn_wrap input[type=button]').click(function() {
    			fnSave();
    		});

    		fnGetInit();
		});

    	var locSelectObject = {
    			url : contextPath + '/common/nextDepthSelectAjax.do',
    			level1Change : function(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal) {//depth 1, 3, 101
    				this.getData(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal);
    			},
    			level2Change : function(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal) {//depth 2, 5, 10102
    				this.getData(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal);
    			},
    			level3Change : function(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal) {//depth 3, 7, 1010201
    				this.getData(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal);
    			},
    			getData : function(isChange, depth, cdLen, grpCd, nextSelId, nextSelVal) {
    				var that = this;
    				if(grpCd == '') {
    					var html = "<option value=''><spring:message code='member.join.msg.choice'/></option>";
    					$('select#'+nextSelId).empty();
    					$('select#'+nextSelId).html(html);
    					return;
    				}
    				$.ajax({
    					type: METHOD_POST,
    					url: that.url,
    					dataType: AJAX_DATA_TYPE_JSON,
    					data: {
    						depth : depth,
    						cdLength : cdLen,
    						condGrpCd : grpCd,
    						flag : 'addr'
    					},
    					success: function(data) {
    						that.makeHtml(isChange, data, nextSelId, nextSelVal);
    					},
    					error: function(xhr, status, error) {
    						alertify.alert("error to connecting server");
    					},
    				});
    			},
    			makeHtml : function(flag, data, nextSelId, nextSelVal) {

					/* console.log('data', data);
					console.log('nextSelId', nextSelId);
					console.log('nextSelVal', nextSelVal); */
					var html = "<option value=''><spring:message code='member.join.msg.choice'/></option>";
					if(data.result.length > 0){
						for(var i in data.result){
							var resultObj = data.result[i];
							html += "<option value='" + resultObj.lvlCd +"'>" + resultObj.nm + "</option>";
						}
					}
					$('select#'+nextSelId).empty();
					$('select#'+nextSelId).html(html);

					if(nextSelVal != undefined) {
						$('select#'+nextSelId).val(nextSelVal);
					}
    			}
    	};
/*
    	var iscoSelectObject = {
    			url : contextPath + '/common/nextDepthCdSelectAjax.do',
    			level1Change : function(isChange, depth, grpCd, nextSelId, nextSelVal) {//depth 1, 1
    				this.getData(isChange, depth, grpCd, nextSelId, nextSelVal);
    			},
    			level2Change : function(isChange, depth, grpCd, nextSelId, nextSelVal) {//depth 2, 11
    				this.getData(isChange, depth, grpCd, nextSelId, nextSelVal);
    			},
    			level3Change : function(isChange, depth, grpCd, nextSelId, nextSelVal) {//depth 3, 111
    				this.getData(isChange, depth, grpCd, nextSelId, nextSelVal);
    			},
    			getData : function(isChange, depth, grpCd, nextSelId, nextSelVal) {
    				var that = this;
    				if(grpCd == '') {
    					var html = "<option value=''><spring:message code='member.join.msg.choice'/></option>";
    					$('select#'+nextSelId).empty();
    					$('select#'+nextSelId).html(html);
    					switch(depth) {
    					case 1:
	    					$('select#iscoLvl3').empty();
	    					$('select#iscoLvl3').html(html);
	    					$('select#iscoLvl4').empty();
	    					$('select#iscoLvl4').html(html);
    						break;
    					case 2:
        					$('select#iscoLvl4').empty();
        					$('select#iscoLvl4').html(html);
    						break;
    					}
    					return;
    				}
    				$.ajax({
    					type: METHOD_POST,
    					url: that.url,
    					dataType: AJAX_DATA_TYPE_JSON,
    					data: {
    						depth : depth,
    						cd : grpCd,
    						flag : 'isco'
    					},
    					success: function(data) {
    						that.makeHtml(isChange, data, nextSelId, nextSelVal);
    					},
    					error: function(xhr, status, error) {
    						alertify.alert("error to connecting server");
    					},
    				});
    			},
    			makeHtml : function(flag, data, nextSelId, nextSelVal) {

					//console.log('data', data);
					//console.log('nextSelId', nextSelId);
					//console.log('nextSelVal', nextSelVal);
					var html = "<option value=''><spring:message code='member.join.msg.choice'/></option>";
					if(data.result.length > 0){
						for(var i in data.result){
							var resultObj = data.result[i];
							html += "<option value='" + resultObj.cd +"'>" + resultObj.cdNm + "</option>";
						}
					}
					$('select#'+nextSelId).empty();
					$('select#'+nextSelId).html(html);

					if(nextSelVal != undefined) {
						$('select#'+nextSelId).val(nextSelVal);
					}

					var idx = parseInt(nextSelId.substring(nextSelId.length - 1), 10);
					//console.log('idx', idx);
					//console.log('flag', flag);
    				if(flag) {
    					switch(idx) {
    					case 2:
    					$('select#iscoLvl'+(idx+1)).empty();
    					$('select#iscoLvl'+(idx+1)).html("<option value=''><spring:message code='member.join.msg.choice'/></option>");
    					$('select#iscoLvl'+(idx+2)).empty();
    					$('select#iscoLvl'+(idx+2)).html("<option value=''><spring:message code='member.join.msg.choice'/></option>");
    						break;
    					case 3:
    					$('select#iscoLvl'+(idx+1)).empty();
    					$('select#iscoLvl'+(idx+1)).html("<option value=''><spring:message code='member.join.msg.choice'/></option>");
    						break;
    					}
    				}
    			}
    	};*/

    	function fnSave() {
    		var iscoList = [], locList = [], langList = [], eduDegreeList = [], privilList = [];
    		var isco1 = {
    				jobskMatchSetIscoSeq : '',
    				iscoCd : $('select#iscoLvl1').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};
    		var isco2 = {
    				jobskMatchSetIscoSeq : '',
    				iscoCd : $('select#iscoLvl2').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};
    		var isco3 = {
    				jobskMatchSetIscoSeq : '',
    				iscoCd : $('select#iscoLvl3').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};
    		var isco4 = {
    				jobskMatchSetIscoSeq : '',
    				iscoCd : $('select#iscoLvl4').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};
    		iscoList.push(isco1);
    		iscoList.push(isco2);
    		iscoList.push(isco3);
    		if($('select#iscoLvl4').val() != '') {
    			iscoList.push(isco4);
    		}

    		var loc1 = {
    				jobskMatchSetLocSeq : '',
    				jobskMatchSetLocCd : $('select#locLvl1').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};
    		var loc2 = {
    				jobskMatchSetLocSeq : '',
    				jobskMatchSetLocCd : $('select#locLvl2').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};

    		locList.push(loc1);
    		if($('select#locLvl2').val() != '') {
    			locList.push(loc2);
    		}

    		$('input[name=language]:checked').each(function() {
        		var lang = {
        				jobskMatchSetLangSeq : '',
        				langCd : this.value,
        				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
        		};
        		langList.push(lang);
    		});

    		$('input[name=education]:checked').each(function() {
        		var edu = {
        				jobskMatchSetMinEduDegreeSeq : '',
        				minEduDegreeCd : this.value,
        				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
        		};
        		eduDegreeList.push(edu);
    		});

    		$('input[name=privilege]:checked').each(function() {
        		var edu = {
        				jobskMatchSetPreferntCondSeq : '',
        				preferntCondCd : this.value,
        				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
        		};
        		privilList.push(edu);
    		});

    		if($('select#iscoLvl1').val() == ''
    				|| $('select#iscoLvl2').val() == ''
    				|| $('select#iscoLvl3').val() == '') {
    			alertify.alert("<spring:message code="mypage.private.interest.msg4"/>");
    			return;
    		}

    		if($('select#locLvl1').val() == '') {
    			alertify.alert("<spring:message code="mypage.private.interest.msg5"/>");
    			return;
    		}

    		var params = {
    				iscoCdStr : JSON.stringify(iscoList),
    				locCdStr : JSON.stringify(locList),
    				langCdStr : JSON.stringify(langList),
    				eduDegreeCdStr : JSON.stringify(eduDegreeList),
    				privilegeCdStr : JSON.stringify(privilList),
    				hopeSalary : $('input[name=hopeSalary]').val(),
    				workTimeFullCd : $('input:checkbox[id=workTime_full]').is(':checked') ? $('input#workTime_full').val() : '',
    				workTimePartCd : $('input:checkbox[id=workTime_part]').is(':checked') ? $('input#workTime_part').val() : '',
    				employCtrctDecidCd : $('input:checkbox[id=contract_decId]').is(':checked') ? $('input#contract_decId').val() : '',
    				employCtrctUndecidCd : $('input:checkbox[id=contract_undecId]').is(':checked') ? $('input#contract_undecId').val() : '',
    				minWorkExp : $('input:radio[name=minWorkExp]:checked').val(),
    				jobskMatchSetSeq : '${matchingBean.jobskMatchSetSeq}',
    		};
    		//console.log('params', params);

			$.ajax({
				type: METHOD_POST,
				url: contextPath + '/cpes/private/matching/updateAjax.do',
				dataType: AJAX_DATA_TYPE_JSON,
				data: params,
				success: function(data) {
					if(data.result == "Y"){
						alertify.alert('<spring:message code="counsel.msg.update.ok"/>', function (e){
							//go list
							location.href = contextPath + "/cpes/private/matching/init.do";
						});
					}
				},
				error: function(xhr, status, error) {
					alertify.alert("error to connecting server");
				},
			});
    	}

    	var iscoChainObj = {
    			url : contextPath + '/common/nextDepthCdSelectAjax.do',
    			getData : function(depth, grpCd, nextSelId, nextSelVal) {
    				var that = this;
    				var html = '';
					$('select#'+nextSelId).empty();
    				if(grpCd == '') {
    					//empty draw
						html = "<option value=''><spring:message code='member.join.msg.choice'/></option>";
						$('select#'+nextSelId).html(html);
    					return;
    				}
    				$.ajax({
    					type: METHOD_POST,
    					url: that.url,
    					dataType: AJAX_DATA_TYPE_JSON,
    					data: {
    						depth : depth,
    						cd : grpCd,
    						flag : 'isco'
    					},
    					success: function(data) {
							html = "<option value=''><spring:message code='member.join.msg.choice'/></option>";
    						if(data.result.length > 0){
    							for(var i in data.result){
    								var resultObj = data.result[i];
    								html += "<option value='" + resultObj.cd +"'>" + resultObj.cdNm + "</option>";
    							}
    						}
   							$('select#'+nextSelId).html(html);

   							if(nextSelVal) {
   								$('select#'+nextSelId).val(nextSelVal);
   							}
    					},
    					error: function(xhr, status, error) {
    						alertify.alert("error to connecting server");
    					},
    				});
    			},
    			chain1Change : function(depth, grpCd, selId, selVal) {
    				this.getData(depth, grpCd, selId, selVal);
    				return this;
    			},
    			chain2Change : function(depth, grpCd, selId, selVal) {
    				this.getData(depth, grpCd, selId, selVal);
    				return this;
    			},
    			chain3Change : function(depth, grpCd, selId, selVal) {
    				this.getData(depth, grpCd, selId, selVal);
    				return this;
    			},
    	};

    	function fnGetInit() {
    		var employCtrctDecidCd = '${matchingBean.employCtrctDecidCd}';
    		var employCtrctUndecidCd = '${matchingBean.employCtrctUndecidCd}';
    		var workTimeFullCd = '${matchingBean.workTimeFullCd}';
    		var workTimePartCd = '${matchingBean.workTimePartCd}';
    		var hopeSalary = '${matchingBean.hopeSalary}';
    		var minWorkExp = '${matchingBean.minWorkExp}';

    		var iscoCdStr = '${matchingBean.iscoCdStr}';
    		var locCdStr = '${matchingBean.locCdStr}';
    		var langCdStr = '${matchingBean.langCdStr}';
    		var eduDegreeCdStr = '${matchingBean.eduDegreeCdStr}';
    		var privilegeCdStr = '${matchingBean.privilegeCdStr}';

    		var jobskMatchSetSeq = '${matchingBean.jobskMatchSetSeq}';

    		$('input[name=workTime][value="'+workTimeFullCd+'"]').prop('checked', true);
    		$('input[name=workTime][value="'+workTimePartCd+'"]').prop('checked', true);
    		$('input[name=contract][value="'+employCtrctDecidCd+'"]').prop('checked', true);
    		$('input[name=contract][value="'+employCtrctUndecidCd+'"]').prop('checked', true);
    		$('input[name=minWorkExp][value="'+minWorkExp+'"]').prop('checked', true);
    		$('input[name=hopeSalary]').val(hopeSalary);

    		var eduDegrees = [], langCds = [], locCds = [], iscoCds = [], privilCds = [];
    		if(eduDegreeCdStr.indexOf(',') > -1) {
    			var arr = eduDegreeCdStr.split(',');
    			for (var k=0; k<arr.length; k++) {
    				eduDegrees.push(arr[k]);
    			}
    		}
    		else {
    			eduDegrees.push(eduDegreeCdStr);
    		}

    		$.each(eduDegrees, function(i,o) {
    			$('input[name=education][value="'+o+'"]').prop('checked', true);
    		});

    		if(langCdStr.indexOf(',') > -1) {
    			var arr = langCdStr.split(',');
    			for (var k=0; k<arr.length; k++) {
    				langCds.push(arr[k]);
    			}
    		}
    		else {
    			langCds.push(langCdStr);
    		}

    		$.each(langCds, function(i,o) {
    			$('input[name=language][value="'+o+'"]').prop('checked', true);
    		});

    		if(privilegeCdStr.indexOf(',') > -1) {
    			var arr = privilegeCdStr.split(',');
    			for (var k=0; k<arr.length; k++) {
    				privilCds.push(arr[k]);
    			}
    		}
    		else {
    			privilCds.push(privilegeCdStr);
    		}

    		$.each(privilCds, function(i,o) {
    			$('input[name=privilege][value="'+o+'"]').prop('checked', true);
    		});

    		if(locCdStr.indexOf(',') > -1) {
    			var arr = locCdStr.split(',');

    			$('select#locLvl1').val(arr[0]);

    			if(arr.length > 1) {
    				locSelectObject.level1Change(false, 1, 3, arr[0], 'locLvl2', arr[1]);
    			}
    		}
    		else {
    			$('select#locLvl1').val(locCdStr);
    			locSelectObject.level1Change(false, 1, 3, locCdStr, 'locLvl2');
    		}
    		if(iscoCdStr.indexOf(',') > -1) {
    			var arr = iscoCdStr.split(',');
    			console.log('arr', arr);

    			$('select#iscoLvl1').val(arr[0]);

    			iscoChainObj.chain1Change(1,arr[0],'iscoLvl2',arr[1]).chain2Change(2,arr[1],'iscoLvl3',arr[2]);
    			if(arr.length > 3) {
    				iscoChainObj.chain3Change(3,arr[2],'iscoLvl4',arr[3]);
    			}
    		}
/*
    		if(iscoCdStr.indexOf(',') > -1) {
    			var arr = iscoCdStr.split(',');

    			//console.log('arr', arr);

    			$('select#iscoLvl1').val(arr[0]);
    			iscoSelectObject.level1Change(false, 1, arr[0], 'iscoLvl2', arr[1]);
    			iscoSelectObject.level2Change(false, 2, arr[1], 'iscoLvl3', arr[2]);
    			if(arr.length > 3) {
    				iscoSelectObject.level3Change(false, 3, arr[2], 'iscoLvl4', arr[3]);
    			}
    			else {
    				iscoSelectObject.level3Change(false, 3, arr[2], 'iscoLvl4');
    			}
    		}*/
/*
    		console.log('jobskMatchSetSeq', jobskMatchSetSeq);
    		console.log('employCtrctDecidCd', employCtrctDecidCd);
    		console.log('employCtrctUndecidCd', employCtrctUndecidCd);
    		console.log('workTimeFullCd', workTimeFullCd);
    		console.log('workTimePartCd', workTimePartCd);
    		console.log('hopeSalary', hopeSalary);
    		console.log('minWorkExp', minWorkExp);
    		console.log('iscoCdStr', iscoCdStr);
    		console.log('locCdStr', locCdStr);
    		console.log('langCdStr', langCdStr);
    		console.log('eduDegreeCdStr', eduDegreeCdStr);*/
    	}

	</script>

<main class="colgroup" id="colgroup">
            <article>
                <header class="sub_head">

                    <div class="sub_title">
						<h2><span><spring:message code="lnb.mypage.left.menu3"/></span></h2>
					</div>
                </header>

                <div id="contents" class="matchingRegist">


<div class="box type2 icon matching">
    <div class="box_wrap">
        <div class="title">Please Set your preferred conditions for finding your employee!</div>
        <p>Set your preference on job seeker such as occupation, sector, location, etc., <br />then <span class="em_point">you will receive job seeker list based on your preference.</span></p>
		<a href="${pageContext.request.contextPath}/cpes/private/matching/init.do" class="bbs_btn type01 matching_btn"><spring:message code="button.list"/></a>
    </div>
</div>


<div class="matching_detail">
	<form>
	</form>
		<fieldset>
			<legend><spring:message code="lnb.mypage.left.menu3"/></legend>
			<div class="contents_box">
				<table class="bbs_table">
					<caption><spring:message code="lnb.mypage.left.menu3"/></caption>
					<colgroup>
						<col style="width:15%;" />
						<col style="width:85%;" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="col"><spring:message code="mypage.compny.applic.title6"/></th>
						<td>
							<label for="iscoLvl1" class="skip">Occupation 1depth</label>
							<select id="iscoLvl1" name="iscoLvl1">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
								<c:forEach items="${iscoList }" var="iscoCd">
									<option value="${iscoCd.cd }"><c:out value="${iscoCd.cdNm }" escapeXml="false"/></span>
								</c:forEach>
							</select>
							<label for="iscoLvl2" class="skip">Occupation 2depth</label>
							<select id="iscoLvl2" name="iscoLvl2">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
							</select>
							<label for="iscoLvl3" class="skip">Occupation 3depth</label>
							<select id="iscoLvl3" name="iscoLvl3">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
							</select>
							<label for="iscoLvl4" class="skip">Occupation 4depth</label>
							<select id="iscoLvl4" name="iscoLvl4">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
							</select>
						</td>
					<tr>
						<th scope="col"><spring:message code="resume.text.addrProvcCd"/></th>
						<td>
							<label for="locLvl1" class="skip">Province selection</label>
							<select id="locLvl1" name="locLvl1">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
								<c:forEach items="${locCdList }" var="locCd">
									<option value="${locCd.lvlCd }"><c:out value="${locCd.nm }" escapeXml="false"/></span>
								</c:forEach>
							</select>
							<label for="locLvl2" class="skip">District selection</label>
							<select id="locLvl2" name="locLvl2">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
							</select>
							<%-- <label for="locLvl3" class="skip">District selection</label>
							<select id="locLvl3" name="locLvl3">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
							</select>
							<label for="locLvl4" class="skip">District selection</label>
							<select id="locLvl4" name="locLvl4">
								<option value=""><spring:message code="member.join.msg.choice"/></option>
							</select> --%>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="mypage.private.interest.msg7"/></th>
						<td>
							<span class="bbs_input_box">
								<input type="number" name="hopeSalary" id="hopeSalary" min="0" maxlength="20" />
								<label for="hopeSalary"></label>
							</span>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="resume.text.preferEmployTypeCd"/></th>
						<td>
						<c:forEach items="${workTimeList }" var="workTime" varStatus="status">
							<span class="bbs_input_box">
								<input type="checkbox" name="workTime" id="workTime_${status.index == 0 ? 'full' : 'part' }" value="${workTime.dtlCd }" />
								<label for="workTime_${status.index == 0 ? 'full' : 'part' }"><c:out value="${workTime.cdNm }"/></label>
							</span>
						</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="compny.vacancy.msg.title15"/></th>
						<td>
						<c:forEach items="${contractList }" var="contract" varStatus="status">
							<span class="bbs_input_box">
								<input type="checkbox" name="contract" id="contract_${status.index == 0 ? 'decId' : 'undecId' }" value="${contract.dtlCd }" />
								<label for="contract_${status.index == 0 ? 'decId' : 'undecId' }"><c:out value="${contract.cdNm }"/></label>
							</span>
						</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="mypage.compny.profile.title19"/></th>
						<td>
						<c:forEach items="${eduDegreeList }" var="education" varStatus="status">
							<span class="bbs_input_box">
								<input type="checkbox" name="education" id="education_${status.index + 1 }" value="${education.dtlCd }" />
								<label for="education_${status.index + 1 }"><c:out value="${education.cdNm }"/></label>
							</span>
						</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="resume.text.career"/></th>
						<td>
							<span class="bbs_input_box">
								<input type="radio" name="minWorkExp" id="minWorkExp_1" value="0" />
								<label for="minWorkExp_1">None</label>
							</span>
							<span class="bbs_input_box">
								<input type="radio" name="minWorkExp" id="minWorkExp_2" value="-1" />
								<label for="minWorkExp_2">~ 1 Year</label>
							</span>
							<span class="bbs_input_box">
								<input type="radio" name="minWorkExp" id="minWorkExp_3" value="-2" />
								<label for="minWorkExp_3">1~2 Years</label>
							</span>
							<span class="bbs_input_box">
								<input type="radio" name="minWorkExp" id="minWorkExp_4" value="-5" />
								<label for="minWorkExp_4">2~5 Years</label>
							</span>
							<span class="bbs_input_box">
								<input type="radio" name="minWorkExp" id="minWorkExp_5" value="+5" />
								<label for="minWorkExp_5">More than 5 Years</label>
							</span>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="compny.vacancy.msg.title46"/></th>
						<td>
						<c:forEach items="${privilegeList }" var="privilege" varStatus="status">
							<span class="bbs_input_box">
								<input type="checkbox" name="privilege" id="privilege_${status.index + 1 }" value="${privilege.dtlCd }" />
								<label for="privilege_${status.index + 1 }"><c:out value="${privilege.cdNm }"/></label>
							</span>
						</c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="col"><spring:message code="mypage.compny.profile.title23"/></th>
						<td>
						<c:forEach items="${languageList }" var="language" varStatus="status">
							<span class="bbs_input_box">
								<input type="checkbox" name="language" id="language_${status.index + 1 }" value="${language.dtlCd }" />
								<label for="language_${status.index + 1 }"><c:out value="${language.cdNm }"/></label>
							</span>
						</c:forEach>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

			<div class="bbs_btn_wrap clearfix">
				<div class="bbs_center">
					<input type="button" class="bbs_btn save" value="Ok" />
				</div>
			</div>
			<!-- //bbs_btn_wrap -->
		</fieldset>
</div>












                </div>
                <!-- //contents -->
            </article>
</main>