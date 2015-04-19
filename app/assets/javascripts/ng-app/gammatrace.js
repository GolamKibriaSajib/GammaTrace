angular
    .module('Gammatrace', [
        "ngResource",
        "ui.bootstrap",
        'gridster'
    ])

angular.module('Gammatrace')

.controller('DashboardCtrl', ['$scope', '$timeout',
  function($scope, $timeout) {
    $scope.gridsterOptions = {
      margins: [2, 2],
      columns: 12,
      draggable: {
        handle: ".dragDiv"
      }
    };

    $scope.dashboards = {
      '1': {
        id: '1',
        name: 'Home',
        widgets: []
      }
    };

    $scope.clear = function() {
      $scope.dashboard.widgets = [];
    };

    $scope.addTimeSeriesWidget = function() {
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 1,
        sizeY: 1,
        graphType: "timeseries",
        gTypeName: "Time Series"
      });
    };

    $scope.addTermStructureWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 1,
        sizeY: 1,
        graphType: "termstructure",
        gTypeName: "Term Structure",
        randId: randId
      });
    };



    $scope.addDataTableWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 6,
        sizeY: 4,
        graphType: "datatable",
        gTypeName: "Data Table",
        randId: randId
      });
      var divname = "#datatable"+ randId;
    };

    $scope.addDeltaWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 5,
        sizeY: 3,
        graphType: "delta",
        gTypeName: "Delta",
        randId: randId
      });
    };

    $scope.addCCYDeltaWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 5,
        sizeY: 3,
        graphType: "xccy_delta",
        gTypeName: "CCY Delta",
        randId: randId
      });
    };

    $scope.addVegaWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 5,
        sizeY: 3,
        graphType: "vega",
        gTypeName: "Vega",
        randId: randId
      });
    };

    $scope.addSpreadDeltaWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 5,
        sizeY: 3,
        graphType: "spread_delta",
        gTypeName: "Spread Delta",
        randId: randId
      });
    };

    $scope.addTimeSeriesWidget = function() {
      randId = chance.hash();
      $scope.dashboard.widgets.push({
        name: "New Widget",
        sizeX: 1,
        sizeY: 1,
        graphType: "timeseries",
        randId: randId,
        gTypeName: "Time Series"
      });
    };

    $scope.$watch('selectedDashboardId', function(newVal, oldVal) {
      if (newVal !== oldVal) {
        $scope.dashboard = $scope.dashboards[newVal];
      } else {
        $scope.dashboard = $scope.dashboards[1];
      }
    });

    // init dashboard
    $scope.selectedDashboardId = '1';

  }
])

.controller('CustomWidgetCtrl', ['$scope', '$modal',
  function($scope, $modal) {

    $scope.remove = function(widget) {
      $scope.dashboard.widgets.splice($scope.dashboard.widgets.indexOf(widget), 1);
      console.log("Widget id is " + widget["randId"]);
    };


  }
])



// helper code
.filter('object2Array', function() {
  return function(input) {
    var out = [];
    for (i in input) {
      out.push(input[i]);
    }
    return out;
  }
});



