//pieChart.js
//Author Sean Breen
//Date December 20th 2017
//Version 0.1
if (document.getElementById('pieChart')){
  var chart = document.getElementById('pieChart');
  var ctx = chart.getContext("2d");

  var sections = graphData.length;
  var total=0, start=0, end=0, width=graphStyle[0], height=graphStyle[1], radius=graphStyle[2], font=graphStyle[3], slices=[], colours=[];

  //Set width and height equal to given dimensions
  chart.width=width;
  chart.height=height;
  //Get total number of sections and their colours
  for (i=0;i<sections;i++) {
    total+=graphData[i][1];
    colours[i] = graphData[i][2];
  }
  //To neaten up the code, give each section a radian value
  for (i=0;i<sections;i++) {
    slices.push(((graphData[i][1]/total)*360)*Math.PI/180);
  }
  //Draw each of the sections
  for (i=0;i<sections;i++) {
    //Get the colour for the current section
    ctx.fillStyle=colours[i];
    ctx.beginPath();
    ctx.moveTo(width/2,height/2);
    if (i == 0) {
      start=0;
      end=slices[i];
    } else if (i<sections-1) {
      start+=slices[i-1];
      end=slices[i]+start;
    } else {
      start+=slices[i-1];
      end=2*Math.PI;
    }
    ctx.arc(width/2,height/2,radius,start,end);
    ctx.lineTo(width/2,height/2);
    ctx.fill();
  }
}

//Key code
if (document.getElementById('pieKey')) {
  var keyBox = document.getElementById('pieKey');
  var keyCtx = keyBox.getContext("2d");
  var rectStartX=0, rectStartY=20, rectEndY=20;

  //Set height and width of key canvas
  keyBox.width=width;
  keyBox.height=sections*34;

  for (i=0;i<sections;i++) {
    //Draw the caption and the dot
    var caption=graphData[i][0];
    keyCtx.fillStyle=colours[i];
    keyCtx.font=font;
    keyCtx.beginPath();
    keyCtx.arc(10,rectStartY,5,0,2*Math.PI);
    keyCtx.fill();
    keyCtx.font="14px "+font;
    keyCtx.fillStyle='#000';
    keyCtx.fillText(graphData[i][0],20,rectStartY+5);
    rectStartY+=35;
  }
}
