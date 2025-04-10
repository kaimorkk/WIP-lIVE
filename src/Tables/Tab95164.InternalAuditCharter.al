
table 95164 "Internal Audit Charter"
{
    DrillDownPageID = "Internal Audit Charters";
    LookupPageID = "Internal Audit Charters";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "External Document No."; Code[20])
        {
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; Overview; Text[2048])
        {
        }
        field(6; "CAE ID"; Code[20])
        {
            Description = 'Chief Audit Executive (CAE) ID\';
            TableRelation = "Risk & Audit Officer";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                AuditOfficers.Reset;
                AuditOfficers.SetRange("Employee No.", "CAE ID");
                if AuditOfficers.FindSet then begin
                    "CAE ID" := AuditOfficers."Employee No.";
                    "CAE Name" := AuditOfficers."Employee Name";
                end;
            end;
        }
        field(7; "CAE Name"; Text[250])
        {
            Editable = false;
            TableRelation = "Risk & Audit Officer";
        }
        field(8; "CAE Directly Reports-To"; Code[20])
        {
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(9; "CAE Indirectly Reports-To"; Code[20])
        {
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(10; "Approved By"; Code[50])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        // CompanyJobs: Record "ManPower Planning Lines";
        AuditOfficers: Record "Risk & Audit Officer";
}

