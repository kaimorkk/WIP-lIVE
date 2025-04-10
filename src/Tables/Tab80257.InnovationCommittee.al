
table 80257 "Innovation Committee"
{
    // DrillDownPageID = "IFS Tender Committee";
    // LookupPageID = "IFS Tender Committee";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Description = 'Linked to E-Procurement No. Series (Procurement Standing Committee No. Series field)';

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    InnovationSetup.TestField("Inno Committee Voucher Nos.");
                    NoMgt.TestManual(InnovationSetup."Inno Committee Voucher Nos.");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Committee Type"; Code[10])
        {

            trigger OnValidate()
            begin
                /*ProcCommType.RESET;
                ProcCommType.SETRANGE("Committee Type","Committee Type");
                IF ProcCommType.FINDSET THEN BEGIN
                  ProcCommType.CALCFIELDS("Min. No. of Members");
                  "Min Required No. of Members":=ProcCommType."Min. No. of Members";
                  END;*/

            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Appointment Effective Date"; Date)
        {
        }
        field(5; "Appointing Authority"; Code[50])
        {
        }
        field(6; "Tender Name"; Text[250])
        {
        }
        field(7; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; "Primary Region"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
        }
        field(12; "No. Series"; Code[10])
        {
        }
        field(13; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            Editable = false;
        }
        field(16; "IFS Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                /*ifs.RESET;
                ifs.SETRANGE(Code,"IFS Code");
                IF ifs.FINDSET THEN BEGIN
                  ProcCommType.RESET;
                  ProcCommType.SETRANGE("Committee Type","Committee Type");
                  IF ProcCommType.FINDSET THEN BEGIN
                  Description:= "IFS Code" + '_'+ProcCommType.Description;
                
                  END;
                  "Document Date":=TODAY;
                  "External Document No":=ifs.Code;
                  "Appointment Effective Date":=TODAY;
                  "Tender Name":=ifs."Tender Name";
                  CompanyInfo.GET;
                  "Appointing Authority":=CompanyInfo."Headed By";
                  END;*/

            end;
        }
        field(17; "Document Date"; Date)
        {
        }
        field(18; "Document Status"; Option)
        {
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(19; "Contract No."; Code[30])
        {
        }
        field(20; "External Document No"; Code[30])
        {
        }
        field(21; "Raised By"; Code[100])
        {
            Editable = false;
        }
        field(22; Name; Text[100])
        {
            Editable = false;
        }
        field(23; "Staff Id"; Code[50])
        {
            Editable = false;
        }
        field(24; Designation; Code[50])
        {
        }
        field(25; "Min Required No. of Members"; Decimal)
        {
            Description = 'Minimum Required No. of Members';
            Editable = false;
        }
        field(26; "Actual No. of Committee Memb"; Integer)
        {
            Caption = 'Actual No. of Committee Members';
            FieldClass = Normal;
        }
        field(27; Duration; Decimal)
        {
        }
        field(28; Location; Text[30])
        {
            Editable = false;
        }
        field(29; "Imprest Created"; Boolean)
        {
        }
        field(30; "Memo No."; Code[30])
        {
        }
        field(35; "Defined For Upgrade"; Code[30])
        {
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
            InnovationSetup.Get;
            InnovationSetup.TestField("Inno Committee Voucher Nos.");
            NoMgt.InitSeries(InnovationSetup."Inno Committee Voucher Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
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
        InnovationSetup: Record "Innovation Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        ifs: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
}

