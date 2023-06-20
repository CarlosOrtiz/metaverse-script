default
{
    state_entry()
    {
         llSetText("MAX30102", <1.0, 1.0, 1.0>, 1.0);  
    }
        
    touch_start(integer total_number)
    {
        vector axis = <0.0, 0.0, 1.0>; 
        float speed = 1;        

        llTargetOmega(axis, speed, 1.0);
    }
}