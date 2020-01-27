jQuery(function(){
	//snb
	$('.side_menu button').on('click',function(event){
		return false;
		/* var $target=$(event.target);
		if($target.is('.on')){
			$(this).removeClass('on').parents('.side_box').find('.side_cont').slideUp(300);
		}else{
			$(this).addClass('on').parents('.side_box').find('.side_cont').slideDown(300);
		}; */
	});
	$('.side_cont li:last-child a').on('focusout',function(event){
		$(this).parents('.side_cont').slideUp(300).siblings('button').removeClass('on');
	});
	//snb2
	$('#side2 a').parents('ul').prev('a').addClass('child_dep');
	$('#side2 .side_menu .dep3').prev('a').on('click',function(event){
		var $target=$(event.target);
		if($target.is('.on')){
			$('.side_menu .dep1 > li > a').removeClass('on').next('ul').removeClass('dep2_on').find('a').removeClass('on').next('ul').removeClass('dep3_on');
		}else{
			$('.side_menu .dep1 > li > a').removeClass('on').next('ul').removeClass('dep2_on').find('a').removeClass('on').next('ul').removeClass('dep3_on');
			$(this).addClass('on').next('ul').addClass('dep3_on')
		};
		return false;
	});
	$('#side2 .side_menu .dep2').prev('a').on('click',function(event){
		var $target=$(event.target);
		if($target.is('.on')){
			$('.side_menu .dep1 > li > a').removeClass('on').next('ul').removeClass('dep2_on').find('a').removeClass('on').next('ul').removeClass('dep3_on');
		}else{
			$('.side_menu .dep1 > li > a').removeClass('on').next('ul').removeClass('dep2_on').find('a').removeClass('on').next('ul').removeClass('dep3_on');
			$(this).addClass('on').next('ul').addClass('dep2_on')
		};
		return false;
	});
});
function side_menu(fir,sec,thi){
	if(typeof(thi)=='undefined'){
		$('.side_menu > ul > li:nth-child('+fir+') > a').addClass('on2').next('ul').addClass('current').find('> li:nth-child('+sec+') > a').addClass('on2');
	}else if(typeof(sec)=='undefined'){
		$('.side_menu > ul > li:nth-child('+fir+') > a').addClass('on2');
	}else{
		$('.side_menu > ul > li:nth-child('+fir+') > a').addClass('on2').next('ul').addClass('current').find('> li:nth-child('+sec+') > a').addClass('on2').next('ul').addClass('current').find('li:nth-child('+sec+') a').addClass('on2');
	};
};

jQuery(function(){
	$('.sub_other .share_open').on('click',function(){
		$('.sub_other .share_box').addClass('active');
	});
	$('.sub_other .share_close').on('click',function(){
		$('.sub_other .share_box').removeClass('active').prev('button').focus();
	});
});

jQuery(function(){
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

	//탭메뉴2
	var tab_confirms=$('div').hasClass('other_tab'),
		other_tab='',
		other_button='';

	if(tab_confirms==true){
		other_tab=$('.other_tab');
		other_button=other_tab.find('.button_area button');
		other_tab.find('.button_area button').removeClass('on');
		other_tab.find('.button_area button').eq(0).addClass('on');
		other_tab.find('.other_contents').hide();
		other_tab.find('.other_contents').eq(0).show();
	};
	$('.other_tab .button_area button').on('click', function(event){
		var $target=$(event.target),
			tab=$(this).parents('.other_tab'),
			nums=$(this).index();

		if($target.is('.on')){
			return false;
		}else{
			other_tab.find('.button_area button').removeClass('on');
			$(this).addClass('on');
			other_tab.find('.other_contents').hide();
			other_tab.find('.other_contents').eq(nums).show();
			return false;
		};
	});

	//reply_more
	$('.reply_more .btn_more').on('click', function(event){
		var $target=$(event.target);
		$(this).parent().next('.reply_depth2').addClass('active');
	});


});

/*  게시판 */
function addCellHeader(table,length){
    if(!table) {
        return false;
    };
	//console.log(length);

    //var table=$(table).eq(length);
    var table=$('.react_table').eq(length),
		trs=table.find('tr'),
		trsChild,
		grid={},
		cells,
		cellHeader='',
		confirm=table.find('thead').length;
if(confirm==1){
    for(i=0,cntI=trs.length;i<cntI;i++){
        if(!grid[i]){
            grid[i]={};
        };
        trsChild=trs.eq(i).children();
        cells=0;
        for(j=0,cntJ=trsChild.length;j<cntJ;j++){
            if(trsChild[j].nodeType==1){
                grid[i][cells++]=trsChild[j];
            };
        };
    };
    for(row in grid) {
        if(row==0){
            continue;
        };
        for(cell in grid[row]){
            /*if(cell==0){
                continue;
            };*/
            cellHeader=grid[0][cell].innerHTML+'：';
            grid[row][cell].setAttribute('data-cell-header',cellHeader);
        };
    };
};
};

$(function (){
    var bbsTableRwdb=$('[data-rwdb="yes"]');
	bbsTableRwdb.addClass('react_table')
    if(bbsTableRwdb.length > 0){
        var thisTable=bbsTableRwdb.attr('class').replace(/ /g, '.');
		if(navigator.appVersion.indexOf('MSIE 7.')==-1 && navigator.appVersion.indexOf('MSIE 8.')==-1){
			for(t=0;t<bbsTableRwdb.length;t++){
				addCellHeader('.'+thisTable,t);
			};
		};
    };
});

/* faq */
function faqList(list){
	var faqList=$(list).find('.list > li'),
		faqBtn_open=faqList.find('.bbs_question'),
		faqBtn_close=faqList.find('.close');

	faqBtn_open.on('click',function(){
		var item=$(this).parent('li');

		if(item.hasClass('active')) {
			item.removeClass('active');
			$(this).siblings('div').slideUp();
		}else{
			faqList.not(item).each(function() {
				$(this).removeClass('active');
				$(this).find('.bbs_answer_area').slideUp();
			});
			item.addClass('active');
			$(this).siblings('div').slideDown();
		};
	});
	faqBtn_close.on('click',function(){
		faqList.removeClass('active');
		faqList.find('.bbs_answer_area').slideUp();
	});
};

$(function (){
    var faq=$('[data-list="faq"]');

    if(faq.length>0){
        var list=faq.attr('class').replace(/ /g, '.');
        $(window).on({
            load:function(){
                faqList('.'+list)
            }
        });
    };
});


$(function (){
	//login_tab
	$('.login_tab a').on('click', function(event){
		var $target=$(event.target);

		if($target.is('.on a')){
			return false;
		}else{
			$('.login_tab').find('li').removeClass('on');
			$(this).parents('li').addClass('on');
		};
	});

	//profile_title
	$('.profile_title input:text').on('focusin', function(){
		$(this).parents('.profile_title').addClass('active on');
	});
	$('.profile_title input:text').on('focusout', function(){
		var $val=$(this).val();
		if($val==''){
			$(this).parents('.profile_title').removeClass('active on');
		}else{
			$(this).parents('.profile_title').removeClass('on');
		};
	});

	//form_title
	$('.form_title button').on('click', function(event){
		var $target=$(event.target),
			$form_wrap=$(this).parents('.form_wrap');

		if($target.is('.active button')){
			$form_wrap.removeClass('active');
		}else{
			$form_wrap.addClass('active');
		};
	});
	$('.form_close').on('click', function(){
		$(this).parents('.form_contents').remove();
	});

	//form_element
	var $form=$('.form_element');

	//text
	$form.find('input:text').on('focusin', function(event){
		var $target=$(event.target);

		if($target.is('.keyword input:text')){

		}else{
			$('.form_element').removeClass('on');
			$(this).parents('.form_element').addClass('active on');
		};
	});
	$form.find('input:text').on('focusout', function(event){
		var $target=$(event.target),
			$val=$(this).val();

		if($target.is('.keyword input:text')){

		}else{
			if($val==''){
				$(this).parents('.form_element').removeClass('active on');
			}else{
				$(this).parents('.form_element').removeClass('on');
			};
		};
	});

	//keyword
	$form.find('.input_key').on('keydown', function(event){
		var $target=$(event.target),
			$target_text=$target.val(),
			$text=$target_text.charAt(0);

		if((event.keyCode)&&(event.keyCode==13)){
			if($text=='#'){
				//$(this).parents('.form_element').addClass('active').find('.text_box').append('<span>'+$target_text+'<button type="button">delete</button></span>');
			}else{
				alert('Add "#" mark in front of the keyword.')
			};
			//$target.val('');
			return false;
		};
	});

	//sleelct radio
	$form.find('.open').on('click', function(){
		$('.form_element').removeClass('on');
		$(this).parents('.form_element').addClass('on');
	});
	$form.find('.select_box button,.select_box input:radio').on('click', function(event){
		var $target=$(event.target),
			$text='';
			$child='';
			$cd='';
		if($target.is('input:radio')){
			$text=$(this).siblings('label').text().toLowerCase(),
			$child=$(this).attr('class');

			if($child=='have'){
				$(this).parents('.form_element').next('.child_form').addClass('show').find('.form_element').removeClass('active');
			}else if($child=='no_have'){
				$(this).parents('.form_element').next('.child_form').removeClass('show active').find('.text_box').text('');
				$(this).parents('.form_element').next('.child_form').find('.check_box input:checkbox').prop('checked', false);
			};
		}else{
			$text=$(this).find('span').text();
			$cd=$(this).val();
		};
		if($target.is('.ohter')){
			$(this).parents('.form_element').siblings('.other_child').addClass('show');
		}else{
			$(this).parents('.form_element').siblings('.other_child').removeClass('show');
		};
		$(this).parents('.form_element').removeClass('on').addClass('active').find('.text_box span').text($text);
		$(this).parents('.form_element').removeClass('on').addClass('active').find('.text_box input').val($cd);
	});
	$form.find('.popup_box .button_box button,.popup_box .close').on('click', function(){
		$(this).parents('.form_element').removeClass('on');
	});

	//checkbox
	$form.find('.check_box input:checkbox').on('click', function(event){
		$('.form_element').removeClass('on');
		var $target=$(event.target),
			$number=$target.parents('li').index(),
			$text=$(this).parents('span').find('label').text();

		if($target.is(':checked')==false){
			var $checking=$(this).parents('.check_box').find('input:checkbox:checked').length;

			$(this).parents('.form_element').find('.text_box span').remove('.'+$number+'');
			if($checking==0){
				$(this).parents('.form_element').removeClass('active')
			};
		}else{
			$(this).parents('.form_element').addClass('active').find('.text_box').append('<span class="'+$number+'">'+$text+'</span>');
		};
	});

	//pick
	$form.find('.text_box').on('click', 'button', function(){
		$number=$(this).parents('.text_box').find('span').length;

		if($number==1){
			$(this).parents('.form_element').removeClass('active');
		};
		$(this).parent('span').remove();
	});

	//child_open
	$form.find('.child_open').on('click', function(event){
		var $target=$(event.target);

		$('.form_element').removeClass('on');
		if($target.is('.show .child_open')){
			$(this).parents('.form_element').removeClass('show');
		}else{
			$(this).parents('.form_element').addClass('show');
		};
	});

	//add_program
	$('.add_program .del').on('click', function(){
		$(this).parents('.contents_box').parent().remove();
	});

	//add_box
	$('.bbs_add_box .del').on('click', function(){
		$(this).parents('.bbs_add_box').remove();
	});

	//advanced_search
	$('.advanced_search').on('click', function(event){
		var $target=$(event.target);
		var d_width=$('#container').innerWidth();
		if(d_width<640){
			if($target.is('.on')){
				$(this).removeClass('on').parents('.srch_area').next('.detail_area').removeClass('active');
			}else{
				$(this).addClass('on').parents('.srch_area').next('.detail_area').addClass('active');
			};
		}else{
			if($target.is('.on')){
				$(this).removeClass('on').parents('.srch_area').next('.detail_area').removeClass('active').slideUp(200);
			}else{
				$(this).addClass('on').parents('.srch_area').next('.detail_area').addClass('active').slideDown();
			};
		};
	});
	$('.detail_close').on('click', function(event){
		$('.advanced_search').removeClass('on').parents('.srch_area').next('.detail_area').removeClass('active').parents('#container').removeClass('active_srch');
	});

	//company_list
	var $shortcut_box = $('.company_list'),
		$shortcut = $shortcut_box.find('.slide_box'),
		slideCount = null,
		currentSlide = null,
		nextCount = null,
		shortcutLength = $shortcut.find('.slide_item').length;

	$shortcut.on('init', function(event, slick){
		var show_num = slick.slickGetOption('slidesToShow');
			slideCount = Math.ceil(slick.slideCount/show_num);
			currentSlide = Math.ceil((slick.currentSlide+1)/show_num);

		setSlideCount(slideCount);
		setCurrentSlideNumber(currentSlide);
	});
	$shortcut.on('beforeChange', function(event, slick, currentSlide, nextSlide){
		 var show_num = slick.slickGetOption('slidesToShow');
			slideCount = Math.ceil(slick.slideCount/show_num);
			nextCount = Math.ceil((nextSlide+1)/show_num);

		setSlideCount(slideCount);
		setCurrentSlideNumber(nextCount);
	});
	function setSlideCount(el) {
		var slideCount=el;
		var $el = $('.count_box').find('.total');

		$el.text(slideCount);
	};

	function setCurrentSlideNumber(currentSlide) {
		var box_width=$('#footer .wrap').innerWidth();
		var $el = $('.count_box').find('.current');

		$el.text(currentSlide);
	};

	$('.company_list .slide_box').slick({
		dots: false,
		infinite: false,
		speed: 300,
		slidesToShow: 4,
		slidesToScroll: 4,
		draggable : false,

		responsive: [
			{
				breakpoint: 1200,
				settings: {
					slidesToShow: 4,
					slidesToScroll: 4
				}

			},
			{
				breakpoint: 1000,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3
				}
			},
			{
				breakpoint: 800,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 2,
					draggable : true
				}
			},
			{
				breakpoint: 500,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1
				}
			}
		]
	});

	//dictionary_depth1
	$('.dictionary_depth1 button').on('click', function(event){
		$('.dictionary_child').addClass('active');
	});

	//search_matching
	$('.search_matching .open').on('click', function(event){
		var $target=$(event.target);

		if($target.is('.on,.on span,.on strong')){
			$(this).removeClass('on').next('.child_box').slideUp('fast');
		}else if($target.is('input')){
			$(this).removeClass('on').next('.child_box').slideUp('fast');
		}else{
			$(this).addClass('on').next('.child_box').slideDown('fast');
		};
	});
	$('.search_matching input:radio').on('click', function(event){
		var $target=$(event.target);
		
		if($target.is('.child_box input:radio')){
			var $this=$(this).parents('li'),
				$this_contents=$this.find('.contents_wrap'),
				$this_clone=$this_contents.clone(true),
				$target=$('.search_matching .open'),
				$target_contents=$target.find('.contents_wrap'),
				$target_clone=$target_contents.clone(true);
	
			$target_contents.remove();
			$this_contents.remove();
			$target.append($this_clone);
			$this.append($target_clone);
			$('.search_matching .open').removeClass('on').next('.child_box').slideUp('fast');
		}else{
			return false;			
		};
	});
});