/*        translate([- houseDepth/2,houseDepth/2]) //треугольник крыши
            rotate([0,0,315])
                union() {
                    polygon([[0,0],[houseDepth/sqrt(2),0],[0,houseDepth/sqrt(2)]]);
                    translate ([houseDepth/sqrt(2) * 0.2, - wF]) square([pazWidth * 2, wF]);
                    translate ([houseDepth/sqrt(2) * 0.6, - wF]) square([pazWidth * 2, wF]);
                    
                    translate ([-wF, houseDepth/sqrt(2) * 0.2]) square([wF, pazWidth * 2]);
                    translate ([-wF, houseDepth/sqrt(2) * 0.6]) square([wF, pazWidth * 2]);
                }
        
*/
wF = 8;
pazWidth = 10;


hW = 500; //желательная ширина дома
hD = 220; //желательная глубина дома
hH = 400; //желательная высота стены дома

houseWidth = floor(hW / (2 * pazWidth)) * 2 * pazWidth + pazWidth + 2 * wF;
echo("<b>Ширина дома</b>", houseWidth);

houseDepth = floor(hD / (2 * pazWidth)) * 2 * pazWidth + pazWidth;
echo("<b>Глубина дома</b>", houseDepth);

wallHeight = floor(hH / (2 * pazWidth)) * 2 * pazWidth;
echo("<b>Высота стен дома</b>", wallHeight);


union() { //стены и основание дома
   
    translate ([wallHeight + 1, 0]) //temp
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

    difference () {//правая боковая стена
        
        union() {
            translate([- houseDepth/2,houseDepth/2]) //треугольник крыши
            rotate([0,0,315])
                union() {
                    polygon([[0,0],[houseDepth/sqrt(2),0],[0,houseDepth/sqrt(2)]]);
                    translate ([houseDepth/sqrt(2) * 0.2, - wF]) square([pazWidth * 2, wF]);
                    translate ([houseDepth/sqrt(2) * 0.6, - wF]) square([pazWidth * 2, wF]);
                    
                    translate ([-wF, houseDepth/sqrt(2) * 0.2]) square([wF, pazWidth * 2]);
                    translate ([-wF, houseDepth/sqrt(2) * 0.6]) square([wF, pazWidth * 2]);
                }
            square([wallHeight, houseDepth], false); //прямоугольник стены
        }
        union() { //шипы
            translate([wallHeight - wF, 0]) { //соединение с основанием
                for( i = [pazWidth : pazWidth * 2 : houseDepth])
                        translate([0, i]) square([wF+1, pazWidth]);
            }
            for( i = [pazWidth : pazWidth * 2 : wallHeight - pazWidth - wF])
                translate([i, 0]) square([pazWidth, wF+1]);
        }
    }
    
    translate([houseWidth + wallHeight*2 +2, 0])
    mirror([1,0,0])
    difference () {//левая боковая стена
        
        union() {
            translate([- houseDepth/2,houseDepth/2]) //треугольник крыши
            rotate([0,0,315])
                union() {
                    polygon([[0,0],[houseDepth/sqrt(2),0],[0,houseDepth/sqrt(2)]]);
                    translate ([houseDepth/sqrt(2) * 0.2, - wF]) square([pazWidth * 2, wF]);
                    translate ([houseDepth/sqrt(2) * 0.6, - wF]) square([pazWidth * 2, wF]);
                    
                    translate ([-wF, houseDepth/sqrt(2) * 0.2]) square([wF, pazWidth * 2]);
                    translate ([-wF, houseDepth/sqrt(2) * 0.6]) square([wF, pazWidth * 2]);
                }
            square([wallHeight, houseDepth], false); //прямоугольник стены
        }
        union() { //шипы
            translate([wallHeight - wF, 0]) { //соединение с основанием
                for( i = [pazWidth : pazWidth * 2 : houseDepth])
                        translate([0, i]) square([wF+1, pazWidth]);
            }
            for( i = [pazWidth : pazWidth * 2 : wallHeight - pazWidth - wF])
                translate([i, 0]) square([pazWidth, wF+1]);
        }
    }

//задняя стенка
    
}




        