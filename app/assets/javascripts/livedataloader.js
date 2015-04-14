globalarray = [];
j = 0;

function randomFloatBetween(minValue,maxValue,precision){
  if(typeof(precision) == 'undefined'){
      precision = 2;
  }
  return parseFloat(Math.min(minValue + (Math.random() * (maxValue - minValue)),maxValue).toFixed(precision));
};

function dataPush() {
  
  for (i = 0; i < globalarray.length; i++) {
        var chart =  $("#"+ droppableDiv +" .panel-body").highcharts();
        var x = (new Date()).getTime();
        var y = randomFloatBetween(1.7,1.85,4);
        var dissId= 12343;
        globalarray[i].addPoint({x: x, y: y, dissId: dissId}, true, true, false);
        // j++;
        // if (j == 5) {globalarray[i].redraw(); j = 0};
        
  }
};


function table_typecheck(table_type){
  if (table_type == "delta") {
    return "show_delta"
  } else if (table_type == "sprea"){
    return "show_spread_delta"
  } else if (table_type == "datat") {
    return "datatable"
  } else if(table_type == "terms"){
    return "term_structure"
  }
}

function ajax_caller(table_type, datatosend, searchId){
  if (table_type == "term_structure"){
    $.ajax({
      type: "POST",
      url: "/users/" + gon.userid + "/searches/" + searchId + "/chart_updater",
      data: datatosend
    })
  } else if ( (table_type == "show_delta") || (table_type == "show_spread_delta") || (table_type == "datatable") ) {
    $.ajax({
      type: "POST",
      url: "/users/" + gon.userid + "/searches/" + searchId + "/table_updater",
      data: datatosend
    })
  }
}

