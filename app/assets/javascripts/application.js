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
//= require jquery-ui
//= require bootstrap
//= require rickshaw_with_d3
//= require highstock
//= require highchartstheme
//= require jquery.draggable
//= require jquery.gridster
//= require utils
//= require lodash
//= require underscore
//= require modernizr
//= require moment
//= require jquery.scrollTableBody
//= require spin.min
//= require jquery.qtip.min
//= require turbolinks
//= require_tree .

opts = {
  lines: 17, // The number of lines to draw
  length: 35, // The length of each line
  width: 2, // The line thickness
  radius: 60, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 0, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: 'orange', // #rgb or #rrggbb or array of colors
  speed: 2, // Rounds per second
  trail: 100, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '50%', // Top position relative to parent
  left: '50%' // Left position relative to parent
};

  $(function () {
    $(document).tooltip({
      show: {
        effect: "slideDown",
        delay: 5
      }
    });
    $( '#menunav' ).multilevelpushmenu({
      menuWidth: 60, // '450px', '30em', '25%' will also work
      menuHeight: '100%',
      collapsed: false,
      backText: '',  
      backItemIcon: 'fa fa-angle-right fa-2x',
      overlapWidth: 40,
    });
  });

$(document).ready(function(){
  // HTML markup implementation, overlap mode

});