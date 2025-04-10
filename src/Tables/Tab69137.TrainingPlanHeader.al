
table 69137 "Training Plan Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; Global; Boolean)
        {
        }
        field(6; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center";
        }
        field(7; "Department  Name"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Department Code")));
            FieldClass = FlowField;
        }
        field(8; "Year Code"; Code[30])
        {
            //TableRelation = "Annual Reporting Codes".Code;
            Editable = false;
            trigger OnValidate()
            begin
                GLSetup.Get();
                "Start Date" := GLSetup."Current Budget Start Date";
                "End Date" := GLSetup."Current Budget End Date";
            end;
        }
        field(9; "Approved Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Released;
            trigger OnValidate()
            begin
                if "Approved Status" = "Approved Status"::Released then
                    NotifyApplicants();
            end;
        }
        field(10; "Created By"; Code[30])
        {
        }
        field(11; "Created On"; Date)
        {
        }
        field(12; "Corporate Strategic Plan Code"; Code[30])
        {
        }
        field(13; "No. Series"; Code[30])
        {
        }
        field(14; Blocked; Boolean)
        {
        }
        field(15; "Total Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Training Plan Lines"."Estimated Cost" where("Training Plan Code" = field(No)));
            FieldClass = FlowField;
        }
        field(16; "Bugdet Available"; Decimal)
        {
        }
        field(17; "Budget Allocation"; Decimal)
        {
        }
        field(18; "Budget Utilized"; Decimal)
        {
        }
        field(19; "Internal Training"; Decimal)
        {
            CalcFormula = sum("Planning Line Entry"."Planned Budget" where("Training Plan Id" = field(No),
                                                                            "Training Type" = filter(Internal)));
            FieldClass = FlowField;
        }
        field(20; "External Training"; Decimal)
        {
            CalcFormula = sum("Planning Line Entry"."Planned Budget" where("Training Plan Id" = field(No),
                                                                            "Training Type" = filter(External)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if No = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Traning Planning Nos");
            NoSeriesMgt.InitSeries(HRSetup."Traning Planning Nos", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Created By" := UserId;
        "Created On" := Today;
        GLSetup.Get();
        "Year Code" := GLSetup."Current Budget";
        Validate("Year Code");
        //Find budget
        Budget.Reset();
        Budget.SetRange("Budget Name", "Year Code");
        Budget.SetRange("G/L Account No.", HRSetup."Account No (Training)");
        // Budget.CalcSums(Amount, "Budgeted Amount");
        "Bugdet Available" := Budget.Amount;
        // "Budget Allocation" := Budget."Budgeted Amount";
        "Budget Utilized" := "Budget Allocation" - "Bugdet Available";
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        userSetup: Record "User Setup";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        PlanEntry: Record "Planning Line Entry";
        GLSetup: Record "Cash Management Setup";
        Budget: Record "G/L Budget Entry";
        PlanLines: Record "Training Plan lines";
        Needs: Record "Training Needs Header";
        NeedsRequests: Record "Training Needs Requests";

    procedure NotifyApplicants()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
        Recipient: List of [Text];
        Resource: Record Resource;
        Emp: Record Employee;
        Subject: Text[100];
        Instr: InStream;
        Outstr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;

    begin
        //     Needs.Reset();
        //     Needs.SetRange("Training Plan No", Rec.No);
        //     if Needs.FindSet() then
        //         repeat
        //             Subject := 'Approved Training Plan';
        //             Body := 'Dear ' + Needs."Employee Name" + ',<br>';
        //             if (Emp.Get(Needs."Employee No")) and (Emp."Company E-Mail" <> '') then begin
        //                 Recipient.Add(Emp."Company E-Mail");

        //                 NeedsRequests.Reset();
        //                 NeedsRequests.SetRange("Training Header No.", Needs.Code);
        //                 if NeedsRequests.FindSet() then
        //                     repeat
        //                         PlanLines.Reset();
        //                         PlanLines.SetRange("Training Plan Code", Rec.No);
        //                         PlanLines.SetRange("Course Title", NeedsRequests."Course ID");
        //                         PlanLines.SetRange(Status, PlanLines.Status::Approved);
        //                         if PlanLines.FindFirst() then
        //                             Body += 'Your training request for course ' + PlanLines."Course Description" + ' has been approved. <br> Please find attached the approved training plan.'
        //                         else
        //                             Body += 'Your training request for course ' + PlanLines."Course Description" + ' has been rejected. <br> Please find attached the approved training plan.'

        //                     until NeedsRequests.Next() = 0;
        //                 EmailMessage.Create(Recipient, Subject, Body, true);
        //                 RecRef.GetTable(Rec);
        //                 TempBlob.CreateOutStream(OutStr);
        //                 Report.SaveAs(Report::"Annual Training Plan", '', ReportFormat::Pdf, OutStr, RecRef);
        //                 TempBlob.CreateInStream(InStr);
        //                 EmailMessage.AddAttachment('Annual Training Plan.pdf', 'PDF', InStr);

        //                 Email.Send(EmailMessage);
        //             end;
        //         until Needs.Next() = 0;
    end;
}