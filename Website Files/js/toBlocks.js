function doStuff() {
  let text = document.getElementById("text").value;
  let blocks = [];
  let condition = 0;
  let endCondition = false;
  let code = 0;
  let endCode = false;
  text = text.split(" ");

  //Deal with condition
  for (i=0;i<text.length;i++) {
    if (text[i] === "if" || text[i] === "for" || text[i] === "while") {
      blocks.push(text[i]);
    } else if (text[i].charAt(0) === '(' && text[i].charAt(1) != ' ' && condition === 0) {
      condition = i;
      blocks.push(text[i]);
    } else if (blocks[blocks.length-1].charAt(0) === '(' && blocks[blocks.length-1].charAt(blocks.length-1) != ')' && !endCondition) {
      blocks[condition]+=text[i];
    }
    if (blocks[blocks.length-1].charAt(blocks[blocks.length-1].length-1) === ')') {
      endCondition = true;
    }

    //Deal with curly braces
    if (endCondition) {
      for (i=0;i<text.length;i++) {
        if (text[i].charAt(0) === '{' && text[i].charAt(1) != ' ' && code === 0) {
         blocks.push(text[i]);
         code = blocks.length-1;
       } else if (blocks[blocks.length-1].charAt(0) === '{' && blocks[blocks.length-1].charAt(blocks.length-1) != '}' && !endCode) {
         blocks[code]+=text[i];
       }
       if (blocks[blocks.length-1].charAt(blocks[blocks.length-1].length-1) === '}') {
         endCode = true;
       }
      }
    }
  }
  toBlocks(blocks);
}

function toBlocks(blocks) {
  let image = null;
  let container = document.getElementById("jigsawAreaContainer");
  for (i=0;i<blocks.length;i++) {
    switch(blocks[i].charAt(0)) {
      case 'i':
      case 'f':
      case 'w':
        container.innerHTML+='<div class="jigsawHolder" id="draggable'+i+'"><img src="../Jigsaw Piece If.png"><p class="jigsaw if">'+blocks[i]+'</p></div>';
        toDraggable("draggable"+i);
        break;
      case '(':
        container.innerHTML+='<div class="jigsawHolder" id="draggable'+i+'"><img src="../Jigsaw Piece Condition.png"><p class="jigsaw condition">'+blocks[i]+'</p></div>';
        toDraggable("draggable"+i);
        break;
      case '{':
        container.innerHTML+='<div class="jigsawHolder" id="draggable'+i+'"><img src="../Jigsaw Piece Code.png"><p class="jigsaw condition">'+blocks[i]+'</p></div>';
        toDraggable("draggable"+i);
        break;
      default:
        console.log("Something went wrong, please try with different code");
        break;
    }
  }
}
function toDraggable(id) {
  $(id).draggable({grid:[20,13]});
}
