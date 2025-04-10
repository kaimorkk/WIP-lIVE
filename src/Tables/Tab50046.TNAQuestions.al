table 50046 "TNA Questions"
{
    Caption = 'TNA Questions';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Training No"; Code[20])
        {
            Caption = 'Training No';
            Editable = false;
        }
        field(2; "Question ID"; Code[30])
        {
            Caption = 'Question ID';
            Editable = false;
        }
        field(3; Question; Text[2048])
        {
            Caption = 'Question';
            Editable = false;
        }
        field(4; Answer; Text[2048])
        {
            Caption = 'Answer';
        }
    }
    keys
    {
        key(PK; "Training No", "Question ID")
        {
            Clustered = true;
        }
    }
}
