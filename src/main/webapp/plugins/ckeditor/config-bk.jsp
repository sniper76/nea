/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	    config.width='100%';
	    config.height='300';

	    config.enterMode='2';
	    config.shiftEnterMode='3';
	    config.toolbar = 'MyToolbar';
	    config.filebrowserImageUploadUrl = '../ckeditor/upload_dbx.jsp';
	    config.toolbar_MyToolbar =
	    [
		     ['Source','-','NewPage','Preview','-','Templates'],
			 ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print'],  //'SpellChecker',
		     ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
		  // ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
		     ['BidiLtr', 'BidiRtl'],
		     '/',
		     ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
		     ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
		     ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		     ['Link','Unlink','Anchor'],
		     '/',
		     ['Styles','Format','Font','FontSize'],
		     ['TextColor','BGColor'],
		     ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
		    // ['Maximize', 'ShowBlocks','-','About']
        ];


};
