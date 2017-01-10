wF = 8;
wPaz = 10;

houseWidth = 1000;
houseHeight = 1100;
houseDepth = 300;


difference() {
    square([1000, 300], false);
    {
        translate([0,-1]) square([wF, 2]);
        for(step=[0:wPaz*2:1000]) {
            translate([0-1,step]) square([wF+1, 10], false);
        }
    }
    translate([1000-wF,0]) {
    translate([0, -1]) square([wF, 2]);  //убираем пустую стенку
    for(paz=[0:20:1000]) {
            translate([0,paz]) square([wF+1, 10], false);
        }
    }
    translate([wF*2, wF]) 
    {
        rotate([0,0,270]) for(paz=[0:20:1000]) {
            translate([0,paz]) square([wF+1, 10], false);
        }
    }
}

color("red")
translate([-houseHeight - 5,0]){

difference() {
    
    union()
    {
        square([houseHeight, 300], false);
        translate([-houseDepth/2,houseDepth/2]) //треугольник крыши
            rotate([0,0,315])
                polygon([[0,0],[houseDepth/sqrt(2),0],[0,houseDepth/sqrt(2)]]);

    }
    /* верхняя гребенка 
    {
        translate([0,-1]) square([wF, 2]);
        for(step=[wF - wPaz : wPaz*2 : houseDepth - wPaz]) {
            translate([0-1,step]) square([wF+1, wPaz], false);
        }
    }
    */
    translate([houseHeight-wF,0]) {
        translate([0, houseDepth-1]) square([wF, 2]);  //убираем пустую стенку
        for(step=[10:20:houseDepth]) {
            translate([0,step]) square([wF+1, wPaz], false);
        }
    }
    translate([-2*wF, wF]) 
    {
        rotate([0,0,270]) for(paz=[0:20:houseHeight - wPaz]) {
            translate([0,paz]) square([wF+1, wPaz], false);
        }
    }
    
}
}

color("green")
translate([houseWidth + 10, 0])
difference() {
    union(){
        translate([houseHeight + houseDepth/2,houseDepth/2]) //треугольник крыши
            rotate([0,0,135])
                polygon([[0,0],[houseDepth/sqrt(2),0],[0,houseDepth/sqrt(2)]]);
        square([houseHeight, houseDepth], false);
    }
    
    
    {
        translate([0,houseDepth-1]) square([wF, 2]);
        for(step=[wPaz : wPaz*2 : houseDepth]) {
            translate([0-1,step]) square([wF+1, wPaz], false);
        }
    }
    
    /*
    translate([houseHeight-wF,0]) {
    for(step=[10:20:houseDepth - wPaz*2]) {
            translate([0,step]) square([wF+1, wPaz], false);
        }
    }
    */
    translate([-2*wF, wF]) 
    {
        rotate([0,0,270]) for(paz=[wPaz *3 : 20 : houseHeight - wPaz]) {
            translate([0,paz]) square([wF+1, wPaz], false);
        }
    }
    
}

//задняя стенка
translate([0, -houseHeight - 5])
difference(){
    union() { //прямоугольник стенки
        square([houseWidth, houseHeight]);
    }
    union() { //гребни
            
        translate([0,houseDepth-1]) square([wF, 2]);
        for(step=[wPaz : wPaz*2 : houseDepth]) {
            translate([0-1,step]) square([wF+1, wPaz], false);
        
        }
        translate([0,houseHeight-wF])
        for(paz=[wF + wPaz : 20 : houseHeight - wPaz]) {
            translate([paz,0]) square([wF+1, wPaz], false);
            }
    }
    
}


