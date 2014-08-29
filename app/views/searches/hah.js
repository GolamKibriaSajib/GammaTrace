$(function () {

  // THE FOLLOWING GENERATES THE GRIDSTER LAYOUT
  gridster = $(".gridster ul").gridster({
      max_cols: 15,
      min_cols: 12,
      widget_base_dimensions: [93, 93],
      widget_margins: [1, 1],
      serialize_params: function ($w, wgd) {
          return {
              id: $w.prop('id'),
              class: $w.children().prop('id'),
              col: wgd.col,
              row: wgd.row,
              size_x: wgd.size_x,
              size_y: wgd.size_y,
              htmlContent: $($w).html()
          };
      },
      draggable: {
          handle: '.dragDiv'
      },
      helper: 'clone',
      resize: {
          enabled: true,
          resize: function (e, ui, $widget) {
              window.dispatchEvent(new Event('resize'));

          },
          stop: function (e, ui, $widget) {
              window.dispatchEvent(new Event('resize'));
          },
          max_size: [12, 12],
          min_size: [3, 3]
      }
  }).data('gridster');


  // THE FOLLOWING CLOSES WIDGETS
  $(document).on("click", ".closer", function (e) {
      e.preventDefault();
      gridster.remove_widget($(this).parent().parent().parent());
  });

  var serialization = gridster.serialize();
  serialization = Gridster.sort_by_row_and_col_asc(serialization);


  // THE FOLLOWING SAVES THE GRIDSTER LAYOUT
  $(document).on("click", "#serialize", function (e) {
      e.preventDefault();
      serialization = gridster.serialize();
      alert("serialized");
      alert(serialization);
  });

  // THE FOLLOWING LOADS THE GRIDSTER LAYOUT
  $('#load').on('click', function () {
      gridster.remove_all_widgets();
      $.each(serialization, function () {
          gridster.add_widget("<li class='droppable panel panel-default' id=" + this.id + ">" + this.htmlContent + "</li>", this.size_x, this.size_y, this.col, this.row);
      });
      regenGraphs();
  });

  // THE FOLLOWING REGENERATES THE GRAPHS FROM THE SAVED LAYOUT
  function regenGraphs() {
      $.each($(".gridster ul li"), function () {
          if ($(this).children(".panel-heading").hasClass("timeseries") && $.isNumeric(idsearch)) {
              var idsearch1 = $(this).children(".panel-heading").prop("id");
              droppableDiv = $(this).prop("id");
              $.ajax({
                  url: "/users/#{@user.id}/searches/" + idsearch + "/show_timeseries"
              });
          }
          else if ( $(this).children(".panel-heading").hasClass("termstructure") ) {
              var idsearch2 = $(this).children(".panel-heading").prop("id");
              droppableDiv = $(this).prop("id");
              $.ajax({
                  url: "/users/#{@user.id}/searches/" + idsearch + "/show_termstructure"
              });
              alert("generated");
          }
      });
  }

  i = 0;


  // THE FOLLOWING GENERATES THE TIMESERIES WIDGET
  $("#addtimeseries").click(function (e) {
      e.preventDefault();
      gridster.add_widget('<li class="droppable panel panel-default" id="timeseries' + i + '"><div class="panel-heading timeseries dragDiv" id="searchname">Time Series<div class="btn-group pull-right"><a href="javascript:void(0)" id="closer" class="closer">x</a></div></div><div class="panel-body" style="width:100%;height:90%;margin: 0 auto"></div></li>', 3, 3);
      i++;
  });

  // THE FOLLOWING GENERATES THE TIMESERIES WIDGET
  $("#addtermstructure").click(function (e) {
      e.preventDefault();
      gridster.add_widget('<li class="droppable panel panel-default" id="termstructure' + i + '"><div class="panel-heading termstructure dragDiv" id="searchname">Term Structure<div class="btn-group pull-right"><a href="javascript:void(0)" id="closer" class="closer">x</a></div></div><div class="panel-body" style="width:100%;height:90%;margin: 0 auto"></div></li>', 3, 3);
      i++;
  });

  // THE FOLLOWING GENERATES THE TIMESERIES WIDGET
  $("#adddatatable").click(function (e) {
      e.preventDefault();
      gridster.add_widget('<li class="droppable panel panel-default" id="datatable' + i + '"><div class="panel-heading datatable dragDiv" id="searchname">Data Table<div class="btn-group pull-right"><a href="javascript:void(0)" id="closer" class="closer">x</a></div></div><div class="panel-body" style="width:100%;height:90%;margin: 0 auto"></div></li>', 3, 3);
      i++;
  });

  // THE FOLLOWING GENERATES THE TIMESERIES WIDGET
  $("#adddetails").click(function (e) {
      e.preventDefault();
      gridster.add_widget('<li class="droppable panel panel-default id="details' + i + '"><div class="panel-heading details" dragDiv" id="searchname">Details<div class="btn-group pull-right"><a href="javascript:void(0)" id="closer" class="closer">x</a></div></div><div class="panel-body" style="width:100%;height:90%;margin: 0 auto"></div></li>', 3, 3);
      i++;
  });
  // THE FOLLOWING GENERATES THE DRAGGABLE FUNCTION

  $(".draggable").draggable({
      helper: 'clone',
      drag: function (event, ui) {
          $(".droppable").droppable({
              accept: '.draggable',
              hoverClass: "drop-hover",
              drop: function (event, ui) {
                  droppableDiv = $(event.target).attr('id');
                  alert(droppableDiv);
                  searchId = ui.draggable.attr("id");
                  panelid = $(event.target).children('.panel-heading').attr('id', searchId);
                  alert(panelid);
                  if ( $(event.target).children(".panel-heading").hasClass("timeseries") ) {
                      $.ajax({
                          url: "/users/#{@user.id}/searches/" + searchId + "/show_timeseries"
                      });
                  } else if ( $(event.target).children(".panel-heading").hasClass("termstructure") ) {
                      $.ajax({
                          url: "/users/#{@user.id}/searches/" + searchId + "/show_termstructure"
                      });
                  } else if ( $(event.target).children(".panel-heading").hasClass("datatable") ) {
                      $.ajax({
                          url: "/users/#{@user.id}/searches/" + searchId + "/show_timeseries"
                      });
                  } else if ( $(event.target).children(".panel-heading").hasClass("details") ) {
                      $.ajax({
                          url: "/users/#{@user.id}/searches/" + searchId + "/show_timeseries"
                      });
                  } else if ( $(event.target).children(".panel-heading").hasClass("blab") ) {
                      $.ajax({
                          url: "/users/#{@user.id}/searches/" + searchId + "/show_timeseries"
                      });
                  }
              }
          });
      }
  });