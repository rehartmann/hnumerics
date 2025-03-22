generic
   type Real is digits <>;
package Hnumerics.Generic_Dual_Types is
   pragma Pure (Generic_Dual_Types);

   type Dual is
      record
         Re, Du : Real'Base;
      end record;

   Epsilon : constant Dual;

   function Re (X : Dual) return Real'Base;
   function Du (X : Dual) return Real'Base;

   procedure Set_Re (X  : in out Dual;
                     Re :        Real'Base);
   procedure Set_Du (X  : in out Dual;
                     Du :        Real'Base);

   function Compose_From_Cartesian (Re, Du : Real'Base) return Dual;
   function Compose_From_Cartesian (Re     : Real'Base) return Dual;

   function Modulus (X : Dual)     return Real'Base;
   function "abs"   (Right : Dual) return Real'Base renames Modulus;

   function "-"       (X : Dual) return Dual;
   function Conjugate (X : Dual) return Dual;

   function "+" (Left, Right : Dual) return Dual;
   function "-" (Left, Right : Dual) return Dual;
   function "*" (Left, Right : Dual) return Dual;
   function "/" (Left, Right : Dual) return Dual;

   function "+" (Left : Real'Base; Right : Dual)      return Dual;
   function "+" (Left : Dual;      Right : Real'Base) return Dual;
   function "-" (Left : Real'Base; Right : Dual)      return Dual;
   function "-" (Left : Dual;      Right : Real'Base) return Dual;
   function "*" (Left : Dual;      Right : Real'Base) return Dual;
   function "*" (Left : Real'Base; Right : Dual)      return Dual;
   function "/" (Left : Dual;      Right : Real'Base) return Dual;
   function "/" (Left : Real'Base; Right : Dual)      return Dual;

private

   Epsilon : constant Dual := (Re => 0.0, Du => 1.0);

end Hnumerics.Generic_Dual_Types;
