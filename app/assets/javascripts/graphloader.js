var intervalArr = new Array();
var viewcounter = 0;
// THIS FUNCTION KILLS ALL PREVIOUS INTERVALS BEFORE LOADING A NEW INTERVAL
  function killIntervals(){
      while(intervalArr.length > 0) {
        console.log("KILLING");
        clearInterval(intervalArr.pop());
      }
      console.log("KILLED IT");
  };

// THIS FUNCTION REGENERATES THE GRAPHS
  function regenGraphs() {
    killIntervals();
    var gridelems = $("#gridlist").children("li");
    urlFirst = "/users/" + gon.userid + "/searches/";
    $.when(graphTraverser(gridelems, urlFirst)).done(firstTimer(gridelems, urlFirst));
  }

  function graphTraverser(gridelems, urlFirst) {
    gridelems.each(function() {
      count = 0;
      isBodyEmpty = $(this).children(".panel-body").html() == "";
      idCheck = $.isNumeric($(this).children(".panel-heading").prop("id"));
      if (isBodyEmpty && idCheck) {
        idsearch = $(this).children(".panel-heading").prop("id");
        headIdentifier = $(this).children(".panel-heading");
        bodyIdentifier = $(this).attr("id");
        urlparam = urlFirst + idsearch;
        droppableDiv = $(this).prop("id");
        graphType = $(this).children(".panel-heading").attr("class").split(' ').slice(1, 2);
        ajaxGraphs(urlparam + "/show_chart", graphType, bodyIdentifier.toString());
      }
    });
  }

  function firstTimer(gridelems, urlFirst){
    killIntervals();
    if (viewcounter == 0){
      viewcounter++;
      graphTraverser(gridelems, urlFirst);
    }

    setTimeout(finisher(), 50000);
  }
// THIS FUNCTION MAKES THE AJAX CALL TO GENERATE THE GRAPH IN A WIDGET
  function ajaxGraphs(url, graphType, bodyIdentifier) {
    var data = {"graph_type" : graphType.toString(), "bodyid" : bodyIdentifier};
    $.ajax({
      type: "POST",
      url: url,
      data: data
    }).done(function() {
      console.log("DONE");
    });
  }

// THIS FUNCTION CHECKS IF ALL GRAPHS HAVE BEEN GENERATED PROPERLY. IF NOT, IT CALLS THE REGEN FUNCTION
  function graphChecker(gridelems) {
    count = 0;
    urlFirst = "/users/" + gon.userid + "/searches/";
    gridelems.each(function(e) {
      idCheck = $.isNumeric($(this).children(".panel-heading").prop("id"));
      graphType = $(this).children(".panel-heading").attr("class").split(' ').slice(1, 2).toString();
      if (graphType == "termstructure") {
        isBodyEmpty = ( ($(this).children(".panel-body .first").html() == "") || ($(this).children(".panel-body .second").html() == "") )
      } else {
        isBodyEmpty = ( $(this).children(".panel-body").html() == "" )
      }
      if (idCheck && isBodyEmpty) count++;
    });
    // graphTraverser(gridelems, urlFirst);
    finisher();
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

  function finisher(){
    spinner.stop();
    $("#mainpage").fadeTo("slow", 1)
    return;
  }