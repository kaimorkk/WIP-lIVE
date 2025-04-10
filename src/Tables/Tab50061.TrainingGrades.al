table 50061 "Training Grades"
{
    Caption = 'Training Grades';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Course; Code[30])
        {
            Caption = 'Course';
            TableRelation = "Training Courses Setup";
        }
        field(2; Grade; Code[10])
        {
            Caption = 'Grade';
            TableRelation = "Salary Scales";
        }

        field(3; "Positions"; Code[20])
        {
            caption = 'Positions';
            TableRelation = "Company Positions";
        }
    }
    keys
    {
        key(PK; Course, Grade)
        {
            Clustered = true;
        }
    }
}
