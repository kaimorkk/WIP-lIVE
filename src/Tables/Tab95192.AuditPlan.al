
table 95192 "Audit Plan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
        }
        field(2; "Audit Plan Type"; Option)
        {
            OptionCaption = ' ,Internal Audit Plan,Project Audit Plan';
            OptionMembers = " ","Internal Audit Plan","Project Audit Plan";
        }
        field(3; "Document Date"; Date)
        {
            Editable = false;
        }
        field(4; "Year Code"; Code[20])
        {
            TableRelation = "G/L Budget Name";
            // TableRelation = "Financial Year Code".Code;

            // trigger OnValidate()
            // begin
            //     FinancialYearCode.Reset;
            //     FinancialYearCode.SetRange(Code, "Year Code");
            //     if FinancialYearCode.FindSet then begin
            //         "Planning Start Date" := FinancialYearCode."Starting Date";
            //         "Planning End Date" := FinancialYearCode."Ending Date";
            //     end;
            //     Description := UpperCase(COMPANYNAME) + ' ' + "Year Code" + ' ' + 'Annual Audit Plan';
            // end;
        }
        field(5; "Planning Start Date"; Date)
        {
            Editable = false;
        }
        field(6; "Planning End Date"; Date)
        {
            Editable = false;
        }
        field(7; "Corporate Strategic Plan ID"; Code[20])
        {
            TableRelation = "Corporate Strategic Plans";

            trigger OnValidate()
            begin
                CSP.Reset();
                CSP.SetRange(Code, "Corporate Strategic Plan ID");
                if CSP.FindFirst() then begin
                    "Planning Start Date" := CSP."Start Date";
                    "Planning End Date" := CSP."End Date";
                end;
            end;
        }
        field(8; "Budget Code"; Code[20])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.", "Budget Code");
                if Job.FindSet then begin
                    "Budget Name" := Job.Description;
                end;
            end;
        }
        field(9; "Budget Name"; Text[250])
        {
            Editable = false;
        }
        field(10; Description; Text[2048])
        {
        }
        field(11; "Overall Purpose"; Text[2048])
        {
        }
        field(12; "Internal Audit Charter ID"; Code[20])
        {
            TableRelation = "Internal Audit Charter".Code;
        }
        field(13; "Chief Audit Executive ID"; Code[10])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(14; Blocked; Boolean)
        {
        }
        field(15; "No. Of Budgeted New Audit Proj"; Integer)
        {
            CalcFormula = count("Audit Plan Line" where("Engagement Category" = filter("New Audit")));
            Description = 'No. of Budgeted New Audit Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "No. Of Budgeted WIP Audit Proj"; Integer)
        {
            CalcFormula = count("Audit Plan Line" where("Engagement Category" = filter("Work In Process")));
            Description = 'No. of Budgeted WIP Audit Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "No. Of Budgeted Audit Follow-u"; Integer)
        {
            CalcFormula = count("Audit Plan Line" where("Engagement Category" = filter("Audit Follow-up")));
            Description = 'No. of Budgeted  Audit Follow-up Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(19; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(20; "Created Datetime"; DateTime)
        {
            Editable = false;
        }
        field(21; "Dimension Set ID"; Integer)
        {
        }
        field(22; "No. Series"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date" := Today;
        Status := Status::Open;

        "Created By" := UserId;
        "Created Datetime" := CreateDatetime(Today, Time);


        if "Audit Plan ID" = '' then begin
            if "Audit Plan Type" = "audit plan type"::"Internal Audit Plan" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Plan Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Plan Nos.", xRec."No. Series", Today, "Audit Plan ID", "No. Series");
            end;
        end;

        if "Audit Plan ID" = '' then begin
            if "Audit Plan Type" = "audit plan type"::"Project Audit Plan" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Plan Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Plan Nos.", xRec."No. Series", Today, "Audit Plan ID", "No. Series");
            end;
        end;
    end;

    var
        // FinancialYearCode: Record "Financial Year Code";
        Job: Record Job;
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CSP: Record "Corporate Strategic Plans";
}

