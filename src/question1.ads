pragma SPARK_Mode;

package Question1 is

         --Electronic Controller Unit... which detects if we have to deploy airbag or not. If yes, then of which side depending on angle
   procedure ECU ( accelerationSpeed, collisionAngle, carTemperature: in Integer; deploy: out Integer )with 
     Depends => (deploy => (carTemperature, accelerationSpeed, collisionAngle)), --- depends clause 
     Post => (if (accelerationSpeed<23 and carTemperature<=150) then deploy=-1) --no deploy
     and (if carTemperature>150 then deploy=0)    -- all deploy
     and (if (accelerationSpeed>=23 and carTemperature<150 and collisionAngle>= 0 and collisionAngle<=50) then deploy=1)  --left deploy
     and (if (accelerationSpeed>=23 and carTemperature<150 and collisionAngle>=50 and collisionAngle<=75) then deploy=2)  --left & front deploy
     and (if (accelerationSpeed>=23 and carTemperature<150 and collisionAngle>=75 and collisionAngle<=105) then deploy=3)  --front deploy
     and (if (accelerationSpeed>=23 and carTemperature<150 and collisionAngle>105 and collisionAngle<=130) then deploy=4)   --front &right deploy
     and (if (accelerationSpeed>=23 and carTemperature<150 and collisionAngle>130 and collisionAngle<=180) then deploy=5)   --right deploy
;
end Question1;    





--pragma SPARK_Mode;

--package Question1 is

         --Electronic Controller Unit... which detects if we have to deploy airbag or not. If yes, then of which side depending on angle
  -- procedure ECU ( accelerationSpeed, collisionAngle, carTemperature: in Integer; deploy: out Integer )with 
  --   Depends => (deploy => (carTemperature, decelerationSpeed, collisionAngle)),
    -- Post => deploy>=-1 or deploy<=5;
--end Question1;

