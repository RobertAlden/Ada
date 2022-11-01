with ADA.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;
procedure random_numbers is
	function Random_Value (F : Float) return Float is
		subtype Random_Float_Range is Float range 0.0 .. F;
		G : Ada.Numerics.Float_Random.Generator;
		X : Random_Float_Range;
	begin
		Ada.Numerics.Float_Random.Reset(G);
		X := Ada.Numerics.Float_Random.Random(G);
		return X;
	end Random_Value;
	random_float : Float := Random_Value(10.0);
begin
	for i in 1 .. 10 loop
		random_float := Random_Value(10.0);
		Put_Line("Output:" & Float'Image(random_float));
	end loop;
end random_numbers;