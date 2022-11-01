with ADA.Text_IO; use Ada.Text_IO;
procedure problem2 is
	a : Long_Integer := 0;
	b : Long_Integer := 1;
	c : Long_Integer := 0;
	sum : Long_Integer := 0;
begin
	while c < 4000000 loop
		a := b;
		b := c;
		c := a + b;
		if c mod 2 = 0 then
			sum := sum + c;
		end if;
	end loop;
	Put_Line("Output:" & Long_Integer'Image(sum));
end problem2;