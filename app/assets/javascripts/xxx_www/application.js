// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require opal
//= require opal_ujs
//= require opal-jquery
//= require underscore-min
//= require idangero-us-swiper/swiper-3.4.0.jquery.min
//= require qrcode-min
//= require google/gmaps
//= require google/www_login
//= require plupload/plupload.full.min
//= require plupload/qiniu.min
//= require facebook/facebook_login

//= require jquery-ui/widgets/dialog
//= require_tree ./shared
//= require_tree .
//= require_self

// Expect this to worked ...
Opal.load('./shared/qiniu_uploader');
