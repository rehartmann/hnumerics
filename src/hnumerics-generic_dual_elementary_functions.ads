with Hnumerics.Generic_Dual_Types;
generic
   with package Dual_Types is
         new Hnumerics.Generic_Dual_Types (<>);
   use Dual_Types;
package Hnumerics.Generic_Dual_Elementary_Functions is
   pragma Pure (Generic_Dual_Elementary_Functions);

   function Sqrt (X : Dual) return Dual;
   function Log  (X : Dual) return Dual;
   function Exp  (X : Dual) return Dual;
   function "**" (Left : Dual;      Right : Dual)      return Dual;
   function "**" (Left : Dual;      Right : Real'Base) return Dual;
   function "**" (Left : Real'Base; Right : Dual)      return Dual;

   function Sin (X : Dual) return Dual;
   function Cos (X : Dual) return Dual;
   function Tan (X : Dual) return Dual;
   function Cot (X : Dual) return Dual;

   function Arcsin (X : Dual) return Dual;
   function Arccos (X : Dual) return Dual;
   function Arctan (X : Dual) return Dual;
   function Arccot (X : Dual) return Dual;

   function Sinh (X : Dual) return Dual;
   function Cosh (X : Dual) return Dual;
   function Tanh (X : Dual) return Dual;
   function Coth (X : Dual) return Dual;

   function Arcsinh (X : Dual) return Dual;
   function Arccosh (X : Dual) return Dual;
   function Arctanh (X : Dual) return Dual;
   function Arccoth (X : Dual) return Dual;

end Hnumerics.Generic_Dual_Elementary_Functions;
