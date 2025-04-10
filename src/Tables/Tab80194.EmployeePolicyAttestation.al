Table 80194 "Employee Policy Attestation"
{

    fields
    {
        field(1; "Attestation No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Attestation No." <> xRec."Attestation No." then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Policy Attestation No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Policy No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;

            trigger OnValidate()
            begin
                if Policy.Get("Policy No.") then begin
                    "Policy Name" := Policy."Policy Name";
                    "External Document No" := Policy."External Ref No";
                    "Policy Goal" := Policy."Policy Goal";
                end;
            end;
        }
        field(3; "Policy Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "External Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Policy Goal"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then begin
                    Name := Employee.FullName;
                    "Primary Directorate" := Employee."Directorate Code";
                    "Primary Department" := Employee."Directorate Code";

                end;
            end;
        }
        field(7; Name; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(10; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(2));
        }
        field(11; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Employee Signing Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pending,Approved';
            OptionMembers = Pending,Approved;
        }
        field(13; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date Approved"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Attestation No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Attestation No." = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("Policy Attestation No. Series");
            NoSeriesMgt.InitSeries(SPMSetup."Policy Attestation No. Series", xRec."No. Series", 0D, "Attestation No.", "No. Series");
        end;
        "Document Date" := Today;
    end;

    var
        SPMSetup: Record "Policy Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Policy: Record Policy;
        Employee: Record Employee;
}

