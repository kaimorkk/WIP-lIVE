
table 56093 "Case Hearing"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Case Entry"; Code[50])
        {
            TableRelation = "Case Register"."No.";
        }
        field(2; "Last Hearing Date"; Date)
        {
        }
        field(3; Progress; Text[100])
        {
        }
        field(4; "Next Hearing Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Next Hearing Date" <= "Last Hearing Date" then
                    Error('Next hearing date should be a future date.');
            end;
        }
        field(5; Day; Integer)
        {

            trigger OnValidate()
            begin
                CaseReg.Reset;
                CaseReg.SetRange("No.", "Case Entry");
                if CaseReg.Find('-') then begin
                    CaseReg.CalcFields("Next Hearing Date");
                    "Last Hearing Date" := CaseReg."Next Hearing Date";
                    "Advocate On Record" := CaseReg."Advocate on Record";
                end;
            end;
        }
        field(6; "Advocate On Record"; Code[255])
        {
            FieldClass = Normal;
        }
        field(7; Decision; Text[250])
        {
        }
        field(8; "Bring Up Date"; Date)
        {
        }
        field(9; "Entry Type"; Option)
        {
            OptionCaption = 'Hearing,Mention';
            OptionMembers = Hearing,Mention;
        }
    }

    keys
    {
        key(Key1; "Case Entry", Day, "Entry Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CaseReg: Record "Case Register";
}

