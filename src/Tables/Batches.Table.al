// Table 52193479 Batches
// {
//     DrillDownPageID = "Batches - List";
//     LookupPageID = "Batches - List";

//     fields
//     {
//         field(1; "Batch No."; Code[20])
//         {
//             NotBlank = false;

//             trigger OnValidate()
//             begin
//                 if "Batch No." <> xRec."Batch No." then begin
//                     SalesSetup.Get;
//                     NoSeriesMgt.TestManual(SalesSetup."Loans Batch Nos");
//                     "No. Series" := '';
//                 end;
//             end;
//         }
//         field(2; "Description/Remarks"; Text[30])
//         {
//         }
//         field(3; Posted; Boolean)
//         {
//         }
//         field(4; Status; Code[10])
//         {
//         }
//         field(5; "Date Created"; Date)
//         {
//         }
//         field(6; "Posting Date"; Date)
//         {
//         }
//         field(7; "Posted By"; Code[20])
//         {
//         }
//         field(8; "Prepared By"; Code[20])
//         {
//         }
//         field(9; Date; Date)
//         {
//         }
//         field(10; "Mode Of Disbursement"; Option)
//         {
//             OptionCaption = ' ,Transfer to FOSA,Cheque,Individual Cheques';
//             OptionMembers = " ","Transfer to FOSA",Cheque,"Individual Cheques";
//         }
//         field(11; "Document No."; Code[20])
//         {
//         }
//         field(12; "BOSA Bank Account"; Code[20])
//         {
//             TableRelation = "Bank Account"."No.";
//         }
//         field(13; "No. Series"; Code[10])
//         {
//             Caption = 'No. Series';
//             Editable = false;
//             TableRelation = "No. Series";
//         }
//         field(14; "Approvals Remarks"; Text[150])
//         {
//         }
//         field(15; "Total Loan Amount"; Decimal)
//         {
//             // CalcFormula = sum(Loans."Approved Amount" where ("Batch No."=field("Batch No."),
//             // "Loan Status" =filter(<>"Credit Committee"),
//             // Source =const(BOSA)));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(16; "Currect Location"; Code[50])
//         {
//             CalcFormula = max("Movement Tracker".Station where("Document No." = field("Batch No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(17; "Cheque No."; Code[20])
//         {
//         }
//         field(18; "Batch Type"; Option)
//         {
//             OptionMembers = Loans,Refunds,"Funeral Expenses","Withdrawals - Resignation","Withdrawals - Death","Branch Loans","FOSA Loans","Micro Loans";

//             trigger OnValidate()
//             begin
//                 EntryNo := 0;
//                 MovementTracker.Reset;
//                 if MovementTracker.Find('+') then
//                     EntryNo := MovementTracker."Entry No.";

//                 EntryNo := EntryNo + 1;

//                 MovementTracker.Reset;
//                 MovementTracker.SetRange(MovementTracker."Document No.", "Batch No.");
//                 if MovementTracker.Find('-') then begin
//                     if MovementTracker.Count > 1 then begin
//                         if Confirm('Are you sure you want to change the batch type. This will move back the batch to the first stage.') = false then
//                             exit;

//                     end;
//                     MovementTracker.DeleteAll;
//                 end;



//                 ApprovalsSetup.Reset;
//                 ApprovalsSetup.SetRange(ApprovalsSetup."Approval Type", "Batch Type");
//                 if ApprovalsSetup.Find('-') then begin
//                     MovementTracker.Init;
//                     MovementTracker."Entry No." := EntryNo;
//                     MovementTracker."Document No." := "Batch No.";
//                     MovementTracker."Approval Type" := ApprovalsSetup."Approval Type";
//                     MovementTracker.Stage := ApprovalsSetup.Stage;
//                     MovementTracker."Current Location" := true;
//                     MovementTracker.Status := MovementTracker.Status::"Being Processed";
//                     MovementTracker.Description := ApprovalsSetup.Description;
//                     MovementTracker.Station := ApprovalsSetup.Station;
//                     MovementTracker."Date/Time In" := CreateDatetime(Today, Time);
//                     MovementTracker.Insert(true);
//                 end;
//             end;
//         }
//         field(19; "Special Advance Posted"; Boolean)
//         {
//         }
//         field(20; "FOSA Bank Account"; Code[20])
//         {
//             TableRelation = "Bank Account"."No.";
//         }
//     }

//     keys
//     {
//         key(Key1; "Batch No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnDelete()
//     begin
//         if Posted = true then
//             Error('You can not delete a posted batch.');
//     end;

//     trigger OnInsert()
//     begin
//         if "Batch No." = '' then begin
//             SalesSetup.Get();
//             SalesSetup.TestField(SalesSetup."Loans Batch Nos");
//             NoSeriesMgt.InitSeries(SalesSetup."Loans Batch Nos", xRec."No. Series", 0D, "Batch No.", "No. Series");

//         end;

//         ApprovalsSetup.Reset;
//         ApprovalsSetup.SetRange(ApprovalsSetup."Approval Type", "Batch Type");
//         if ApprovalsSetup.Find('-') then begin
//             MovementTracker.Init;
//             MovementTracker."Entry No." := EntryNo;
//             MovementTracker."Document No." := "Batch No.";
//             MovementTracker."Approval Type" := ApprovalsSetup."Approval Type";
//             MovementTracker.Stage := ApprovalsSetup.Stage;
//             MovementTracker."Current Location" := true;
//             MovementTracker.Status := MovementTracker.Status::"Being Processed";
//             MovementTracker.Description := ApprovalsSetup.Description;
//             MovementTracker.Station := ApprovalsSetup.Station;
//             MovementTracker."Date/Time In" := CreateDatetime(Today, Time);
//             MovementTracker.Insert(true);
//         end;
//     end;

//     trigger OnModify()
//     begin
//         if Posted = true then
//             Error('You can not modify a posted batch.');
//     end;

//     var
//         SalesSetup: Record "Sales & Receivables Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         ApprovalsSetup: Record "Approvals Set Up";
//         MovementTracker: Record "Movement Tracker";
//         EntryNo: Integer;
// }

