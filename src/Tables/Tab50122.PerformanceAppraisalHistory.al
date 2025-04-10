table 50122 "Performance Appraisal History"
{
    Caption = 'Performance Appraisal History';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;

        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            Editable = false;

        }
        field(3; "Appraisal Period"; Code[100])
        {
            Caption = 'Appraisal Period';
            Editable = false;

        }
        field(4; "Appraisers Score out of 80%"; Decimal)
        {
            Caption = 'Appraisers Score out of 80%';
            Editable = false;
        }
        field(5; "Values Score out of 20%"; Decimal)
        {
            Caption = 'Values Score out of 20%';
            Editable = false;
        }
        field(6; "Total Score"; Decimal)
        {
            Caption = 'Total Score';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
