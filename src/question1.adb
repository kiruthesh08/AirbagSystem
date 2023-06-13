pragma SPARK_Mode;

package body Question1 is

   procedure ECU ( accelerationSpeed, collisionAngle, carTemperature: in Integer; deploy: out Integer ) is
   begin
      if carTemperature >= 150 then
         deploy := 0;        --deploy all airbags if temperature is higher then the limit 150 degrees 
      elsif accelerationSpeed >= 23 then   --if delecration of speed after collision is more then the limit then check collision angle
         
         if collisionAngle >= 0 and collisionAngle <= 50 then   -- changing values to 360 clockwise point from the cars centre, so no minus values. or change range to include minu
            deploy := 1;         -- deploy left airbags
         elsif collisionAngle >= 50 and collisionAngle <= 75 then
            deploy := 2;         -- deploy left and front airbags
         elsif collisionAngle >= 75 and collisionAngle <= 105 then
            deploy := 3;         -- deploy front airbags
         elsif collisionAngle > 105 and collisionAngle <= 130 then
            deploy := 4;         -- deploy front and right airbags
         elsif collisionAngle > 130 and collisionAngle <= 180 then
           deploy := 5;         -- deploy right airbags
         else
            deploy := -1;        --dont deploy
         end if;
         
      else
         deploy := -1;        --dont deploy
      end if;
      
   end ECU;

end Question1;

-- look at question 1 angle values 

