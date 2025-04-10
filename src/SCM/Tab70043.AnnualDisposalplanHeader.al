table 70043 "Annual Disposal plan Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;
        }
        field(2; "Start Date"; Date)
        {
        }
        field(3; "End Date"; Date)
        {
        }
        field(4; Description; Text[60])
        {
        }
        field(5; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(6; "Date Created"; Date)
        {
            Editable = false;
        }
        field(7; "Time Created"; Time)
        {
            Editable = false;
        }
        field(8; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(9; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(10; "Budget Type"; Option)
        {
            OptionCaption = 'Approved,Revised,Sublimentary';
            OptionMembers = Approved,Revised,Sublimentary;
        }
        field(11; Select; Boolean)
        {
        }
        field(12; "Budget Plan Posted"; Boolean)
        {
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Echequer Job ID"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(15; "Financial Year Code"; Code[20])
        {
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                financialYear.Reset;
                financialYear.SetRange(financialYear.Code, "Financial Year Code");
                if financialYear.FindSet then begin
                    "Start Date" := financialYear."Starting Date";
                    "End Date" := financialYear."Ending Date";
                end
            end;
        }
        field(16; "Disposal Catetory"; Option)
        {
            OptionCaption = 'Functional Disposal,Consolidated Disposal';
            OptionMembers = "Functional Disposal","Consolidated Disposal";
        }
        field(17; "Consolidate Disposal Plan"; Code[30])
        {
            TableRelation = "Annual Disposal plan Header".No where("Disposal Catetory" = const("Consolidated Disposal"));
        }
        field(18; "Document Status"; Option)
        {
            Editable = false;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            var
                Dimension: Record "Dimension Value";
            begin
                Dimension.Reset();
                Dimension.SetRange(Dimension.Code, rec."Global Dimension 1 Code");
                if Dimension.FindFirst() then
                    "Geo Graphical Name" := Dimension.Name;
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(21; "Geo Graphical Name"; text[100])
        {
            DataClassification = ToBeClassified;
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
        if "Disposal Catetory" = "disposal catetory"::"Consolidated Disposal" then begin
            if No = '' then begin
                ProcurementSetup.Get;
                ProcurementSetup.TestField("Disposal Plan Nos");
                NoSeriesMgt.InitSeries(ProcurementSetup."Disposal Plan Nos", xRec.No, 0D, No, "No. Series");
            end;
        end;

        if "Disposal Catetory" = "disposal catetory"::"Functional Disposal" then begin
            if No = '' then begin
                ProcurementSetup.Get;
                ProcurementSetup.TestField("Functional Disposal Plan Nos");
                NoSeriesMgt.InitSeries(ProcurementSetup."Functional Disposal Plan Nos", xRec.No, 0D, No, "No. Series");
            end;
        end;

        "Created By" := UserId;
        "Time Created" := Time;
        "Date Created" := Today;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ProcurementSetup: Record "Procurement Setup";
        financialYear: Record "Financial Year Code";
}

