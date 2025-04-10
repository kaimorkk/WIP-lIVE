
table 80235 "BR Branch Survey Question"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Survey ID"; Code[30])
        {
        }
        field(2; "Section Code"; Code[30])
        {
        }
        field(3; "Parent Question ID"; Code[30])
        {
        }
        field(4; Question; Text[255])
        {
        }
        field(5; "Rating Type"; Option)
        {
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";
        }
        field(6; "Parent Response"; Code[30])
        {
            TableRelation = "BR Survey Score Guide"."Response Value" where("Survey ID" = field("Survey ID"),
                                                                            "Section Code" = field("Section Code"),
                                                                            "Question ID" = field("Parent Question ID"));

            trigger OnValidate()
            begin
                /*IF "Rating Type"="Rating Type"::"Options Text" THEN BEGIN
                    IF NOT ("Response Value"='YES') OR ("Response Value"='NO') THEN BEGIN
                       ERROR('Allowed Response is YES/NO');
                    END;
                END;*/

            end;
        }
        field(7; "General Response Statement"; Text[255])
        {
        }
        field(8; "Assigned Weight %"; Decimal)
        {
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Option Text Response Type"; Code[30])
        {
            Description = 'Added For Filtering';
            TableRelation = w.Code;
        }
        field(11; "Question ID"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Survey ID", "Section Code", "Parent Question ID", "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

