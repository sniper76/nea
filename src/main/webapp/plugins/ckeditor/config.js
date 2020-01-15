/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';  
  config.docType = '<!DOCTYPE html>';
  config.font_defaultLabel = 'Dotum';
  //config.font_names = '굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;Trebuchet MS/Trebuchet MS;Verdana/Verdana';
  
  config.width='100%';
  config.height='550';
  
  //config.font_names = '돋움/Dotum;';
  config.font_names = 'NanumGothic;Gulim;Dotum;Batang;Gungsuh;Malgun Gothic;Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;Trebuchet MS/Trebuchet MS;Verdana/Verdana';
  
  
  config.fontSize_defaultLabel = '12px';
  config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;76/76px;';
  //config.language = "vi"; //베트남어
  config.language = "en"; //영문
  config.entities_latin = false;
  config.resize_enabled = true;

  config.startupFocus = false;
  config.toolbarCanCollapse = false;
  config.menu_subMenuDelay = 0;
  
 // config.skin = 'office2003';       //에디터 스킨 (kama, office2003, v2)
 // config.uiColor = '#9ab8f3';    //에디터 전체 색상 (#RGB)
 // config.enterMode = CKEDITOR.ENTER_BR;
 // config.shiftEnterMode = CKEDITOR.ENTER_P;
  config.enterMode = '2';    //엔터키 태그 1:<p>, 2:<br>, 3:<div>
  config.shiftEnterMode = '1';    //쉬프트+엔터키 태그 1:<p>, 2:<br>, 3:<div>
  //config.contentsCss = '/ncmik_is/ckeditor/contents.css';

  config.ForcePasteAsPlainText = false ;//붙여넣기 세팅 
  config.AutoDetectPasteFromWord = false ; // IE only. 워드편집 붙이기 막는다..



  
 // config.filebrowserBrowseUrl = '/board/ckfinder/ckfinder.html',
 // config.filebrowserImageBrowseUrl = '/board/ckfinder/ckfinder.html?type=Images',
 // config.filebrowserFlashBrowseUrl = '/board/ckfinder/ckfinder.html?type=Flash',
 // config.filebrowserUploadUrl = '/board/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
  //config.filebrowserFlashUploadUrl = '/ncmik_is/ckeditor/upload_dbx.jsp';
  config.filebrowserImageUploadUrl = '/cmmn/editorUpload.do';

  //config.ImageUploadadvancedTab= false ;
  //config.removeContents('advanced');  
  config.ImageUploadadvancedTab= 1 ;
  config.toolbar = 'MyToolbar';
  config.allowedContent = false; //내부css사용여부

  config.toolbar_MyToolbar =
  [
	     ['Source','-','NewPage','Preview'],  //,'-','Templates'
		 ['Cut','Copy','Paste','PasteText','-','Print'],  //,'PasteFromWord','SpellChecker',
	     ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	     ['Link','Unlink','Anchor'],
	     ['NumberedList','BulletedList','-','Outdent','Indent'], //,'CreateDiv','Blockquote'
	  // ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
	  // ['BidiLtr', 'BidiRtl'],
	     '/',
	     ['Styles','Font','FontSize'],  //'Styles','Format',
	     ['TextColor','BGColor'],
	     ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],  //
	     ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	     ['Image','Flash','Table','SpecialChar']  //,'PageBreak','Smiley','HorizontalRule'
	    // ['Maximize', 'ShowBlocks','-','About']
  ];

};


CKEDITOR.on( 'dialogDefinition', function( ev ){
    // Take the dialog name and its definition from the event data.
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    // Check if the definition is from the dialog we're
    // interested in (the 'image' dialog). This dialog name found using DevTools plugin
   
    //  if ( dialogName == 'image' ){
        // Remove the 'Link' and 'Advanced' tabs from the 'Image' dialog.
    	 //   dialogDefinition.removeContents( 'Link' );    //링크 탭 제거
        dialogDefinition.removeContents( 'advanced' );  //상세정보 탭 제거

        
        
       // Get a reference to the 'Image Info' tab.
        //   var infoTab = dialogDefinition.getContents( 'info' );  //info탭을 제거하면 이미지 업로드가 안된다.
        // Remove unnecessary widgets/elements from the 'Image Info' tab.
        //  infoTab.remove( 'txtHSpace'); //info 탭 내에 불필요한 엘레멘트들 제거
        //   infoTab.remove( 'txtVSpace');
        //  infoTab.remove( 'txtBorder');
        //   infoTab.remove( 'txtWidth');
        //   infoTab.remove( 'txtHeight');
        //  infoTab.remove( 'ratioLock');
        //  }
      
        
        
});


