
table 80068 "Perfomance Scale Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Performance Scale ID"; Code[50])
        {
        }
        field(2; "Perfomance Grade"; Code[100])
        {
        }
        field(3; "Default Score Value"; Decimal)
        {
        }
        field(4; "Behavioral Indicator"; Text[255])
        {
        }
        field(5; "Lower Limit Target (%)"; Decimal)
        {

            trigger OnValidate()
            begin
                if ("Scale Type" = "scale type"::"Excellent-Poor(5-1)") then begin
                    "Lower Limit Criteria Value" := ((((200 - "Lower Limit Target (%)") / 200) * -4) + 5);
                    "Criteria Value Range Span" := "Upper Limit Criteria Value" - "Lower Limit Criteria Value";
                end;

                if ("Scale Type" = "scale type"::"Excellent-Poor(1-5)") then begin
                    "Lower Limit Criteria Value" := (((200 - "Lower Limit Target (%)" / 200) * 4) + 1);
                    "Criteria Value Range Span" := "Lower Limit Criteria Value" - "Upper Limit Criteria Value";
                end;
            end;
        }
        field(6; "Upper Limit Target (%)"; Decimal)
        {

            trigger OnValidate()
            begin
                if ("Scale Type" = "scale type"::"Excellent-Poor(5-1)") then begin
                    //"Upper Limit Criteria Value":=((((200-"Upper Limit Target (%)")/200)*4)+1);
                    "Upper Limit Criteria Value" := ((((200 - "Upper Limit Target (%)") / 200) * -4) + 5);
                    "Criteria Value Range Span" := "Upper Limit Criteria Value" - "Lower Limit Criteria Value";
                end;

                if ("Scale Type" = "scale type"::"Excellent-Poor(1-5)") then begin
                    //"Upper Limit Criteria Value":=((((200-"Upper Limit Target (%)")/200)*-4)+5);
                    "Upper Limit Criteria Value" := ((((200 - "Upper Limit Target (%)") / 200) * 4) + 1);
                    "Criteria Value Range Span" := "Lower Limit Criteria Value" - "Upper Limit Criteria Value";
                end;
            end;
        }
        field(7; "Lower Limit Criteria Value"; Decimal)
        {
        }
        field(8; "Upper Limit Criteria Value"; Decimal)
        {
        }
        field(9; "Criteria Value Range Span"; Decimal)
        {
        }
        field(10; Description; Text[250])
        {
        }
        field(11; "Scale Type"; Option)
        {
            OptionCaption = 'Excellent-Poor(5-1),Excellent-Poor(1-5)';
            OptionMembers = "Excellent-Poor(5-1)","Excellent-Poor(1-5)";
        }
    }

    keys
    {
        key(Key1; "Performance Scale ID", "Perfomance Grade", "Scale Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerfomanceRatingScale: Record "Perfomance Rating Scale";
}

