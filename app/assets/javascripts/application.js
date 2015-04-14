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
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.scroller
//= require bootstrap
//= require jquery-ui
//= require toastr
//= require highstock
//= require chance.min
//= require jquery.qtip.min
//= require angular
//= require angular-animate
//= require angular-resource
//= require angular-ui-bootstrap
//= require_tree .



var chartLister = ["timeseries","termstructure","datatable","details", "delta", "spread_delta", "ois", "ccy"];
var data_array = new Object();
Object.freeze(chartLister);

$(document).mousedown(function() {
    down = true;
}).mouseup(function() {
    down = false;  
});
