var result = false;


function isOverLapping(p1,p2,p3,p4){
	if()
}

function convertToPoints(line1,line2){
	var r1p1, r1p2, r1p3, r1p4, r2p1, r2p2,r2p3, r2p4;
	r1p1 = [line2[0], line1[0]] ;  // rect 1
	r1p2 = [line2[1], line1[1]] ;  // rect 1
	r2p1 = [line2[2], line1[2]] ;  // rect 2
	r2p2 = [line2[3], line1[3]] ;  // rect 2
	return [p1, p2, p3, p4];
}
// Test case 1
[yl1,yr1,yl2,yr2] = [0,10,10,0];
[xl1,xr1,xl2,xr2] = [5,5,15,0];

var line1 =  [yl1,yr1,yl2,yr2];
var line2 =  [xl1,xr1,xl2,xr2];

[p1, p2, p3, p4] = convertToPoints(line1, line2) ;

result = isOverLapping(p1, p2, p3, p4);

