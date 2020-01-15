// 탭메뉴 공통적으로 사용
function tabOn(tab,num,img){
	var $tab,$tab_btn;
	var tabid=tab,n=num-1,btn_img=img;

	$tab=$(tabid+'> ul > li');
	$tab_btn = $(tabid+'> ul > li > a');
	$tab_btn.siblings().hide();
	$tab.eq(n).addClass('active');
	$tab.eq(n).children('a').siblings().show();

	if(btn_img=='img'){
		var btn=$tab.eq(n).children('a').find("img");
		btn.attr("src",btn.attr("src").replace("_off","_on"));
	};

	$tab_btn.on("click",function(event){
		var realTarget=$(this).attr('href');

		if(realTarget!="#"){
			return
		};
		if(btn_img=='img'){
			for(var i=0;i<$tab.size();i++){
				var btn = $tab.eq(i).children('a').find("img");
				btn.attr("src",btn.attr("src").replace("_on","_off"));
			};
			var active = $(this).parent().attr('class');
			if(active!='active'){
				var btn_img_off=$(this).find('img')[0];
				btn_img_off.src= btn_img_off.src.replace('_off','_on');
			};
		};
		$tab_btn.siblings().hide();
		$tab_btn.parent().removeClass('active');
		$(this).siblings().show();
		$(this).parent().addClass('active');
		event.preventDefault();
	});
};
function tabOrg(tabid,a,img) {
	var $tab, $tab_btn,$obj,$obj_view;
	var tabid = tabid, num = a, btn_img = img;

	$tab = $(tabid+' .tab_item  > li');
	$tab_btn = $(tabid+' .tab_item > li > a');
	$obj = $(tabid+' .tab_obj');
	$obj_view = $(tabid+' .tab_obj.n'+num);
	$tab.eq(num-1).addClass('active');
	$obj_view.show();

	if(btn_img =='img'){
		var btn = $tab.eq(num-1).children('a').find("img");
		btn.attr("src",btn.attr("src").replace("_off","_on"));
	};
	$tab.bind("click",function(event){
		if(btn_img =='img'){
			for(var i=0;i<$tab.size();i++){
				var btn = $tab.eq(i).children('a').find("img");
				btn.attr("src",btn.attr("src").replace("_on","_off"));
			};
			var active = $(this).parent().attr('class');
			if(active != 'active'){
				var btn_img_off = $(this).find('img')[0];
				btn_img_off.src =  btn_img_off.src.replace('_off','_on');
			};
		};
		var this_eq = $tab.index( $(this) );
		$tab.removeClass('active');
		$tab.eq(this_eq).addClass('active');
		$obj.hide();
		$(tabid+' .tab_obj.n'+(this_eq+1)).show();
		event.preventDefault ();
	});
};

$(function (){
	function GetIEVersion(){
		var sAgent = window.navigator.userAgent;
		var Idx = sAgent.indexOf("MSIE");
		if(Idx>0){// If IE, return version number.
			return parseInt(sAgent.substring(Idx+5,sAgent.indexOf(".",Idx)));
		}else if (!!navigator.userAgent.match(/Trident\/7\./)){// If IE 11 then look for Updated user agent string.
			return 11;
		}else{
			return 0; //It is not IE
		};
	};
	var total=$('#gnb .depth1').length,
			dep2_h=new Array;
	for(i=0;i<total;i++){
		var j=i+1;				
		$('#gnb .depth1').eq(i).addClass('rule0'+j);
		dep2_h[i]=$('#gnb .depth1').eq(i).find('.depth2').height();
	};
	var depth2_max = Math.max.apply(null, dep2_h),
		head_height=55,
		dep2_height=depth2_max,
		gnb_h=depth2_max+head_height,
		d_width=$('body').width(),
		reHead='';
	
	if(d_width<=801){
		reHead=1;
	}/*else if(d_width>640&&d_width<=800){
		reHead=2;
	}*/else{
		reHead=0;
	};

	$(window).resize(function(){
		d_width=$('#gnb_box').width();
		if(GetIEVersion()>8||GetIEVersion()==0){
			if(d_width<=800){
				if(reHead!=1){
					$('#gnb_box').removeClass('web_move');
					$('.mask').removeClass('gnb_all').find('.wrap').css({'height':0});
					$('#gnb .depth2 > ul').css({'height':'auto'});
					reHead=1;
				}else{
					return false;
				};
			}/*else if(d_width>640&&d_width<=800){
				if(reHead!=2){
					
					reHead=2;
				}else{
					return false;
				};
			}*/else{
				if(reHead!=0){
					var dep2_h2=new Array;
					for(i=0;i<total;i++){
						var j=i+1;
						dep2_h2[i]=$('#gnb .depth1').eq(i).find('.depth2').height();
					};
					depth2_max = Math.max.apply(null, dep2_h2),
					dep2_height=depth2_max,
					gnb_h=depth2_max;
					$('#header').removeClass('m_on');
					$('#gnb_box').removeClass('m_gnb').find('.depth1').removeClass('active').find('.tit').removeClass('on').next('.depth2').removeClass('dep2_on').find('a').removeClass('on').next('.depth3').removeClass('dep3_on');
					reHead=0;
				}else{
					return false;
				};
			};
		};
	});

	$('#gnb .tit').on('mouseenter focusin',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){
			$('#gnb_box').addClass('gnb_on').find('.depth1').removeClass('active').find('a').removeClass('on');
			$(this).parents('.depth1').addClass('active');
		};
	});
	$('#gnb_box .gnb_other .gnb_sns li:last-child a').on('focusout',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){
			$('#gnb_box').removeClass('gnb_on').css({'height':head_height});
			$('#gnb_box').removeClass('m_gnb').find('.tit').removeClass('on').parents('.depth1').removeClass('active').find('a').removeClass('on');
		};
	});	
	$('#gnb .depth2').prev('.tit').on('click',function(event){
		var $target=$(event.target),
				d_width=$('#gnb_box').width();
		if(d_width>800){
			return true;
		}else{
			if($target.is('.on')){
				$('#gnb').removeClass('m_on').find('.tit').removeClass('on').next('.depth2').removeClass('dep2_on').find('a').removeClass('on').next('.depth3').removeClass('dep3_on');
			}else{
				$('#gnb').addClass('m_on').find('.tit').removeClass('on').next('.depth2').removeClass('dep2_on').find('a').removeClass('on').next('.depth3').removeClass('dep3_on');
				$(this).addClass('on').next('.depth2').addClass('dep2_on');
			}			
			return false;
		};
	});
	$('#gnb .depth3').prev('a').on('click',function(event){
		var $target=$(event.target),
				d_width=$('#gnb_box').width();
		if(d_width>800){
			return true;
		}else{
			if($target.is('.on')){
				
			}else{
				$(this).parents('li').siblings().find('>a').removeClass('on').next('div').removeClass('dep3_on');
				$(this).addClass('on').next('div').addClass('dep3_on');
			}			
			return false;
		};
	});
	$('#gnb_box').on('mouseleave',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){
			$('#gnb_box').removeClass('gnb_on');
			$('#gnb_box').removeClass('m_gnb').find('.tit').removeClass('on').parents('.depth1').removeClass('active').find('a').removeClass('on');
		}else{
			return false;
		};
	});
	$('#gnb .depth2').on('mouseenter',function(){
		$('.depth1').removeClass('active');
		$(this).parents('.depth1').addClass('active');
	});
	$('#gnb .depth3').on('mouseenter',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){
			$(this).prev('a').addClass('on');
		};
	});
	$('#gnb .depth3').on('mouseleave',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){
			$('.depth2 a').removeClass('on');
		};
	});
	$('.gnb_open').on('click',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){			
			var dep2_h2=new Array;
			for(i=0;i<total;i++){
				var j=i+1;
				dep2_h2[i]=$('#gnb .depth1').eq(i).find('.depth2').height();
			};
			depth2_max = Math.max.apply(null, dep2_h2),
			dep2_height=depth2_max,
			gnb_h=depth2_max;
			$('#gnb_box').addClass('gnb_all');
			$('.mask').addClass('gnb_all').find('.wrap').css({'height':gnb_h+55});
			$('#gnb .depth2 > ul').css({'height':gnb_h});
		}else{
			$('#header').addClass('m_on');
			$('#gnb_box').addClass('m_gnb').find('.tit').removeClass('on').next('.depth2').removeClass('dep2_on').find('a').removeClass('on').next('.depth3').removeClass('dep3_on');
		};
	});
	$('.gnb_close').on('click',function(){
		var d_width=$('#gnb_box').width();
		if(d_width>800){
			$('#gnb_box').removeClass('gnb_all');
			$('.mask').removeClass('gnb_all').find('.wrap').css({'height':0});
			$('#gnb .depth2 > ul').css({'height':'auto'});
		}else{
			$('#header').removeClass('m_on');
			$('#gnb_box').removeClass('m_gnb').find('.tit').removeClass('on').next('.depth2').removeClass('dep2_on').find('a').removeClass('on').next('.depth3').removeClass('dep3_on');
		};
	});

	//search
	$('.search_box .search_open').on('click',function(){
		$(this).parents('.search_box').addClass('active').parents('#header').find('.mask').addClass('search_mask');
	});
	$('.search_box .search_close').on('click',function(){
		$(this).parents('#header').find('.mask').removeClass('search_mask');
		$(this).parents('.search_box').removeClass('active').find('.search_open').focus();
	});
	
	//lnb
	$(window).scroll(function(event){
		var x=$(this).scrollTop(),
				Cont_width=$('body').width(),
				side_height='',
				header_confirm=$('div').hasClass('sub_visual'),
				header_confirm2=$('div').hasClass('visual'),
				header_move=$("#container").offset(),
				footer_move=$("#footer").offset(),
				header_class=$('#gnb_box').attr('class');
		if(header_confirm==true){
			if(Cont_width>1000&&(GetIEVersion()>8||GetIEVersion()==0)){
				if(x>header_move.top-60){
					side_height=$('#gnb_box').innerHeight()
					if(x>footer_move.top-side_height){
						$('#gnb_box').removeClass().addClass('web_end');
					}else{
						$('#gnb_box').removeClass().addClass('web_move');
					};					
				}else if(x<header_move.top-60){
					if(header_class=='web_move'){
						$('#gnb_box').removeClass('web_move');
					};
				};
			}else{			
				return false;
			};
		}else{
			header_class=$('#gnb_box').attr('class');
			if(Cont_width>800&&(GetIEVersion()>8||GetIEVersion()==0)){
				if(x>header_move.top-60){
					if(header_class!='web_move'){
						$('#gnb_box').removeClass().addClass('web_move');
					};
				}else if(x<header_move.top-60){
					if(header_class=='web_move'){
						$('#gnb_box').removeClass('web_move');
					};
				};
			}else{			
				return false;
			};
		
		};
	});

	// 푸터 바로가기
	$('.foot_shortcut button').on('click',function(event){
		var $target=$(event.target);
		if($target.is('.active button')){
			$(this).parents('.foot_shortcut').removeClass('active');
		}else{
			$(this).parents('.foot_shortcut').addClass('active');
		};
	});
	$('.foot_shortcut li:last-child a').focusout(function(){
		$(this).parents('.foot_shortcut').removeClass('active').find('button').focus();
	});

	//탭메뉴
	var tab_confirm=$('.tab_menu').hasClass('action');
	if(tab_confirm==true){
		$('.tab_menu.action li').removeClass('on');
		$('.tab_menu.action li').eq(0).addClass('on');
		$('.tab_contents').hide();
		$('.tab_contents').eq(0).show();
	};
	$('.tab_menu a').on('click', function(event){
		var $target=$(event.target),
			tab=$(this).parents('.tab_menu'),
			nums=$(this).parents('li').index();
		
		if($target.is('.on a')){
			return false;
		}else{
			tab.find('li').removeClass('on');
			$(this).parents('li').addClass('on');
			if($target.is('.action a')){
				if($target.is('.tab_contents a')){
					$('.tab_contents').find('li').removeClass('on');
					$('.tab_contents').find('li').eq(0).addClass('on');
				}else{
					$('.tab_contents').hide();
					$('.tab_contents').eq(nums).show();
					return false;
				};				
			}else{
				return true;
			};
		};
	});
	
	//language
	$('.language').on('click',function(event){
		var $target=$(event.target);
		if($target.is('.on')){
			$(this).removeClass('on').next('.language_box').removeClass('active');
		}else{
			$(this).addClass('on').next('.language_box').addClass('active');
		};
	});

	//모바일 전화걸기
	$('.mobile_phone').on('click',function(){
		var filter = "win16|win32|win64|macintel|mac|"; // PC일 경우 가능한 값
		if( navigator.platform){
			if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
				return true;
			}else{
				return false;
			};			
		};
	});

	//추천검색
	$('.popularity .open').on('click',function(){
		$('.popularity .contents_box,.popularity .close').addClass('on');
	});
	$('.popularity .close').on('click',function(){
		$('.popularity .contents_box,.popularity .close').removeClass('on');
	});
	$('.division_box .tit').on('click',function(event){
		var $target=$(event.target);
		
		if($target.is('.on')){
			$('.division_box .dep1').removeClass('open').find('.tit').removeClass('on').next('.dep2').slideUp(300);
		}else{
			$('.division_box .dep1').removeClass('open').find('.tit').removeClass('on').next('.dep2').slideUp(300);
			$(this).parents('.dep1').addClass('open').find('.tit').addClass('on').next('.dep2').slideDown(300);
		};	
		return false;
	});
	$('.division_box .dep1:last-child li:last-child a').on('focusout',function(){
		$('.division_box .dep1').removeClass('open').find('.tit').removeClass('on').next('.dep2').slideUp(300);
	});

	//job_center
	$('.job_center button').on('click', function(event){
		var $target=$(event.target);
		if($target.is('.active button')){
			$(this).parents('.job_center').removeClass('active').find('.cont_box').slideUp();
		}else{
			$(this).parents('.job_center').addClass('active').find('.cont_box').slideDown();
		};	
	});
});
