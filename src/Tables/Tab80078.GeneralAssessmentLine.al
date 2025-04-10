
table 80078 "General Assessment Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "General Assessment Template ID"; Code[30])
        {
        }
        field(3; "Line Type"; Option)
        {
            OptionCaption = 'Assessment Area,Question';
            OptionMembers = "Assessment Area",Question;
        }
        field(4; "Assessment Area ID"; Code[10])
        {
        }
        field(5; "Response Type"; Option)
        {
            OptionCaption = 'Both Appraisee & Appraiser,Appraisee Only,Appraiser Only';
            OptionMembers = "Both Appraisee & Appraiser","Appraisee Only","Appraiser Only";
        }
        field(6; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

