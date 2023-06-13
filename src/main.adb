pragma SPARK_Mode (On);
with AS_Io_Wrapper; use AS_Io_Wrapper;
with Question1; use Question1;

procedure Main is
   speed : Integer;      --variable to store speed i.e 23km/h
   collisionAngle    : Integer;  --variable to store collision angle
   carTemperature    : Integer;    --variable to store car temperature
   deploy            : Integer;  -- action ... deploy air bagof specific side  or dont deploy
   User_Input_Continue : String (1..10);		--variable to store user's wish. if he wanna continue or not
   Last: Integer;		-- variable just to pass it to AS library get string, its of no use
begin
   loop

      --asking parameters from user
      AS_Put_Line("Enter speed as integer in km/h i.e 22):");
      loop
         AS_Get( speed, "Please type a valid speed; try again:");		--getting input from user
         exit when speed<Integer'Last;
         AS_Put_Line ("Invalid! Number, please try again:");	-- ask again if entery is invalid
      end loop;

      AS_Put_Line("Enter collision angle (0 <= 75 left side, 75 <= 105 front side, 105 <= 180 is right):");
      loop
         AS_Get( collisionAngle, "Please type a valid collision angle; try again:");		--getting input from user
         exit when collisionAngle in 0..180;
         AS_Put_Line ("Invalid! angle, please try again (0 to 360):");	-- ask again if entry is invalid
      end loop;

      AS_Put_Line("Enter car temperature(i.e 100):");
      loop
         AS_Get( carTemperature, "Please type a valid car temperature; try again:");		--getting input from user
         exit when carTemperature<Integer'Last;
         AS_Put_Line ("Invalid! temperature, please try again:");	-- ask again if entery is invalid
      end loop;

      --Electronic Controller Unit... which detects if we have to deploy airbag or not. If yes, then of which side depending on angle
      ECU(speed, collisionAngle, carTemperature, deploy);

      AS_Put("Action: ");
      if deploy=0 then
         AS_Put_Line("deploy all airbags");    --deploy all airbags as temperature is high
      elsif deploy=1 then
         AS_Put_Line("deploy left airbags");    -- collision from left with speed more then minimum
      elsif deploy=2 then
         AS_Put_Line("deploy left & front airbags");    -- collision from front-left corner with speed more then minimum
      elsif deploy=3 then
         AS_Put_Line("deploy front airbags");    -- collision from front with speed more then minimum
      elsif deploy=4 then
         AS_Put_Line("deploy front & right airbags");    -- collision from front-right corner with speed more then minimum
      elsif deploy=5 then
         AS_Put_Line("deploy right airbags");    -- collision from right with s[eed more then minimum
      else
         AS_Put_Line("no deploy");    -- dont deploy
      end if;

      loop		-- asking user if he wanna continue, and keep asking if he enters invalid entery
         AS_Put_Line ("Continue with another <y/n>:");
         AS_Get_Line(User_Input_Continue,Last);
         exit when (User_Input_Continue (1..1) = "y" or User_Input_Continue (1..1)= "n" or User_Input_Continue (1..1)= "Y" or User_Input_Continue (1..1)= "N") and Last>0;
         AS_Put_Line ("Invalid! Option");
      end loop;

      --if yes keep the loop running , if No .. terminate the loop and exit.
      exit when User_Input_Continue (1..1) = "n" or User_Input_Continue (1..1)= "N";
      AS_Put_Line("");		--inserting 1 line space after each cycle.
   end loop;
end Main;
