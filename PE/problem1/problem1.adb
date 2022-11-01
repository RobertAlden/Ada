with ADA.Text_IO; use Ada.Text_IO;
procedure problem1 is
sum: Long_Integer := 0;
begin
	for i in 1 .. 999999 loop
		if (i mod 3 = 0) or (i mod 5 = 0) then
			sum := sum + Long_Integer(i);
		end if;
	end loop;
	Put_Line("Sum is" & Long_Integer'Image(sum));
end problem1;