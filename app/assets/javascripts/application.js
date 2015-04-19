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
//= require turbolinks
//= require jquery2
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.scroller
//= require bootstrap
//= require jquery-ui
//= require highstock
//= require toastr
//= require chance.min
//= require jquery.qtip.min
//= require angular
//= require angular-animate
//= require angular-resource
//= require angular-ui-bootstrap
//= require_tree .



var chartLister = ["timeseries","termstructure","datatable","details", "delta", "spread_delta", "ccydelta", "vega"];
var opts = {
  lines: 17, // The number of lines to draw
  length: 0, // The length of each line
  width: 7, // The line thickness
  radius: 30, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 30, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: 'red', // #rgb or #rrggbb or array of colors
  speed: 2.2, // Rounds per second
  trail: 83, // Afterglow percentage
  shadow: true, // Whether to render a shadow
  hwaccel: true, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '50%', // Top position relative to parent
  left: '50%' // Left position relative to parent
};
var target = document.getElementById('foo');
var spinner = new Spinner(opts).spin(target);

var data_array = new Object();
Object.freeze(chartLister);

$(document).mousedown(function() {
    down = true;
}).mouseup(function() {
    down = false;  
});
