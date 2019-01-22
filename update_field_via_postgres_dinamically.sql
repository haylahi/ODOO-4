
--AIM:  Res Partner have mobile field startswith "0", update those records "+61"
    
    update res_partner set mobile = ('+61' || right(mobile,-1)) where left(mobile,1) = '0';
