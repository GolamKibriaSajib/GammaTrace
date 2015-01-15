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