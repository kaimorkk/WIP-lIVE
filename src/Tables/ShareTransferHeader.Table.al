// Table 52193436 "Share Transfer Header"
// {
//     DrillDownPageID = "Offsetting List";
//     LookupPageID = "Offsetting List";

//     fields
//     {
//         field(1;"No.";Code[20])
//         {

//             trigger OnValidate()
//             begin
//                 if "No." <> xRec."No." then begin
//                   BosaSetup.Get;
//                   NoSeriesMgt.TestManual(BosaSetup."Share Transfer No.");
//                   "No. Series" := '';
//                 end;
//             end;
//         }
//         field(2;Date;Date)
//         {
//             Editable = false;
//         }
//         field(4;"User ID";Code[70])
//         {
//         }
//         field(5;"No. Series";Code[20])
//         {
//         }
//         field(6;Posted;Boolean)
//         {
//             Editable = false;
//         }
//         field(7;Description;Text[100])
//         {
//         }
//     }

//     keys
//     {
//         key(Key1;"No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnInsert()
//     begin
//         if "No." = '' then begin
//           BosaSetup.Get;
//           BosaSetup.TestField("Share Transfer No.");
//           NoSeriesMgt.InitSeries(BosaSetup."Share Transfer No.",xRec."No. Series",0D,"No.","No. Series");
//         end;
//           if UserSetup.Get(UserId) then begin
//           "User ID":=UserSetup."User ID";
//           end;

//         Date:=Today;
//     end;

//     var
//         BosaSetup: Record "Bosa Setup";
//         UserSetup: Record "User Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         Cust: Record Customer;
//         MonContrib: Record "Monthly Contributions";
//         OffsetContrib: Record "Share Transfer Lines";
//         BosaProd: Record "Bosa Products";
//         OffsetLoan: Record "Offsetting Loans";
//         LoanRec: Record Loans;
//         Amnt: Decimal;
//         LineNo: Integer;
//         MonContribx: Record "Monthly Contributions";
//         TotalLoanAmnt: Decimal;
//         AmntShared: Decimal;
//         LoanRecx: Record Loans;
// }

