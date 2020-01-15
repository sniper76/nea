var	Login = {
	//----------------------------
	// InfoIndex 객체
	//----------------------------

	init: function() {
		this.beforeBind();
		this.bind();
		this.afterBind();
	},

	beforeBind: function() {
	},

	bind: function() {
		
	},

	afterBind: function() {
		
	},
	fn: {
		
		/** 게시물 데이터
		getLogin : function() {
				if ($("#mngId").val() == "") {
					alertify.alert("Please enter User Account", function (e){
							$("#mngId").focus();
					});
					
					return false;
				} 
				
				if ($("#password").val() == "") {
					alertify.alert("Please enter User Account", function (e){
							$("#password").focus();
					});
					
					return false;
				}
				
				document.frm.action=contextPath+"/authProcess.do";
				document.frm.method="post";
				document.frm.submit();
		},
		
		getLogin : function() {
			if ($("#mngId").val() == "") {
				alertify.alert("Please enter User Account", function (e){
						$("#mngId").focus();
				});
				
				return false;
			} 
			
			if ($("#password").val() == "") {
				alertify.alert("Please enter User Account", function (e){
						$("#password").focus();
				});
				
				return false;
			}
			
			$("#frm").ajaxForm({
				dataType : 'json',
				beforeSubmit : function(formData, $form, options) {
					for ( var i = 0; i < formData.length; i++) {
						if (!formData[i].value) {
							alertify.alert('Please enter a value for both ID and Password');
							return false;
						}
					}
				},
				success : function(json, statusText, xhr, $form) {
					if (json.success == true) {
						var url = json.returnUrl || './';
						document.location.href = url;
					} else {
						alertify.alert(json.message);
					}
				},
				error : function(xhr) {
					alert(xhr.statusText);
				}
			});
			
		},*/
		getSeachId : function() {
			
			$(".find_box").empty();
			
			if ($("#userNm").val() == "") {
				alertify.alert("Please enter User Name", function (e){
						$("#userNm").focus();
				});
				
				return false;
			} 
			
			if ($("#password").val() == "") {
				alertify.alert("Please enter User Email", function (e){
						$("#password").focus();
				});
				
				return false;
			}
			
			var param = $("#frm").serializeObject();
			
			console.log("=============param="+JSON.stringify(param))
			
			var	opts = {
					url		: contextPath + "/selectSearchIdAjax.do",
					data	: param,
					type	: "post",
					sendDataType	: "json",
					success	: function(resJSON, resCode) {
						// failed
						if(resJSON.data.resultCode != '0000') {
							alertify.alert(resJSON.data.msg);
						} else {
							var html = '';
								html +='	<div class="find_cont">';
								html +='		<p>Your ID is <strong>'+resJSON.data.mngId+'</strong></p>';
								html +='	</div>';
								html +='	<div class="find_put">';
								html +='		<a href="'+contextPath+'/authLogin.do">LOGIN</a>';
								html +='		<a href="'+contextPath+'/searchPwd.do">SEARCH PW</a>';
								html +='	</div>';
							$(".find_box").append(html);
						}
						
					},
					error : function() {
						
					}
				};
				common.http.ajax(opts);
		},
		
		getSeachPwd : function() {
			
			if ($("#mngId").val() == "") {
				alertify.alert("Please enter Manager ID", function (e){
						$("#mngId").focus();
				});
				
				return false;
			} 
			
			if ($("#userNm").val() == "") {
				alertify.alert("Please enter User Name", function (e){
						$("#userNm").focus();
				});
				
				return false;
			} 
			
			if ($("#userEmail").val() == "") {
				alertify.alert("Please enter User Email", function (e){
						$("#userEmail").focus();
				});
				
				return false;
			}
			
			var param = $("#frm").serializeObject();
			
			var	opts = {
					url		: contextPath + "/selectSearchPwdAjax.do",
					data	: param,
					type	: "post",
					sendDataType	: "json",
					success	: function(resJSON, resCode) {
						// failed
						if(resJSON.data.resultCode != '0000') {
							alertify.alert(resJSON.data.msg);
						} else {
							location.href=contextPath + "/updatePwd.do";
						}
					},
					error : function() {
						
					}
				};
				common.http.ajax(opts);
		},
		
		setAuthPwd : function() {
			if ($("#emailUserAuthValue").val() == "") {
				alertify.alert("Please enter Verification number", function (e){
						$("#emailUserAuthValue").focus();
				});
				
				return false;
			} 
			
			if ($("#userNewPwd").val() == "") {
				alertify.alert("Please enter New Password", function (e){
						$("#userNewPwd").focus();
				});
				
				return false;
			} 
			
			if ($("#confirm_new_password").val() == "") {
				alertify.alert("Please enter Confirm Password", function (e){
						$("#confirm_new_password").focus();
				});
				
				return false;
			}
			
			if($("#userNewPwd").val() != $("#confirm_new_password").val()) {
				alertify.alert("incorrect the confirm password", function (e){
						$("#confirm_new_password").focus();
				});
				return false;
			}
			
			var param = $("#frm").serializeObject();
			
			var	opts = {
					url		: contextPath + "/updateAuthPwdAjax.do",
					data	: param,
					type	: "post",
					sendDataType	: "json",
					success	: function(resJSON, resCode) {
						// failed
						if(resJSON.data.resultCode != '0000') {
							alertify.alert(resJSON.data.msg);
						} else {
							alertify.alert(resJSON.data.msg, function (e){
									location.href=contextPath + "/authLogin.do";
							});
						}
					},
					error : function() {
						
					}
				};
				common.http.ajax(opts);
		},
		
		setNewPwd : function() {
			if ($("#userPwd").val() == "") {
				alertify.alert("Please enter Current your password", function (e){
						$("#userPwd").focus();
				});
				
				return false;
			} 
			
			if ($("#userNewPwd").val() == "") {
				alertify.alert("Please enter New Password", function (e){
						$("#userNewPwd").focus();
				});
				
				return false;
			} 
			
			if ($("#confirm_new_password").val() == "") {
				alertify.alert("Please enter Confirm Password", function (e){
						$("#confirm_new_password").focus();
				});
				
				return false;
			}
			
			if($("#userNewPwd").val() != $("#confirm_new_password").val()) {
				alertify.alert("incorrect the confirm password", function (e){
						$("#confirm_new_password").focus();
				});
				return false;
			}
			
			var param = $("#frm").serializeObject();
			
			var	opts = {
					url		: contextPath + "/updateOverDuraPwdAjax.do",
					data	: param,
					type	: "post",
					sendDataType	: "json",
					success	: function(resJSON, resCode) {
						// failed
						if(resJSON.data.resultCode != '0000') {
							alertify.alert(resJSON.data.msg);
							return false;
						}
						alertify.alert(resJSON.data.msg, function (e){
								location.href=contextPath + "/internal/index.do";
						});
					},
					error : function() {
						
					}
				};
				common.http.ajax(opts);
		}
	}
}