// JavaScript Document
function MergeDateCells(tab) {
 //从第二行开始，排除标题行
 var startRow = 1;
 //循环记录表格中td的内容,用来判断td中的value是否发生了改变
 var tdTempV = "";
 //如果td的值相同,那么变量加1, 否则将临时变量加入集合中
 var rowCount = 1;
 //得到相同内容的行数的集合www.2cto.com
 var totalcount = new Array();

 for (var i = 1; i < tab.rows.length; i++) {
  //首先拿出来td的值
  var tdText = tab.rows[i].cells[1].innerText;
  //如果是第一次走循环,直接continue; 
  if (i == startRow) {
   tdTempV = tdText;
   continue;
  }
  //如果当前拿出来的值和出处的值相同,那么将临时数量加1，否则添加到集合里面
  if (tdTempV == tdText) {
   rowCount++;
  } else {
   totalcount.push(rowCount);
   tdTempV = tdText;
   rowCount = 1;
  }

  //判断是否是循环的最后一次,如果是最后一次那个直接将当前的数量存储到集合里面
  if (i == tab.rows.length - 1) {
   totalcount.push(rowCount);
  }
 }
 //临时变量,再循环中判断是否和数组中的一项值相同  
 var tNum = 0;
 //注意这个循环是倒着来的
 for (var i = tab.rows.length - 1; i >= startRow; i--) {
  //临时变量,存储td  
  var tTd = tab.rows[i].cells[1];
  tNum++;
  //如果发现tNum和数组中最后一个值相同,那么就可以断定相同的td已经结束[只是其中一个] 
  if (tNum == totalcount[totalcount.length - 1]) {
   //给当前td添加rowSpan属性
   tTd.setAttribute("rowSpan", totalcount[totalcount.length - 1]);
   //将数组的最后一个元素弹出
   totalcount.pop();
   tNum = 0;
  } else {
   //删除当前td  
   tab.rows[i].removeChild(tTd);
  }
 }
}

 