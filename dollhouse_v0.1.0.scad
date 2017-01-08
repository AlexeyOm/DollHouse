

wF = 8;
pazWidth = 10;


hW = 500; //желательная ширина дома
hD = 290; //желательная глубина дома
hH = 600; //желательная высота стены дома

function rot(angle) = [0, 0, angle];

houseWidth = floor(hW / (2 * pazWidth)) * 2 * pazWidth + pazWidth + 2 * wF;
echo("<b>Ширина дома</b>", houseWidth);

houseDepth = floor(hD / (2 * pazWidth)) * 2 * pazWidth + pazWidth;
echo("<b>Глубина дома</b>", houseDepth);

wallHeight = floor(hH / (2 * pazWidth)) * 2 * pazWidth;
echo("<b>Высота стен дома</b>", wallHeight);


union() { //стены и основание дома
   
    difference() {//основание
        square([houseWidth,houseDepth],false);
        union() { //шипы
            translate([0, -1]) { // соединение с задней стенкой
                for( i = [wF + pazWidth : pazWidth * 2 : houseWidth - pazWidth])
                    translate([i, 0]) square([pazWidth, wF + 1]);
            }
            translate([-1, 0]) { // соединение с правой стенкой
                for( i = [0 : pazWidth * 2 : houseDepth])
                    translate([0, i]) square([wF+1, pazWidth]);
            }
            translate([houseWidth - wF, 0]) { // соединение с левой стенкой
                for( i = [0 : pazWidth * 2 : houseDepth])
                    translate([0, i]) square([wF+1, pazWidth]);
            }
        }
    }

//правая боковая стена

//левая боковая стена

//задняя стенка
    
}




        