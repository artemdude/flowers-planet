/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config ) {

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    //config.resize_minWidth = 550;
    // config.resize_maxWidth = 700;
    // config.resize_minHeight = 200;
    // config.resize_maxHeight = 500;

        config.uiColor = '#999999';
        config.resize_maxWidth = '%';
        config.resize_maxHeight = 700;

    config.toolbar_Full =
    [
    ['Source', '-', 'Save', 'NewPage', 'Preview'],
    ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'],
    ['Find', 'Replace', '-', 'Print', 'SpellChecker', 'Scayt'],
    '/',
    ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
    ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
    ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'SelectAll', 'RemoveFormat'],
    '/',
    ['Link', 'Unlink', 'Anchor', '-', 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'],
    '/',
    ['Styles', 'Format', 'Font', 'FontSize'],
    ['TextColor', 'BGColor'],
    ['Maximize', 'ShowBlocks', '-', 'About']
    ];

    config.toolbar_Admin =
    [
    ['Source', '-', 'Preview'], ['Styles', 'Format', 'Font', 'FontSize'], ['TextColor', 'BGColor', '-','RemoveFormat'],
    '/',
    ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
    ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
    ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
    ['Link', 'Unlink', '-', 'Image', 'Table', 'SpecialChar'],


    ];

    config.toolbar = 'Admin';
};
