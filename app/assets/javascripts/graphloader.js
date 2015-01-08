
// THIS FUNCTION REGENERATES THE GRAPHS
  function regenGraphs() {
      var gridelems = $("#gridlist").children("li");
      urlFirst = "/users/" + gon.userid + "/searches/";
      gridelems.each(function() {
        isBodyEmpty = $(this).children(".panel-body").html() == "";
        idCheck = $.isNumeric($(this).children(".panel-heading").prop("id"));
        if (isBodyEmpty && idCheck) {
          idsearch = $(this).children(".panel-heading").prop("id");
          urlparam = urlFirst + idsearch;
          droppableDiv = $(this).prop("id");
          graphType = $(this).children(".panel-heading").attr("class").split(' ').slice(1, 2);
          ajaxGraphs(urlparam + "/show_" + graphType);
        }
      });
      graphChecker(gridelems);
      spinner.stop();
      $("#mainpage").fadeTo("slow", 1)
  }

  function ajaxGraphs(e) {
      $.ajax({
          async: false,
          url: e
      })
  }

  function graphChecker(gridelems) {
    count = 0;
    gridelems.each(function(e) {
      idCheck = $.isNumeric($(this).children(".panel-heading").prop("id"));
      isBodyEmpty = $(this).children(".panel-body").html() == "";
      if (idCheck && isBodyEmpty) count++;
    });
    if (count > 0) regenGraphs();
  };