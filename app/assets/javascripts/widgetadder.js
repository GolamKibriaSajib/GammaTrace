// THE FOLLOWING HELPER FUNCTION ADDS THE WIDGETS 

function addWidget(graphType, gTypeName) {
  randId = chance.hash();
  gridster.add_widget('<li class="droppable panel panel-default" id="' + graphType + randId + '"><div class="panel-heading ' + graphType + ' dragDiv" id="searchname">' + gTypeName + '<div class="btn-group pull-right"><a href="javascript:void(0)" id="closer" class="closer">x</a></div></div><div class="panel-body" style="width:100%;height:90%;margin: 0 auto"></div></li>', 6, 6);
}
