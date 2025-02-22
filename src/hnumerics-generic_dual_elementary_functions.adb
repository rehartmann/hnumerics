with Ada.Numerics;
with Ada.Numerics.Generic_Elementary_Functions;

package body Hnumerics.Generic_Dual_Elementary_Functions is

   package Real_Elementary_Functions is new
     Ada.Numerics.Generic_Elementary_Functions (Dual_Types.Real'Base);
   use Real_Elementary_Functions;

   function Sqrt (X : Dual) return Dual is
   begin
      if X.Du = 0.0 then
         return (Re => Sqrt (X.Re), Du => 0.0);
      elsif X.Re <= 0.0 then
         raise Ada.Numerics.Argument_Error
           with "real part of argument must be positive but is " & X.Re'Image;
      end if;
      declare
         R : constant Real'Base := Sqrt (X.Re);
      begin
         return (Re => R, Du => X.Du / (2.0 * R));
      end;
   end Sqrt;

   function Log (X : Dual) return Dual is
   begin
      return (Re => Log (X.Re),
              Du => X.Du / X.Re);
   end Log;

   function Exp (X : Dual) return Dual is
      R : constant Real'Base := Exp (X.Re);
   begin
      return (Re => R, Du => R * X.Du);
   end Exp;

   function "**" (Left : Dual; Right : Dual) return Dual is
   begin
      if Left.Du = 0.0 and then Right.Du = 0.0 then
         return (Re => Left.Re ** Right.Re, Du => 0.0);
      end if;
      return Exp (Right * Log (Left));
   end "**";

   function "**" (Left : Dual; Right : Real'Base) return Dual is
   begin
      return Left ** (Re => Right, Du => 0.0);
   end "**";

   function "**" (Left : Real'Base; Right : Dual) return Dual is
   begin
      return (Re => Left, Du => 0.0) ** Right;
   end "**";

   --
   --  Trigonometric functions
   --

   function Sin (X : Dual) return Dual is
   begin
      return (Sin (X.Re), Cos (X.Re) * X.Du);
   end Sin;

   function Cos (X : Dual) return Dual is
   begin
      return (Cos (X.Re), -Sin (X.Re) * X.Du);
   end Cos;

   function Tan (X : Dual) return Dual is
      S : constant Real'Base := Sin (X.Re);
      C : constant Real'Base := Cos (X.Re);
   begin
      return (S, C * X.Du) / (C, -S * X.Du);
   end Tan;

   function Cot (X : Dual) return Dual is
      S : constant Real'Base := Sin (X.Re);
      C : constant Real'Base := Cos (X.Re);
   begin
      return (C, -S * X.Du) / (S, C * X.Du);
   end Cot;

   function Arctan (X : Dual) return Dual is
   begin
      return (Re => Arctan (X.Re),
              Du => X.Du / (1.0 + X.Re * X.Re));
   end Arctan;

   function Arccot (X : Dual) return Dual is
   begin
      return Ada.Numerics.Pi * 0.5 - Arctan (X);
   end Arccot;

   function Arcsin (X : Dual) return Dual is
   begin
      return 2.0 * Arctan (X / (1.0 + Sqrt (1.0 - X * X)));
   end Arcsin;

   function Arccos (X : Dual) return Dual is
   begin
      return Ada.Numerics.Pi * 0.5 - Arcsin (X);
   end Arccos;

   --
   --  Hyperbolic functions
   --

   function Sinh (X : Dual) return Dual is
   begin
      return (Exp (X) - Exp (-X)) * 0.5;
   end Sinh;

   function Cosh (X : Dual) return Dual is
   begin
      return (Exp (X) + Exp (-X)) * 0.5;
   end Cosh;

   function Tanh (X : Dual) return Dual is
   begin
      return 1.0 - (2.0 / (Exp (2.0 * X) + 1.0));
   end Tanh;

   function Coth (X : Dual) return Dual is
   begin
      return 1.0 + (2.0 / (Exp (2.0 * X) - 1.0));
   end Coth;

   function Arcsinh (X : Dual) return Dual is
   begin
      return Log (X + Sqrt (X * X + 1.0));
   end Arcsinh;

   function Arccosh (X : Dual) return Dual is
   begin
      return Log (X + Sqrt (X * X - 1.0));
   end Arccosh;

   function Arctanh (X : Dual) return Dual is
   begin
      return 0.5 * Log ((1.0 + X) / (1.0 - X));
   end Arctanh;

   function Arccoth (X : Dual) return Dual is
   begin
      return 0.5 * Log ((X + 1.0) / (X - 1.0));
   end Arccoth;

end Hnumerics.Generic_Dual_Elementary_Functions;
