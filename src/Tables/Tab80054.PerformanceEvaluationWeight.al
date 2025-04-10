
table 80054 "Performance Evaluation Weight"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Per_Evaluation Template ID"; Code[100])
        {
            TableRelation = "Perfomance Evaluation Template".Code;
        }
        field(2; "Key Evaluation Section"; Option)
        {
            OptionCaption = ' ,Objectives & Outcomes,Competency & Company Values';
            OptionMembers = " ","Objectives & Outcomes","Competency & Company Values";
        }
        field(3; "Total Weight (%)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Per_Evaluation Template ID", "Key Evaluation Section")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

