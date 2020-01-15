var	 FileUtil = {

	scriptVersion : "",
	fileConfig : [],

	/*
	FileUtil.fileConfig.push({
		attachGroupId : "",
		attachMultiGroupId : "",
		fileCheckNum : 1,
		fileCheckType : 3,  //1==isImage , 2==isVideo , 3==isDoc 4==AllFile
		width : "",
		height : "",
		thumnailFlag : "",
		imgView : "",
		bizName : "bsns",
		downButtonYn : "N",
		delButtonYn : "Y",		//삭제버튼 유무
		addButtonYn : "Y",		//첨부버튼 유무
		targetId : "thmnFileDiv"
	});
	*/


	//----------------------------
	// InfoFileUtil 객체
	//----------------------------
	init: function() {

/*		if (loginData == null) {
			loginData = {"mngId":"NO_SESSION"};
		} else {
			if (loginData.mngId == null || loginData.mngId == "" || loginData.mngId == undefined) {
				loginData.mngId = "NO_SESSION";
			}
		}*/



		this.before();
		this.bind();
		this.afterBind();
	},

	before: function() {

	},

	bind: function() {
		for(var i in FileUtil.fileConfig){
			if(FileUtil.fileConfig[i].imgView == "Y"){
				$("#"+FileUtil.fileConfig[i].targetId).css("width", FileUtil.fileConfig[i].width+"px");
				$("#"+FileUtil.fileConfig[i].targetId).css("height", FileUtil.fileConfig[i].height+"px");
			}

			if(FileUtil.fileConfig[i].addButtonYn != 'Y'){
				$("#"+FileUtil.fileConfig[i].targetId).css("background","#fafafa");
			}
		}
	},

	afterBind: function() {
		FileUtil.fn.detectIE();
		for(var i in FileUtil.fileConfig){
			FileUtil.fn.fileForm(FileUtil.fileConfig[i].targetId);
		}

		$(".dragAndDropDiv").on( {
			"dragenter" : function(e){
				//이벤트 발생 중지
				common.util.eventStop(e);
			},
			"dragover" : function(e){
				//이벤트 발생 중지
				common.util.eventStop(e);
			},
			"drop" : function(e){
				common.util.eventStop(e);

				var fileConfigInfo = FileUtil.fn.getfileConfigInfo(e.target.id);

				if(fileConfigInfo.addButtonYn == 'Y'){
					//파일 얻기
					if(fileConfigInfo.imgView == 'Y'){
						$("#"+fileConfigInfo.targetId).empty();
						FileUtil.fn.fileForm(targetId);
						var files = FileUtil.fn.fileGet(e);
						FileUtil.fn.setFileInput(files, "N", fileConfigInfo.targetId);
					}else{
						var files = FileUtil.fn.fileGet(e);
						FileUtil.fn.setFileInput(files, "N", fileConfigInfo.targetId);
					}
				}
			},
		});
	},

	// ----------------------------------
	// 처리 메서드가 정의된 객체
	// ----------------------------------
	fn: {

		getfileConfigInfo : function(targetId){
			for(var i in FileUtil.fileConfig){
				if(FileUtil.fileConfig[i].targetId == targetId){
					return FileUtil.fileConfig[i];
				}
			}
		},

		detectIE : function(){
			var agent = navigator.userAgent.toLowerCase();
			var rv = -1; // Return value assumes failure.
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			//alert("인터넷 익스플로러 브라우저 입니다.");
	         if (navigator.appName == 'Microsoft Internet Explorer') {
	              var ua = navigator.userAgent;
	              var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	              if (re.exec(ua) != null)
	                  rv = parseFloat(RegExp.$1);
             }
			}
			if(rv == '8' || rv == '9'){
				FileUtil.scriptVersion = rv;
			}else{
				FileUtil.scriptVersion = rv;
			}
		},

		//파일수
		getFileCnt : function(targetId){
			var count = 0;

			$("#"+targetId +" #fileList"+" :input[id=fileChk]").each(function(index) {
				if($(this).val() != 2){
					count++;
				}
			});

			return count;
		},

		//한 번에 업로드하는 파일 숫자ex)드래그
		fileNumCheck : function(files, num, targetId){

			var count = FileUtil.fn.getFileCnt(targetId);

			if(files.length > num || count+1 > num || count + files.length > num){
				$.alert("업로드 가능 파일 수는 " + num + "개 입니다.");
				return false;
			}
		},

		//파일 얻기
		fileGet : function(e){
			var files = e.originalEvent.dataTransfer.files;
			return files;
		},

		fileForm : function(targetId){
			var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);
			var input ='';
			input += '<form id="frm" method="post" enctype="multipart/form-data" action="/fileCommon/uploadHelper.do" >';
			input += '<input type="hidden" id="bizName" name="bizName" value="'+fileConfigInfo.bizName+'" />';
			if(fileConfigInfo.addButtonYn == "Y"){
				//첨부파일형태가 리스트와 이미지박스의 차이로 스타일 나뉨
				if(fileConfigInfo.imgView == "Y"){
					input += '<div id="divFake" style="position: absolute; width: 99px;height:30px; overflow:hidden; float:left; margin-bottom: 5px;">';
				}else{
					input += '<div id="divFake" style="position: relative; left:2px; width: 99px;height:30px; overflow:hidden; float:left; margin-bottom: 5px;">';
				}
				input += '<img src="'+contextPath+'/images/getFileButton.jpg" alt="찾아보기" id="getFileButton"/>';
				input += '<input id="attach_file" name="file" multiple type="file" style="font-size: 23px; position: absolute;right:0px;top:0px; opacity:0; filter: alpha(opacity=0);cursor: pointer;" onchange="FileUtil.fn.setFileInput02(this, \''+targetId+'\');"/>';
				input += '</div>';
			}
			input += '</form>';
			if(FileUtil.scriptVersion == '8' || FileUtil.scriptVersion == '9'){
				input +='<div id="fileList" class="fileList"></div>';
				$("#"+targetId).hide();
				$("#"+targetId).after(input);
			}else{
				input +='<div id="fileList" class="fileList"></div>';
				$("#"+targetId).append(input);
			}
		},

		fileFormReset : function(targetId){
			$("#"+targetId+" #divFake").empty();
			var input ='';
			input += '<img src="'+contextPath+'/images/getFileButton.jpg" alt="찾아보기" id="getFileButton"/>';
			input += '<input id="attach_file" multiple name="file" type="file" style="font-size: 23px; position: absolute;right:0px;top:0px; opacity:0; filter: alpha(opacity=0);cursor: pointer;" onchange="FileUtil.fn.setFileInput02(this, \''+targetId+'\');"/>';
			$("#"+targetId+" #divFake").html(input);
		},

		selectFiles:function(targetId){
			//ie8 ie9일 때만 파일 브라우져 활성
			if(FileUtil.scriptVersion == '8' || FileUtil.scriptVersion == '9'){
				$('#'+targetId+' #attach_file').trigger('click');
			}else{
				return false;
			}
		},

		setFileInput : function(files, num, targetId){

			var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);

			/**2이상으로 해서 테스트 */
			if(fileConfigInfo.fileCheckNum > 0){
				if(FileUtil.fn.fileNumCheck(files, fileConfigInfo.fileCheckNum, targetId) == false){
					return;
				};
			};
			//파일 확장자체크
			var getExtension = common.fileCheck.getExtension02(files);

			// 1==isImage , 2==isVideo , 3==isDoc 4==AllFile
			if(common.fileCheck.extensionCheck(fileConfigInfo.fileCheckType, getExtension) == false){
				$.alert("업로드 가능한 확장자가 아닙니다.");
				return false;
			};
			var fd = FileUtil.fn.sendFileToForm(files);
			var bizName="";
			if(num == "N"){
				bizName= fileConfigInfo.bizName;
			}else{
				bizName= $("#"+targetId+num).find("[name=bizName]").val();
			}
			var fileList = FileUtil.fn.sendFileToServer(fd, "/fileCommon/uploadHelper.do", bizName);
			FileUtil.fn.drawFileList(fileList, num, targetId);
		},

		setFileInput02 : function(files, targetId){

			var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);

			var filePath = files.value;
			var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
			var getExtension =  common.fileCheck.getExtension(fileName);

			/**2이상으로 해서 테스트 */
			if(fileConfigInfo.fileCheckNum > 0){
				if(FileUtil.fn.fileNumCheck(files.files, fileConfigInfo.fileCheckNum, targetId) == false){
					FileUtil.fn.fileFormReset(targetId);
					return false;
				};
			};

			// 1==isImage , 2==isVideo , 3==isDoc  , 4==AllFile
			if(common.fileCheck.extensionCheck(fileConfigInfo.fileCheckType, getExtension) == false){
				$.alert("업로드 가능한 확장자가 아닙니다.");
				FileUtil.fn.fileFormReset();
				return false;
			};

			$('#'+targetId+' #frm').ajaxSubmit({
				dataType : 'text',
				url : contextPath + "/fileCommon/uploadHelper.do",
				async : false,
				success: function(data) {
					FileUtil.fn.drawFileList02(data, targetId);
					return false;
			    },
			    error : function(XMLHttpRequest, textStatus, errorThrown){
			    },
			});
		},


		/** FormData 생성하여 추가
		 */
		sendFileToForm : function (files) {
        	 var fd = new FormData();
	            for (var i = 0; i < files.length; i++){
	                 fd.append('file', files[i]);
	            }
	            return fd;
         },

 		/**temp 폴더에 파일 업로드
		 FormData, 업로드 url, temp폴더이름
		 */
         sendFileToServer : function (fd, url, bizName) {
        	 fd.append("bizName", bizName);
        	 var data;
             $.ajax({
                 url: url,
                 type: "POST",
                 contentType:false,
                 processData: false,
                 data: fd,
                 async: false,
                 success: function(resJSON, resCode){
                	 data = resJSON;
                 }
             });
             return data;
         },

		//파일 리스트
		drawFileList : function(data, num, targetId) {

			var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);

			var bizName = "";
			if(num == "N"){
				bizName= FileUtil.bizName;
			}else{
				bizName= $("#"+targetId+num).find("[name=bizName]").val();
			}

			var html = "";
			var source = "/upload/"+bizName+"/";
			imgArray = new Array();
         	for(var i in data){
        		var saveNmArray =data[i].saveNm.split(".");
    			html+='<div id="tr'+saveNmArray[0] +'" style="display:block; " class="filelist">';

    			if(FileUtil.imgView == 'Y'){

    				// 이미지 미리보기 일단 없애기
    				//html += "<span class='title'style='line-height: 30px;'><img src='"+Domain+source+data[i].saveNm+"' /></span>";
    				html += "<span class='title'style='line-height: 30px;'>" +data[i].originalNm + "</span>";
    			}else{
    				html += "<span class='title'style='line-height: 30px;'>" +data[i].originalNm + "</span>";
    			}

				html +="<span class='fright' >";
				html += FileUtil.fn.byteConvertor(data[i].fileSize);
				if(fileConfigInfo.delButtonYn == 'Y'){
					html +="<button type='button' onClick=\"FileUtil.fn.setFileDelete('"+saveNmArray[0]+"', '"+data[i].saveNm+"', '"+targetId+"')\" >삭제</button>";
				}
				html +="</span>";
    			html += '<input type="hidden" id="fileChk" value="0" >';
				html +='<input type="hidden" id="originalNm"  value="'+data[i].originalNm+'" />';
				html +='<input type="hidden" id="saveNm"  value="'+data[i].saveNm+'" />';
				html +='<input type="hidden" id="fileSize"  value="'+data[i].fileSize+'" />';
				html +='<input type="hidden" id="fileExt"  value="'+data[i].fileExtension+'" />';
				html +='<input type="hidden" id="attachId"  value="0" />';
				html +='</div>';
        	}
         	if(num == "N"){
         		$("#"+targetId+" #fileList").append(html);
         	}else{
         		$("#"+targetId+" #fileList"+num).append(html);
         	}
         	//이미지 미리보기
         	if(FileUtil.imgView == 'Y'){
	         	for(var i in imgArray){
	         		$("#"+targetId+" #imgPreviewDiv").append("<img src='"+  source+ data[i].saveNm+"' id='imgPreview' style='' >");
	         	}
         	}
         	FileUtil.fn.fileFormReset();
		},

		drawFileList02 : function(data, targetId) {

			var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);

			var html = "";
			data = $.parseJSON(data);
         	for(var i =0;  i<data.length; i++){
        		var saveNmArray =data[i].saveNm.split(".");
    			html+="<div id='tr"+saveNmArray[0] +"' style='display:block; width:100%; ' class='filelist'  >";

    			if(FileUtil.imgView == 'Y'){
    				//html += "<span class='title'style='line-height: 30px;'><img src='"+Domain+"/upload/"+data[i].saveFilePath+"/"+data[i].saveNm+"' /></span>";
    				html += "<span class='title'style='line-height: 30px;'>" +data[i].originalNm + "</span>";
    			}else{
    				html += "<span class='title'style='line-height: 30px;'>" +data[i].originalNm + "</span>";
    			}

				html +="<span class='fright' >";
				html += "<span>"+FileUtil.fn.byteConvertor(data[i].fileSize) + "</span>";
				if(fileConfigInfo.delButtonYn == 'Y'){
					html +="<button type='button' onClick=\"FileUtil.fn.setFileDelete('"+saveNmArray[0]+"', '"+data[i].saveNm+"', '"+targetId+"')\" >삭제</button>";
				}
				html +="</span>";
    			html += '<input type="hidden" id="fileChk" value="0" >';
				html +='<input type="hidden" id="originalNm"  value="'+data[i].originalNm+'" />';
				html +='<input type="hidden" id="saveNm"  value="'+data[i].saveNm+'" />';
				html +='<input type="hidden" id="fileSize"  value="'+data[i].fileSize+'" />';
				html +='<input type="hidden" id="fileExt"  value="'+data[i].fileExtension+'" />';
				html +='<input type="hidden" id="attachId"  value="0" />';

				html +='</div>';
        	}
         	FileUtil.fn.fileFormReset();
         	$("#"+targetId+" #fileList").append(html);
		},

		setFileUpload : function(){

			for(var y in FileUtil.fileConfig){
				var fileConfigInfo = FileUtil.fileConfig[y];

				var fileChk = "";
				var files ="";
				var filesName = "";

				fileArray      = new Array();
				fileNames      = new Array();
				filesExtension = new Array();
				fileSizes      = new Array();
				fileChks       = new Array();
				attachIds      = new Array();

				for(var i=0;i<	$("#"+fileConfigInfo.targetId+" #fileList > div").length ;i++){
					fileChk = $("#"+fileConfigInfo.targetId+" #fileList > div").eq(i).find("input[id='fileChk']").val();
					if(fileChk == '1'){
						continue;
					}
					files= $("#"+fileConfigInfo.targetId+" #fileList").find(':input[id=saveNm]').eq(i).val();
					filesName  = $("#"+fileConfigInfo.targetId+" #fileList > div").eq(i).find("input[id='originalNm']").val();
					fileSize   = $("#"+fileConfigInfo.targetId+" #fileList > div").eq(i).find("input[id='fileSize']").val();
					fileExt    = $("#"+fileConfigInfo.targetId+" #fileList > div").eq(i).find("input[id='fileExt']").val();
					fileChk    = $("#"+fileConfigInfo.targetId+" #fileList > div").eq(i).find("input[id='fileChk']").val();
					attachId   = $("#"+fileConfigInfo.targetId+" #fileList > div").eq(i).find("input[id='attachId']").val();
					fileArray.push(files);
					fileNames.push(filesName);
					fileSizes.push(fileSize);
					filesExtension.push(fileExt);
					fileChks.push(fileChk);
					attachIds.push(attachId);
				}

				if( (fileArray == '' || fileArray == undefined ) && ($("#"+fileConfigInfo.targetId+" #fileList > div").length == 0 )){
					//파일이 하나도 없을때 초기화시킴
					fileConfigInfo.attachGroupId = 0;
				};

				if(fileConfigInfo.attachGroupId == ''  || fileConfigInfo.attachGroupId == '-1' ){
					fileConfigInfo.attachGroupId = 0;
				}else{
				}

				if( fileArray.length > 0 ){
					var param = {
							"attachGroupId"  : fileConfigInfo.attachGroupId,
							"files"          : fileArray,
							"fileNames"      : fileNames,
							"fileSizes"      : fileSizes,
							"filesExtension" : filesExtension,
							"fileChks"       : fileChks,
							"attachIds"      : attachIds,
							"bizName"        : fileConfigInfo.bizName,
							//"regiId"         : loginData.mngId,
							"imgView"        : fileConfigInfo.imgView,
					};

					var	opts = {
							url		: contextPath + "/fileCommon/setFileSave.do",
							data	: param,
							type	: "post",
							sendDataType	: "json",
							async : false,
							success	: function(resJSON, resCode) {

								var fileArray = resJSON.data.files;
								var attachIds = resJSON.data.attachIds;

								for(var i in fileArray ){
									var saveNmArray = fileArray[i].split(".");

									$("#tr"+saveNmArray[0]+" > #fileChk").val("1");
									$("#tr"+saveNmArray[0]+" > #attachId").val(attachIds[i]);

								}
								fileConfigInfo.attachGroupId = resJSON.data.attachGroupId;
								$("#"+fileConfigInfo.targetId+" #attachGroupId").val(resJSON.data.attachGroupId);

							}
					};
					common.http.ajax(opts);
				}
			}
		},

		getFileList : function(attachGroupId, targetId){

			var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);

			if(attachGroupId != '' || attachGroupId != undefined && attachGroupId > 0 ){
				fileConfigInfo.attachGroupId = attachGroupId;

				fileArray = new Array();
				fileNames = new Array();
				var param = {
					"attachGroupId" : attachGroupId,
					//이미지 리사이징 시, 가로 사이즈 고정 값
				};
				var	opts = {
					url		: contextPath + "/fileCommon/getFileList.do",
					data	: param,
					type	: "post",
					sendDataType	: "json",
					success	: function(resJSON, resCode) {
						var data = resJSON.data.list;
						var html = '';

						for(i in data){
			        		$("#"+fileConfigInfo.targetId+" #attachGroupId").val(data[i].attachGroupId);
							fileArray.push(data[i].saveNm);
							fileNames.push(data[i].originalNm);
			        		//데이터 .jpg 등 확장자가 있으면 찾지를 못함
			        		var saveNmArray =data[i].saveNm.split(".");
		        			html+="<div id=tr"+saveNmArray[0] +" style='display:block; ' class='filelist'>";
		        			html += "<input type='hidden' id='fileChk' value='1' >";
							html +="<input type='hidden' id='originalNm'  value='"+data[i].originalNm+"' />";
							html +="<input type='hidden' id='saveNm'  value='"+data[i].saveNm+"' />";
							html +="<input type='hidden' id='attachId'  value='"+data[i].attachId+"' />";
							if( fileConfigInfo.imgView != 'Y' ){
							    html += "<a href='javascript:FileUtil.fn.download("+data[i].attachId+");' ><span >"+data[i].originalNm+"</span></a>";
							}else{
								html += "<span class='title'><img src='"+Domain+data[i].saveFilePath+data[i].saveNm+"' width="+FileUtil.width+"px height="+FileUtil.height+"px/></span>";
							}
							html +="<span class='fright' >";
							html +=FileUtil.fn.byteConvertor(data[i].fileSize);
							if( fileConfigInfo.delButtonYn == 'Y'){
								html +="<button type='button' onClick=\"FileUtil.fn.setFileDelete('"+saveNmArray[0]+"', '"+data[i].saveNm+"', '"+fileConfigInfo.targetId+"')\"  > 삭제</button>";
							}
							html +="</span>";
							html +="</div>";
						}
						if(data.length <= 0){
							fileConfigInfo.attachGroupId = 0;
						}
						$("#"+fileConfigInfo.targetId+" #fileList").html(html);
					}
				};
				common.http.ajax(opts);

			}
		},

		/** 데이터만 불러오기 */
		getFileListData : function(attachGroupId){
			FileUtil.attachGroupId = attachGroupId;
			var data = "";

			var param = {
				"attachGroupId" : FileUtil.attachGroupId,
				//이미지 리사이징 시, 가로 사이즈 고정 값
			};
			var	opts = {
				url		: contextPath + "/fileCommon/getFileList.do",
				data	: param,
				type	: "post",
				sendDataType	: "json",
				async	 : false,
				success	: function(resJSON, resCode) {
					data = resJSON.data.list;
				}
			};
			common.http.ajax(opts);
			if(data.length > 0){
				return data;
			}else{
				return 0;
			}
		},

		//파일리스트폼 리셋
		setFileFormReset : function(targetId){
			var fileCnt = $("#"+targetId+" #fileList > div").length;
			for(i = 1; i <= fileCnt; i++){
				files= $("#"+targetId+" #fileList").find('input[id=saveNm]').eq(fileCnt-i).val();
				fileExt    = $("#"+targetId+" #fileList > div").eq(fileCnt-i).find('input[id=fileExt]').val();
				FileUtil.fn.setFileDelete(common.string.replace(files, "."+fileExt, ''), files, targetId);
			}
		},

		//파일삭제
		setFileDelete : function(trNm, saveNm, targetId){

			var fileChk = $("#tr"+trNm+" > #fileChk").val();

			if(fileChk == 0){
				var fileConfigInfo = FileUtil.fn.getfileConfigInfo(targetId);

				var param = {
						"saveNm"			: saveNm,
						"bizName"           : fileConfigInfo.bizName,
				};

				var	opts = {
						url		: contextPath + "/fileCommon/setTempFileDelete.do",
						data	: param,
						type	: "post",
						async : false,
						sendDataType	: "json",
						success	: function(resJSON, resCode) {
							if ("success" == resCode) {
								if(resJSON.responseCode == "0"){
									//idx 리턴해서 미리보기
									$("#tr"+trNm).remove();
								}else{
									$.alert("오류가 발생하였습니다. \n" + resObj.responseText);
								}
							}
						}
				};
				common.http.ajax(opts);
			}else{
				$("#tr"+trNm+" > #fileChk").val("2");
				$("#tr"+trNm).hide();
			}

		},

		//첨부파일 전체 보기 모드
		setFileViewModeAll : function(){
			$(".filebox").css("background","#fafafa");
			$(".filebox #divFake").remove();
			$(".filebox :button").remove();
			for(var i in FileUtil.fileConfig){
				FileUtil.fileConfig[i].delButtonYn = 'N';
				FileUtil.fileConfig[i].addButtonYn = 'N';
			}
		},

		//특정 첨부파일 보기 모드
		setFileViewMode : function(targetId){
			$("#"+targetId).css("background","#fafafa");
			$("#"+targetId+" #divFake").remove();
			$("#"+targetId+".filebox :button").remove();
			for(var i in FileUtil.fileConfig){
				if(FileUtil.fileConfig[i].targetId == targetId){
					FileUtil.fileConfig[i].delButtonYn = 'N';
					FileUtil.fileConfig[i].addButtonYn = 'N';
					continue;
				}
			}
		},

		download :  function(attachId){
			var param = {
					"attachId" : attachId,

				};
			var	opts = {
				url		: contextPath + "/fileCommon/getDownload.do",
				data	: param,
				type	: "post",
				sendDataType	: "json",
			};
			common.http.sendFormData(opts);
		},

	   byteConvertor : function(bytes) {
		 var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
		 var e = Math.floor(Math.log(bytes)/Math.log(1024));
		 if(e >= s.length) e = s.length - 1;//s의 마지막 단위로 표시할 수 없이 크다면, 마지막 단위로 처리
		 if(e == "-Infinity") return "0 " + s[0];
		 else return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];
		}
	}
};
