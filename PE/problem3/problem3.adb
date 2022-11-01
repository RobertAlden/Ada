with ADA.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Unchecked_Deallocation;
procedure problem3 is
	type LL_Int;
	type LL_access is access LL_Int;
	type LL_Int is
		record
			Value : Long_Integer;
			Next : LL_access;
		end record;

	procedure Delete_LL_Int is new Ada.Unchecked_Deallocation(LL_Int, LL_access);

	First : LL_access;
	Last : LL_access;
	Count : Natural := 0;

	procedure add_node(I : Long_Integer) is
		t : LL_access;
	begin
		t := new LL_Int;
		t.Value := I;

		if First = null then
			First := t;
			Last := t;
		else
			Last.Next := t;
			Last := t;
		end if;
		Count := Count + 1;
	end add_node;

	procedure remove_node(Ind : Integer) is
		current : LL_access;
		joined : LL_access;
		to_delete : LL_access;
		c : Integer := 0;
	begin
		current := First;
		if Ind = 0 then
			to_delete := current;
			First := current.Next;
		else
			while current /= null and c /= Ind - 1 loop
				current := current.Next;
				c := c + 1;
			end loop;
		end if;
		if current /= null then
			joined := current;
			joined := joined.Next;
			to_delete := joined;
			if joined.Next /= null then
				joined := joined.Next;
				current.Next := joined;
			else
				current.Next := null;
			end if;
		end if;
		-- TODO: Free to_delete's memory currently cause memory leak
		if to_delete /= null then
			Delete_LL_Int(to_delete);
			Count := Count - 1;
		end if;


	end remove_node;

	procedure print is
		current : LL_access;
	begin
		current := First;
		while current /= null loop
			Put(Long_Integer'Image(current.Value) & "");
			current := current.Next;
		end loop;
		New_Line;
	end print;

	X : Long_Integer := 600851475143;
	Limit : Integer := Integer(Sqrt(Float(X))) + 1;
	primes : array(2..Limit) of Boolean := (others => TRUE);
	k : Integer;
	R : Long_Integer := X;
	Result : Long_Integer := 0;

begin
	for i in primes'First .. primes'Last-1 loop
		if primes(i) = TRUE then
			k := i + i;
			loop
				exit when k >= primes'Last;
					primes(k) := FALSE;
				k := k + i;
			end loop;
		end if;
	end loop;

	while R > 1 loop
		for i in primes'First .. primes'Last-1 loop
			if primes(i) = TRUE then
				if R mod Long_Integer(i) = 0 then
					R := R / Long_Integer(i);
					add_node(Long_Integer(i));
				end if;
			end if;
		end loop;
	end loop;
	print;
end problem3;