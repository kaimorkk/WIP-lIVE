
table 80225 "BR Response Score Guide"
{
    DrillDownPageID = "BR Response Score Guide";
    LookupPageID = "BR Response Score Guide";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Survey Response ID"; Code[30])
        {
        }
        field(2; "Section Code"; Code[30])
        {
        }
        field(3; "Question ID"; Code[30])
        {
        }
        field(4; "Line No"; Integer)
        {
        }
        field(5; "Rating Type"; Option)
        {
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";
        }
        field(6; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(7; "Response Value"; Code[50])
        {
            TableRelation = "BR Response Code"."Response Code";
        }
        field(8; "Score %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Survey Response ID", "Section Code", "Question ID", "Line No", "Response Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Survey Response ID", "Section Code", "Question ID", "Line No", "Response Value")
        {
        }
        fieldgroup(Brick; "Survey Response ID", "Section Code", "Question ID", "Line No", "Response Value")
        {
        }
    }
}

