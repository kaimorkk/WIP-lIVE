table 69455 "Employee Exit header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    if ("Document Type" = "document type"::"Exit Voucher") then begin
                        HRSetup.Get;
                        NoSeriesMgt.TestManual(HRSetup."Exit voucher Nos");
                        "No. Series" := '';
                    end;
                    if ("Document Type" = "document type"::"Hand Over Voucher") then begin
                        HRSetup.Get;
                        NoSeriesMgt.TestManual(HRSetup."Exit HandOver Nos");
                        "No. Series" := '';
                    end;
                    if ("Document Type" = "document type"::"Final Dues Voucher") then begin
                        HRSetup.Get;
                        NoSeriesMgt.TestManual(HRSetup."Final Interview  Nos.");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ' ,Exit Voucher,Hand Over Voucher,Final Dues Voucher';
            OptionMembers = " ","Exit Voucher","Hand Over Voucher","Final Dues Voucher";
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                Employee.SetAutoCalcFields("Leave Outstanding Bal");
                if Employee.FindFirst then begin
                    "Employee Names" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Date of Join" := Employee."Date Of Join";
                    "Job Id" := Employee."Current Position ID";
                    "Leave Days Due Payable" := Employee."Leave Outstanding Bal";
                    Validate("Job Id");
                end;
            end;
        }
        field(5; "Employee Names"; Text[100])
        {
        }
        field(6; "Exit Method"; Code[30])
        {
            TableRelation = "Exit Methods".Code;
        }
        field(7; "Job Id"; Code[30])
        {

            trigger OnValidate()
            begin
                PositionExitTemplates.Reset;
                PositionExitTemplates.SetRange("Postion ID", "Job Id");
                if PositionExitTemplates.FindSet then begin
                    repeat
                        ExitPlanLines.Init;
                        ExitPlanLines."Exit Header No" := "Document No.";
                        ExitPlanLines."Document Type" := "Document Type";
                        ExitPlanLines."Line No" := PositionExitTemplates.Code;
                        ExitPlanLines."Primary Directorate" := PositionExitTemplates."Primary Directorate";
                        ExitPlanLines."Primary Directorate Name" := PositionExitTemplates."Primary Directorate Name";
                        ExitPlanLines."Primary Department" := PositionExitTemplates."Primary Department";
                        ExitPlanLines."Primary Department Name" := PositionExitTemplates."Primary Department Name";
                        ExitPlanLines.Insert;
                    until PositionExitTemplates.Next = 0;
                end;
            end;
        }
        field(8; "Reasons Code"; Code[30])
        {
            TableRelation = "Reasons for Exit".Code;
        }
        field(9; "Date of Join"; Date)
        {
        }
        field(10; "Last working Date"; Date)
        {
        }
        field(11; "Notice Date"; Date)
        {
        }
        field(12; "Employee Exit Date"; Date)
        {
        }
        field(13; "No of Hand Over Notes"; Integer)
        {
        }
        field(14; "No of Open Hand Over Notes"; Integer)
        {
        }
        field(15; "No of Open Hand Cleared Notes"; Integer)
        {
        }
        field(16; "Created By"; Code[50])
        {
        }
        field(17; "Created On"; Date)
        {
        }
        field(18; "Document Date"; Date)
        {
        }
        field(20; Posted; Boolean)
        {
            Editable = false;
        }
        field(21; "No. Series"; Code[20])
        {
        }
        field(22; "Primary Directorate"; Code[50])
        {
            Description = 'Hand Over Process';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(23; "Primary Directorate Name"; Text[250])
        {
            Description = 'Hand Over Process';
        }
        field(24; "Primary Department"; Code[50])
        {
            Description = 'Hand Over Process';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(25; "Primary Department Name"; Text[250])
        {
            Description = 'Hand Over Process';
        }
        field(26; "Responsible Employee"; Code[30])
        {
            Description = 'Hand Over Process';
            TableRelation = Employee."No.";
        }
        field(27; "Planned Date"; Date)
        {
            Description = 'Hand Over Process';
        }
        field(28; "Actual Date"; Date)
        {
            Description = 'Hand Over Process';
        }
        field(29; "Leave Days Due Payable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Notice Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Pay in Lieu of Notice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(33; "Clearing Section"; Enum "Exit Sections")
        {
            DataClassification = ToBeClassified;
        }
        field(34; Cleared; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get();
        if ("Document Type" = "document type"::"Exit Voucher") then begin
            HRSetup.TestField("Exit voucher Nos");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Exit voucher Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if ("Document Type" = "document type"::"Hand Over Voucher") then begin
            HRSetup.TestField("Exit HandOver Nos");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Exit HandOver Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if ("Document Type" = "document type"::"Final Dues Voucher") then begin
            HRSetup.TestField("Exit Final Dues Nos");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Exit Final Dues Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        Employee: Record Employee;
        ExitPlanLines: Record "Exit Plan Lines";
        PositionExitTemplates: Record "Position Exit Templates";
}

