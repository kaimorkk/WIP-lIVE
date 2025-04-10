
table 80220 "BR Survey Score Guide"
{
    DrillDownPageID = "BR Survey Score Guide";
    LookupPageID = "BR Survey Score Guide";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Survey ID"; Code[30])
        {
            TableRelation = "Business Research Survey"."Document No.";
        }
        field(2; "Section Code"; Code[50])
        {
            TableRelation = "BR Survey Section"."Section Code" where("Survey ID" = field("Survey ID"));
        }
        field(3; "Question ID"; Code[10])
        {
            TableRelation = "BR Survey Question"."Question ID" where("Survey ID" = field("Survey ID"));
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
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
        field(9; "code"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Survey ID", "Section Code", "Question ID", "Line No.", "Response Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Response Value", "Score %")
        {
        }
    }
}

