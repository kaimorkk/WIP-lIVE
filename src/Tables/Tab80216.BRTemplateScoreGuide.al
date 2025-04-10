
table 80216 "BR Template Score Guide"
{
    DrillDownPageID = "BR Template Score Guide";
    LookupPageID = "BR Template Score Guide";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[50])
        {
            TableRelation = "BR Template Line"."Template ID";
        }
        field(2; "Section ID"; Code[100])
        {
            TableRelation = "BR Template Line"."Section ID";
        }
        field(3; "Question ID"; Code[100])
        {
            TableRelation = "BR Template Line"."Question ID";
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
        field(7; "Response Value"; Code[100])
        {
            TableRelation = "BR Response Code"."Response Code";

            trigger OnValidate()
            begin
                BRResponseCode.Reset;
                BRResponseCode.SetRange("Response Code", "Response Value");
                if BRResponseCode.FindFirst then begin
                    "Score %" := BRResponseCode."Score (%)";
                end;
            end;
        }
        field(8; "Score %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Section ID", "Question ID", "Line No.", "Response Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BRResponseCode: Record "BR Response Code";
}

