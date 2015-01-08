// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery-ui
//= require chance.min
//= require highstock
//= require highchartstheme
//= require jquery.draggable.min
//= require graphloader
//= require jquery.gridster.withextras.min
//= require jquery.scrollTableBody
//= require spin.min
//= require jquery.qtip.min
//= require turbolinks
//= require_tree .

opts={lines:17,length:35,width:2,radius:60,corners:1,rotate:0,direction:1,color:"orange",speed:2,trail:100,shadow:false,hwaccel:false,className:"spinner",zIndex:2e9,top:"50%",left:"50%"};$(function(){$(document).tooltip({show:{effect:"slideDown",delay:5}});$("#menunav").multilevelpushmenu({menuWidth:60,menuHeight:"100%",collapsed:false,backText:"",backItemIcon:"fa fa-angle-right fa-2x",overlapWidth:40})})





