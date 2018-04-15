function convertCode() {
  let text = document.getElementById("text").innerHTML;
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
        container.innerHTML+='<div class="jigsawHolder, draggable" data-type="if"><img src="css/img/Jigsaw Piece If.png" style="width:300px"><p class="jigsaw if" style="margin-top:-90px;font-family:Roboto;font-size:25px;color:white;padding-bottom:100px;padding-left:140px;">'+blocks[i]+'</p></div>';
        break;
      case '(':
        container.innerHTML+='<div class="jigsawHolder, draggable" data-type="condition"><img src="css/img/Jigsaw Piece Condition.png" style="width:300px"><p class="jigsaw condition" style="margin-top:-90px;font-family:Roboto;font-size:25px;color:white;padding-bottom:100px;padding-left:70px;">'+blocks[i]+'</p></div>';
        break;
      case '{':
        container.innerHTML+='<div class="jigsawHolder, draggable" data-type="code"><img src="css/img/Jigsaw Piece Code.png" style="width:300px"><p class="jigsaw condition" style="margin-top:-90px;font-family:Roboto;font-size:25px;color:white;padding-bottom:100px;padding-left:70px;">'+blocks[i]+'</p></div>';
        break;
      default:
        console.log("Something went wrong, please try with different code");
        break;
    }
  }
}
