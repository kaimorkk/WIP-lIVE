// // Table 80269 "Cross Cutting Setup"
// {
//     //DrillDownPageID = UnknownPage90449;
//     //LookupPageID = UnknownPage90449;

//     fields
//     {
//         field(1;"Code";Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(2;Name;Text[2048])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(3;Division;Text[50])
//         {
//             DataClassification = ToBeClassified;
//             //TableRelation = "Responsibility Center".Code where (Test=const(1));
//         }
//         field(4;Department;Text[50])
//         {
//             DataClassification = ToBeClassified;
//             //TableRelation = "Responsibility Center".Code where (Test=const(2));
//         }
//     }

//     keys
//     {
//         key(Key1;"Code")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnInsert()
//     begin
//         CrossCuttingSetup.Reset;
//         CrossCuttingSetup.SetRange(Code,Code);
//         if CrossCuttingSetup.FindLast then
//          // Code:='01'
//         //ELSE
//           Code:=IncStr(CrossCuttingSetup.Code);
//           Validate(Code);
//     end;

//     var
//         CrossCuttingSetup: Record "Cross Cutting Setup";
// }

