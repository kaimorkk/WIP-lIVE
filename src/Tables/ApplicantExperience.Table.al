Table 52193965 "Applicant Experience"
{

    fields
    {
        field(1;"Employee No.";Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = Applicants1."No.";
        }
        field(2;"Line No.";Integer)
        {
            Caption = 'Line No.';
        }
        field(3;"From Date";Date)
        {
            Caption = 'From Date';
        }
        field(4;"To Date";Date)
        {
            Caption = 'To Date';
        }
        field(5;Position;Text[50])
        {
            Caption = 'Description';
        }
        field(6;Responsibility;Text[250])
        {
        }
        field(7;"Institution/Company";Text[50])
        {
            Caption = 'Institution/Company';
        }
        field(8;"Position Code";Code[20])
        {
            TableRelation = "Former Positions";

            trigger OnValidate()
            begin
                 FormerPositions.Reset;
                 FormerPositions.SetRange(FormerPositions.Code,"Position Code");
                 if FormerPositions.Find('-') then
                   Position:=FormerPositions.Description;
            end;
        }
        field(9;"Experience No";Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;"Experience No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FormerPositions: Record "Former Positions";
}

