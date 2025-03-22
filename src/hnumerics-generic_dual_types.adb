package body Hnumerics.Generic_Dual_Types is

   function Re (X : Dual) return Real'Base is
   begin
      return X.Re;
   end Re;

   function Du (X : Dual) return Real'Base is
   begin
      return X.Du;
   end Du;

   procedure Set_Re (X  : in out Dual;
                     Re :        Real'Base) is
   begin
      X.Re := Re;
   end Set_Re;

   procedure Set_Du (X  : in out Dual;
                     Du :        Real'Base) is
   begin
      X.Du := Du;
   end Set_Du;

   function Compose_From_Cartesian (Re, Du : Real'Base) return Dual is
   begin
      return (Re => Re, Du => Du);
   end Compose_From_Cartesian;

   function Compose_From_Cartesian (Re     : Real'Base) return Dual is
   begin
      return (Re => Re, Du => 0.0);
   end Compose_From_Cartesian;

   function Modulus (X : Dual) return Real'Base is
   begin
      return abs (X.Re);
   end Modulus;

   function "-" (X : Dual) return Dual is
   begin
      return (Re => -X.Re, Du => -X.Du);
   end "-";

   function Conjugate (X : Dual) return Dual is
   begin
      return (Re => X.Re, Du => -X.Du);
   end Conjugate;

   function "+" (Left, Right : Dual) return Dual is
   begin
      return (Left.Re + Right.Re, Left.Du + Right.Du);
   end "+";

   function "+" (Left : Dual;   Right : Real'Base) return Dual is
   begin
      return (Left.Re + Right, Left.Du);
   end "+";

   function "+" (Left : Real'Base; Right : Dual) return Dual is
   begin
      return (Left + Right.Re, Right.Du);
   end "+";

   function "-" (Left, Right : Dual) return Dual is
   begin
      return (Left.Re - Right.Re, Left.Du - Right.Du);
   end "-";

   function "-" (Left : Real'Base; Right : Dual) return Dual is
   begin
      return (Left - Right.Re, -Right.Du);
   end "-";

   function "-" (Left : Dual; Right : Real'Base) return Dual is
   begin
      return (Left.Re - Right, Left.Du);
   end "-";

   function "*" (Left, Right : Dual) return Dual is
   begin
      return (Left.Re * Right.Re,
              Left.Re * Right.Du + Left.Du * Right.Re);
   end "*";

   function "*" (Left : Dual; Right : Real'Base) return Dual is
   begin
      return (Left.Re * Right,
              Left.Du * Right);
   end "*";

   function "*" (Left : Real'Base; Right : Dual) return Dual is
   begin
      return Right * Left;
   end "*";

   function "/" (Left, Right : Dual) return Dual is
   begin
      return (Left.Re / Right.Re,
              (Left.Du * Right.Re - Left.Re * Right.Du)
               / (Right.Re * Right.Re));
   end "/";

   function "/" (Left : Dual; Right : Real'Base) return Dual is
   begin
      return (Left.Re / Right,
              Left.Du / Right);
   end "/";

   function "/" (Left : Real'Base; Right : Dual) return Dual is
   begin
      return (Left / Right.Re,
              (-Left * Right.Du) / (Right.Re * Right.Re));
   end "/";

end Hnumerics.Generic_Dual_Types;
