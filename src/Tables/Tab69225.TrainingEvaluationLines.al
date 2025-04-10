
table 69225 "Training Evaluation Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Evaluation Area"; Text[250])
        {
        }
        field(4; Rating; Option)
        {
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Evaluation Area")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

