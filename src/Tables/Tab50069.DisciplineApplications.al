// table 50169 "Discipline Applications"
// {
//     Caption = 'Discipline Grievance';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "No."; Code[20])
//         {
//             Caption = 'No.';
//             Editable = false;
//             trigger OnValidate()
//             begin
//                 if (Type = Type::Grievance) then begin
//                     HRSetup.Get;
//                     HRSetup.TestField("Discipline Grievance Nos.");
//                     NoSeriesMgt.TestManual(HRSetup."Discipline Grievance Nos.");
//                 end
//                 else
//                     if (Type = Type::SurCharge) then begin
//                         HRSetup.Get;
//                         HRSetup.TestField("Discipline Surcharge Nos.");
//                         NoSeriesMgt.InitSeries(HRSetup."Discipline Surcharge Nos.", xRec."No. Series", 0D, "No.", "No. Series");
//                     end;
//             end;
//         }
//         field(2; Description; Text[1000])
//         {
//             Caption = 'Description';
//         }
//         field(3; "Employee No."; Code[20])
//         {
//             Caption = 'Employee No.';
//             TableRelation = Employee;
//             trigger OnValidate()
//             var
//                 Emp: Record Employee;
//             begin
//                 Emp.Get("Employee No.");
//                 "Employee Name" := Emp.FullName();
//                 Designation := Emp."Job Title";
//                 if Emp."Job Title2" <> '' then
//                     Designation := Emp."Job Title2";
//             end;
//         }
//         field(4; "Employee Name"; Text[100])
//         {
//             Caption = 'Employee Name';
//             Editable = false;
//         }
//         field(5; Designation; Text[250])
//         {
//             Caption = 'Designation';
//             Editable = false;
//         }
//         field(6; "Accused Employee"; Code[20])
//         {
//             Caption = 'Accused Employee';
//             TableRelation = Employee;
//             trigger OnValidate()
//             var
//                 Emp: Record Employee;
//             begin
//                 Emp.Get("Accused Employee");
//                 "Accused Employee Name" := Emp.FullName();
//                 "Accused Employee Designation" := Emp."Job Title";
//                 if Emp."Job Title2" <> '' then
//                     "Accused Employee Designation" := Emp."Job Title2";
//             end;
//         }
//         field(7; "Accused Employee Name"; Text[100])
//         {
//             Caption = 'Accused Employee Name';
//             Editable = false;
//         }
//         field(8; "No. Series"; Code[20])
//         {
//             Caption = 'No. Series';
//             Editable = false;
//         }
//         field(9; Status; Option)
//         {
//             Caption = 'Status';
//             OptionMembers = New,Submitted;
//         }
//         field(10; "Document Date"; Date)
//         {

//         }

//         field(11; "Date Created"; Date)
//         {
//             Editable = false;

//         }
//         field(12; "Accused Employee Designation"; Text[250])
//         {
//             Editable = false;
//         }
//         field(13; "Date Submitted"; DateTime)
//         {
//             Editable = false;
//         }
//         field(14; "Submitted By"; Code[50])
//         {
//             Editable = false;
//         }
//         field(15; "Created By"; Code[50])
//         {
//             Editable = false;
//         }
//         field(16; "Type"; Option)
//         {
//             OptionMembers = " ",Grievance,SurCharge;
//         }
//         field(17; "Value of Property"; Decimal)
//         {

//         }
//         field(18; "Description of Property"; Text[1000])
//         {

//         }


//     }
//     keys
//     {
//         key(PK; "No.", Type)
//         {
//             Clustered = true;
//         }
//     }

//     trigger OnInsert()
//     begin

//         if "No." = '' then begin
//             if Type = Type::Grievance then begin
//                 HRSetup.Get;
//                 HRSetup.TestField("Discipline Grievance Nos.");
//                 NoSeriesMgt.InitSeries(HRSetup."Discipline Grievance Nos.", xRec."No. Series", 0D, "No.", "No. Series");
//             end else
//                 if (Type = Type::SurCharge) then begin
//                     HRSetup.Get;
//                     HRSetup.TestField("Discipline Surcharge Nos.");
//                     NoSeriesMgt.InitSeries(HRSetup."Discipline Surcharge Nos.", xRec."No. Series", 0D, "No.", "No. Series");
//                 end;

//         end;
//         "Created By" := UserId;
//         "Date Created" := Today;
//         "Document Date" := Today;
//     end;

//     procedure SubmitDocument()
//     var
//         DisciplineGrievance: Record "Discipline Applications";
//         SubmitQuery: Label 'Sure to submit the document?';
//         SubmittedSuccessfully: Label 'The document has been submitted successfully!';
//     begin
//         if not Confirm(SubmitQuery, false) then exit;

//         if Type = Type::Grievance then begin
//             Rec.TestField("Accused Employee");
//         end;
//         if Type = Type::SurCharge then begin
//             Rec.TestField("Value of Property");
//             Rec.TestField("Description of Property");
//         end;
//         Rec.TestField("Document Date");
//         Rec.TestField(Description);
//         Rec.Status := Rec.Status::Submitted;
//         Rec."Date Submitted" := CurrentDateTime;
//         Rec."Submitted By" := UserId;
//         Rec.Modify();

//         Message(SubmittedSuccessfully);
//     end;

//     var
//         HRSetup: Record "Human Resources Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;

// }