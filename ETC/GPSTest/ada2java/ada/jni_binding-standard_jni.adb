-------------------------------------------------------------------------------
-- This file has been automatically generated by                             --
--    ADA2JAVA (built with ASIS 2.0.R for GNAT Pro 17.0 (20161010))          --
-- Original Ada unit: Standard                                               --
-- Generation timestamp: 202202111029                                        --
-------------------------------------------------------------------------------

pragma Warnings (Off);
pragma Style_Checks ("NM32766");

with Ada.Unchecked_Deallocation;
with System.Address_To_Access_Conversions;
with Ada.Unchecked_Conversion;
with Ada.Tags;
with Ada.Exceptions;
with Interfaces.C;
with Interfaces.C.Strings;
with System.Address_To_Access_Conversions;

package body JNI_Binding.Standard_JNI is 

   procedure JNI_For_Body_Elaboration is begin null; end;

   procedure Initialize_Unit_JNI (Id_JNI_1 : Interfaces.Java.JNI.JNI_Env_Access) is
   begin

      null;
   end Initialize_Unit_JNI;

   package body Id_JNI_43 is

      package Array_Serialization is new AJIS.Internal.Java.Serialization (Object_Pointer);

      function Create_General_Encapsulation
        (V : Array_Pointer) return Object_Pointer is
      begin
         if V = null then
            return Null_Pointer;
         else
            return
              (AJIS.Internal.Java.General_Access, V'First, V'Last,  V);
         end if;
      end Create_General_Encapsulation;
      
      function Create_Constant_Encapsulation
        (V : Array_Pointer_Cst) return Object_Pointer is
      begin
         if V = null then
            return Null_Pointer;
         else
            return
              (AJIS.Internal.Java.Constant_Access, V'First, V'Last,  V);
         end if;
      end Create_Constant_Encapsulation;

      function Get_Address (V : Object_Pointer) return System.Address is
      begin
         case V.Kind is
            when AJIS.Internal.Java.Static =>
               return V.Addr;

            when AJIS.Internal.Java.General_Access =>
               if V.General_Pointer = null then
                  return System.Null_Address;
               else
                  return V.General_Pointer.all'Address;
               end if;

            when AJIS.Internal.Java.Constant_Access =>
               if V.Constant_Pointer = null then
                  return System.Null_Address;
               else
                  return V.Constant_Pointer.all'Address;
               end if;

         end case;
      end Get_Address;

      function To_J_Int_J_Array
        (Env : Interfaces.Java.JNI.JNI_Env_Access;
         Obj : Object_Pointer)
         return Interfaces.Java.JNI.J_Int_J_Array is
      begin
         if Obj = Null_Pointer then
            declare
               Result : Interfaces.Java.JNI.J_Int_J_Array;
            begin
               Result := Interfaces.Java.JNI.New_Int_Array (Env, 1);
               AJIS.Internal.Java.Set_Values (Env, Result, (1 => 0));

               return Result;
            end;
         else
            return Array_Serialization.To_J_Int_J_Array (Env, Obj);
         end if;
      end To_J_Int_J_Array;

      function To_Object_Pointer
        (Env : Interfaces.Java.JNI.JNI_Env_Access;
         Obj : Interfaces.Java.JNI.J_Int_J_Array)
         return Object_Pointer
      is
         Vals : Interfaces.Java.JNI.J_Int_Array :=
           AJIS.Internal.Java.Get_Values (Env, Obj);
      begin
         for J in Vals'Range loop
            if Interfaces.Java.JNI."/=" (Vals (J), 0) then
               return Array_Serialization.To_Object_Type (Env, Obj);
            end if;
         end loop;

         return Null_Pointer;
      end To_Object_Pointer;

   end Id_JNI_43;


begin
   null;
end JNI_Binding.Standard_JNI;
