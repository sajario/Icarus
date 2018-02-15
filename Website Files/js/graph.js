//Graph.js
//Author Sean Breen
//Date July 12th 2017
//Version 0.1

if (document.getElementById('graph').nodeName == "CANVAS") {
  console.log("Graph.js v0.1");

  var canvas = document.getElementById('graph');
  var ctx = canvas.getContext("2d");

  //Function to get max value from an array
  Array.prototype.max = function() {
    return Math.max.apply(null, this);
  };

  //Populate Y axis
  var plotScale = getHitScale(pageHits.max());
  //Populate X axis
  var spacing = getTimescale(month);

  //Set font for canvas
  ctx.font = "12px Calibri";

  //Draw X and Y axes
  drawAxes();

  //Plot the points given the data
  plotPoints(pageHits,plotScale,spacing);

  //Draw the X and Y axes
  function drawAxes() {
    ctx.beginPath();
    ctx.moveTo(40,23.6);
    ctx.lineTo(40,260);
    ctx.lineTo(640,260);
    ctx.strokeStyle="black";
    ctx.stroke();
  }

  function getTimescale(month) {
    //Set number of days according to the month given
    switch(month) {
      case "january":
      case "march":
      case "may":
      case "july":
      case "august":
      case "october":
      case "december":
        var days = 31;
        break;
      case "april":
      case "june":
      case "september":
      case "november":
        var days = 30;
        break;
      case "february":
        var days = 28;
        break;
    }
    //Set the width between notches on the X axis
    var sliceWidth = 620/days;
    var slicePos = 40;

    //Go to 0,0 on graph to start drawing the values for X axis
    ctx.beginPath();
    ctx.moveTo(40,260);

    //Draw each of the notches for the X axis and the day number below them
    for (i=1;i<=days;i++) {
      ctx.lineTo(slicePos,270);
      ctx.strokeStyle="black";
      ctx.stroke();
      ctx.fillText(i,slicePos-5,285);
      slicePos+=sliceWidth;
      ctx.moveTo(slicePos,260);
    }

    return sliceWidth;
  }

  //Set up the scaling for the values on the Y axis, draw the 10 notches, and apply the scale to them
  function getHitScale(maxHits) {
    //If the maximum views a site gets is 100, there is no need for the scale to go up to 1,000,000. If the maximum is 1,000,000 then a scale that goes up to 100 wouldn't fit everything on. This method allows for
    if(maxHits>=0 && maxHits<=100) {
      var scale = 10;
    } else if (maxHits>=100 && maxHits<=1000) {
      var scale = 100;
    } else if (maxHits>=1000 && maxHits<=10000) {
      var scale = 1000;
    } else if (maxHits>=10000 && maxHits<=100000) {
      var scale = 10000;
    } else if (maxHits>=100000 && maxHits<=1000000) {
      var scale = 100000;
    } else if (maxHits>=1000000 && maxHits<=10000000) {
      var scale = 1000000;
    } else {
      console.log("Ask the developer to increase this");
    }

    var slicePos = 260;
    var scaleNo = 0;

    //Go to 0,0 on graph to start drawing the values for Y axis
    ctx.beginPath();
    ctx.moveTo(40,260);

    for (i=0;i<=10;i++) {
      ctx.lineTo(30,slicePos);
      ctx.strokeStyle="black";
      ctx.stroke();
      ctx.fillText(scaleNo,0,slicePos+4);

      //Draw grey lines across
      ctx.beginPath();
      ctx.moveTo(41,slicePos);
      ctx.lineTo(640,slicePos);
      ctx.strokeStyle="#ddd";
      ctx.stroke();

      slicePos-=23.63;
      scaleNo+=scale;
      ctx.beginPath();
      ctx.moveTo(40,slicePos);
    }

    return scale;
  }

  function plotPoints(pageHits,scale,spacing) {
    var xspace=20+spacing;
    switch(scale) {
      case 100:
        var scaleModifier = 0.236;
        console.log
        break;
      case 1000:
        var scaleModifier = 0.0236;
        break;
      case 10000:
        var scaleModifier = 0.00236;
        break;
      case 100000:
        var scaleModifier = 0.000236;
        break;
      case 1000000:
        var scaleModifier = 0.0000236;
        break;
      case 10000000:
        var scaleModifier = 0.00000236;
        break;
      default:
        var scaleModifier = 0.00000236;
        console.log("Please ask the developer to increase the range");
        break;
    }

    for (i=0;i<=pageHits.length;i++) {

      var toLineX1 = xspace;
      var toLineY1 = ((pageHits[i])*-1)*scaleModifier+260;

      xspace+=spacing;

      var toLineX2 = xspace;
      var toLineY2 = ((pageHits[i+1])*-1)*scaleModifier+260;

      connectDots(toLineX1,toLineY1,toLineX2,toLineY2);
    }
  }

  function connectDots(x1,y1,x2,y2) {
    ctx.beginPath();
    ctx.quadraticCurveTo(x1,y1,x2,y2);
    //ctx.moveTo(x1,y1);
    //ctx.lineTo(x2,y2);
    ctx.lineWidth=2;
    ctx.strokeStyle="orange";
    ctx.stroke();

  /*Uncomment this if you wish to have a slightly different look to the line.
    ctx.beginPath();
    ctx.arc(x1,y1, 7,0, 2 * Math.PI, false);
    ctx.fillStyle = '#fff';
    ctx.fill();
    ctx.lineWidth = 1;
    ctx.strokeStyle = '#fff';
    ctx.stroke();

    ctx.beginPath();
    ctx.arc(x1,y1, 4,2 * Math.PI, false);
    ctx.fillStyle = '#fff';
    ctx.fill();
    ctx.lineWidth = 2;
    ctx.strokeStyle = 'orange';
    ctx.stroke();*/
  }

} else {
  alert("Please add a canvas element with ID 'graph'");
}
