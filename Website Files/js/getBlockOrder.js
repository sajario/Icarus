function getBlockOrder() {
  let ar = [];
  let jigsawPieces = document.getElementsByClassName("draggable");
  for (i = 0;i<jigsawPieces.length;i++){
    ar[i][0] = jigsawPieces[i].
    ar[i][1] = jigsawPieces[i].offsetTop;
    console.log(ar);
  }
}
//jigsawPieces.sort(function(a, b){return a - b});
//console.log(jigsawPieces);
