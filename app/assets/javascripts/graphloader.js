
// THIS FUNCTION REGENERATES THE GRAPHS
  function regenGraphs() {
      var gridelems = $("#gridlist").children("li");
      urlFirst = "/users/" + gon.userid + "/searches/";
      gridelems.each(function() {
        isBodyEmpty = $(this).children(".panel-body").html() == "";
        idCheck = $.isNumeric($(this).children(".panel-heading").prop("id"));
        if (isBodyEmpty && idCheck) {
          idsearch = $(this).children(".panel-heading").prop("id");
          headIdentifier = $(this).children(".panel-heading");
          bodyIdentifier = $(this).children(".panel-body");
          urlparam = urlFirst + idsearch;
          droppableDiv = $(this).prop("id");
          graphType = $(this).children(".panel-heading").attr("class").split(' ').slice(1, 2);
          ajaxGraphs(urlparam + "/show_" + graphType, headIdentifier, bodyIdentifier, urlparam);
        }
      });
      graphChecker(gridelems);
      spinner.stop();
      $("#mainpage").fadeTo("slow", 1)
  }
// THIS FUNCTION MAKES THE AJAX CALL TO GENERATE THE GRAPH IN A WIDGET
  function ajaxGraphs(url, headIdentifier, bodyIdentifier, urlparam) {
    $.ajax({
      async: false,
      url: url
    })
  }

// THIS FUNCTION CHECKS IF ALL GRAPHS HAVE BEEN GENERATED PROPERLY. IF NOT, IT CALLS THE REGEN FUNCTION
  function graphChecker(gridelems) {
    count = 0;
    gridelems.each(function(e) {
      idCheck = $.isNumeric($(this).children(".panel-heading").prop("id"));
      isBodyEmpty = $(this).children(".panel-body").html() == "";
      if (idCheck && isBodyEmpty) count++;
    });
    if (count > 0) regenGraphs();
  };

// THE FOLLOWING FUNCTION IS AN EXTRA FUNCTION FOR GRAPH CHECKING- THIS FUNCTION JUST CHECKS THE GRAPH THAT WAS JUST 
// GENERATED TO SEE IF IT WAS PROPERLY GENERATED OR NOT. IF IT NEEDS REGENERATION, IT WILL CALL THE ajaxGraphs() FUNCTION
// AGAIN. CURRENTLY IT DOES NOT WORK 100% OF THE TIME SO IT HAS BEEN LEFT FOR LATER
  function singleGraphGen(headIdentifier, bodyIdentifier, urlparam, url) {
    isBodyEmpty = bodyIdentifier.html() == "";
    if (isBodyEmpty) {
      ajaxGraphs(url, headIdentifier, bodyIdentifier, urlparam);
    } else return;
  }