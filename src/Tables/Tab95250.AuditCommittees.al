
table 95250 "Audit Committees"
{
    DrillDownPageID = "Risk & Audit Committee";
    LookupPageID = "Risk & Audit Committee";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to E-Procurement No. Series (Procurement Standing Committee No. Series field)';

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    ProcurementSetup.TestField("Committees No.");
                    NoMgt.TestManual(ProcurementSetup."Committees No.");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Committee Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Committee Types"."Committee Type";

            trigger OnValidate()
            begin
                ProcCommType.Reset;
                ProcCommType.SetRange("Committee Type", "Committee Type");
                if ProcCommType.FindSet then begin
                    ProcCommType.CalcFields("Min. No. of Members");
                    "Min Required No. of Members" := ProcCommType."Min. No. of Members";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Appointment Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Appointing Authority"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Tender Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Primary Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                // ifs.RESET;
                // ifs.SETRANGE(Code,"IFS Code");
                // IF ifs.FINDSET THEN BEGIN
                //  ProcCommType.RESET;
                //  ProcCommType.SETRANGE("Committee Type","Committee Type");
                //  IF ProcCommType.FINDSET THEN BEGIN
                //  Description:= "IFS Code" + '_'+ProcCommType.Description;
                //
                //  END;
                //  "Document Date":=TODAY;
                //  "External Document No":=ifs.Code;
                //  "Appointment Effective Date":=TODAY;
                //  "Tender Name":=ifs."Tender Name";
                //  CompanyInfo.GET;
                //  "Appointing Authority":=CompanyInfo."Headed By";
                //  END;
            end;
        }
        field(17; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(19; "Contract No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "External Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Raised By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Staff Id"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; Designation; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Min Required No. of Members"; Decimal)
        {
            Description = 'Minimum Required No. of Members';
            Editable = false;
        }
        field(26; "Actual No. of Committee Memb"; Integer)
        {
            // CalcFormula = count("IFS Tender Committee Member" where("Document No." = field("Document No.")));
            // Caption = 'Actual No. of Committee Members';
            // FieldClass = FlowField;
        }
        field(27; Duration; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; Location; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Imprest Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Memo No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Road Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Road Section No."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Measurement Sheets"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Inspection; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Clustered';
            OptionMembers = Individual,Clustered;
        }
        field(36; "Applicable Area"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ', ICT';
            OptionMembers = " ",ICT;
        }
        field(37; "ICT Project No"; Code[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "ICT Project"."No.";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Committees No.");
            NoMgt.InitSeries(ProcurementSetup."Committees No.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            "Raised By" := UserId;
            Name := UserSetup."Employee Name";
            "Staff Id" := UserSetup."Employee No.";
            Emp.Reset;
            Emp.SetRange("No.", UserSetup."Employee No.");
            if Emp.FindSet then
                Designation := Emp."Job Title";
            "Primary Department" := Emp."Department Code";
            "Primary Directorate" := Emp."Directorate Code";
            // "Primary Region" := Emp.Region;
        end;
    end;

    var
        ProcurementSetup: Record "Audit & Assurance Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        ProcCommType: Record "Audit Committee Types";
        ifs: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
}

