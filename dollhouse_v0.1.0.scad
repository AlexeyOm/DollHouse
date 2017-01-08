wF = 8;
pazWidth = 10;


hW = 500; //желательная ширина дома
hD = 150; //желательная глубина дома
hH = 900; //желательная высота стены дома

roofAddW = 15; //вылет крыши по ширине
roofAddD = 15; //вылет крыши по глубине

secondFloorH = 300; //высота второго этажа
thirdFloorH = 600; //высота третьего этажа

houseWidth = floor(hW / (2 * pazWidth)) * 2 * pazWidth + pazWidth + 2 * wF;
echo("<b>Ширина дома</b>", houseWidth);

houseDepth = floor(hD / (2 * pazWidth)) * 2 * pazWidth + pazWidth;
echo("<b>Глубина дома</b>", houseDepth);

wallHeight = floor(hH / (2 * pazWidth)) * 2 * pazWidth + wF;
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
            for( i = [0 : pazWidth * 2 : wallHeight - pazWidth - wF]) //соединение с задником
                translate([i, 0]) square([pazWidth, wF+1]);
        }
        union() {// отверстия для шипов второго этажа
            translate( [wallHeight - secondFloorH, houseDepth * 0.33]) square([wF, pazWidth * 2]);
            translate( [wallHeight - secondFloorH, houseDepth * 0.66]) square([wF, pazWidth * 2]);
        }
        union() {// отверстия для шипов третьего этажа
            translate( [wallHeight - thirdFloorH, houseDepth * 0.33]) square([wF, pazWidth * 2]);
            translate( [wallHeight - thirdFloorH, houseDepth * 0.66]) square([wF, pazWidth * 2]);
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
            for( i = [0 : pazWidth * 2 : wallHeight - pazWidth - wF]) //соединение с задником
                translate([i, 0]) square([pazWidth, wF+1]);
        }
        union() {// отверстия для шипов второго этажа
            translate( [wallHeight - secondFloorH, houseDepth * 0.33]) square([wF, pazWidth * 2]);
            translate( [wallHeight - secondFloorH, houseDepth * 0.66]) square([wF, pazWidth * 2]);
        }
        union() {// отверстия для шипов третьего этажа
            translate( [wallHeight - thirdFloorH, houseDepth * 0.33]) square([wF, pazWidth * 2]);
            translate( [wallHeight - thirdFloorH, houseDepth * 0.66]) square([wF, pazWidth * 2]);
        }
    }

    translate ([wallHeight + 1, -wallHeight -1]) //temp
    difference() {//задняя стенка
        union() {
            square([houseWidth, wallHeight]);
        }
        union() {
            translate([0, wallHeight - wF]) { // соединение с задней стенкой
                for( i = [wF  : pazWidth * 2 : houseWidth - pazWidth])
                    translate([i, 0]) square([pazWidth, wF]);
            }
            translate([0, 0]) { // соединение с правой стенкой
                for( i = [pazWidth : pazWidth * 2 : wallHeight - pazWidth - wF])
                    translate([0, i]) square([wF, pazWidth]);
            }
            translate([0, wallHeight - wF]) square([wF,wF]); //удаляем квадратик в углу, где сходятся все стенки
            
            translate([houseWidth - wF, 0]) { // соединение с левой стенкой
                for( i = [pazWidth : pazWidth * 2 : wallHeight - pazWidth - wF])
                    translate([0, i]) square([wF, pazWidth]);
                translate([0, wallHeight - wF]) square([wF,wF]); //удаляем квадратик в углу, где сходятся все стенки
            }
            
            // отверстия под шипы второго этажа
            translate( [houseWidth * 0.25, wallHeight - secondFloorH]) square([pazWidth * 2, wF]);
            translate( [houseWidth * 0.5, wallHeight - secondFloorH]) square([pazWidth * 2, wF]);
            translate( [houseWidth * 0.75, wallHeight - secondFloorH]) square([pazWidth * 2, wF]);
            
            // отверстия под шипы третьего этажа
            translate( [houseWidth * 0.25, wallHeight - thirdFloorH]) square([pazWidth * 2, wF]);
            translate( [houseWidth * 0.5, wallHeight - thirdFloorH]) square([pazWidth * 2, wF]);
            translate( [houseWidth * 0.75, wallHeight - thirdFloorH]) square([pazWidth * 2, wF]);
            
            
        }
    }
    
    translate([ -roofAddD, -houseWidth - 2 * roofAddW - 1]) { //задняя крыша
        //square([houseDepth/sqrt(2) + roofAddD, houseWidth + 2 * roofAddW]);
        difference() {        
                translate([0, -roofAddW]) square([houseDepth/sqrt(2) + roofAddD, houseWidth + 2 * roofAddW]);
                
            
        union() {
                translate ([houseDepth/sqrt(2) * 0.2, 0]) square([pazWidth * 2, wF]);
                translate ([houseDepth/sqrt(2) * 0.6, 0]) square([pazWidth * 2, wF]);
                
                translate ([houseDepth/sqrt(2) * 0.2, houseWidth - wF]) square([pazWidth * 2, wF]);
                translate ([houseDepth/sqrt(2) * 0.6, houseWidth - wF]) square([pazWidth * 2, wF]);
                
            }
        }
    }
    
    translate([ -roofAddD, houseDepth + roofAddW + 1]) { //передняя крыша
        //square([houseDepth/sqrt(2) + roofAddD, houseWidth + 2 * roofAddW]);
        difference() {        
                translate([-wF, -roofAddW]) square([houseDepth/sqrt(2) + roofAddD + wF, houseWidth + 2 * roofAddW]);
                
            
        union() {
                translate ([houseDepth/sqrt(2) * 0.2, 0]) square([pazWidth * 2, wF]);
                translate ([houseDepth/sqrt(2) * 0.6, 0]) square([pazWidth * 2, wF]);
                
                translate ([houseDepth/sqrt(2) * 0.2, houseWidth - wF]) square([pazWidth * 2, wF]);
                translate ([houseDepth/sqrt(2) * 0.6, houseWidth - wF]) square([pazWidth * 2, wF]);
                
            }
        }
    }
    
    translate([ wallHeight, houseDepth + 1]) { //пол второго этажа
        //square([houseDepth/sqrt(2) + roofAddD, houseWidth + 2 * roofAddW]);
        difference() {        
            union() {
                translate( [wF, wF]) square([houseWidth - 2 * wF , houseDepth - wF],false);
                translate( [houseWidth * 0.25, 0]) square([pazWidth * 2, wF]);
                translate( [houseWidth * 0.5, 0]) square([pazWidth * 2, wF]);
                translate( [houseWidth * 0.75, 0]) square([pazWidth * 2, wF]);
                
                translate( [0, houseDepth * 0.33]) square([wF, pazWidth * 2]);
                translate( [0, houseDepth * 0.66]) square([wF, pazWidth * 2]);
                
                translate( [houseWidth - wF, houseDepth * 0.33]) square([wF, pazWidth * 2]);
                translate( [houseWidth - wF, houseDepth * 0.66]) square([wF, pazWidth * 2]);
            }
            
            union() {

                
            }
        }
    }
    translate([ wallHeight, 2 * houseDepth + 2]) { //пол третьего этажа
        //square([houseDepth/sqrt(2) + roofAddD, houseWidth + 2 * roofAddW]);
        difference() {        
            union() {
                translate( [wF, wF]) square([houseWidth - 2 * wF , houseDepth - wF],false);
                translate( [houseWidth * 0.25, 0]) square([pazWidth * 2, wF]);
                translate( [houseWidth * 0.5, 0]) square([pazWidth * 2, wF]);
                translate( [houseWidth * 0.75, 0]) square([pazWidth * 2, wF]);
                
                translate( [0, houseDepth * 0.33]) square([wF, pazWidth * 2]);
                translate( [0, houseDepth * 0.66]) square([wF, pazWidth * 2]);
                
                translate( [houseWidth - wF, houseDepth * 0.33]) square([wF, pazWidth * 2]);
                translate( [houseWidth - wF, houseDepth * 0.66]) square([wF, pazWidth * 2]);
            }
            
            union() {

                
            }
        }
    }    
    



}




        