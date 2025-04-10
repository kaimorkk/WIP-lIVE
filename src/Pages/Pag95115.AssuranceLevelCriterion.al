

page 95115 "Assurance Level Criterion"
{
    PageType = Card;
    SourceTable = "Assurance Level Criteria";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Assurance Level ID"; Rec."Assurance Level ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assurance Level ID field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

