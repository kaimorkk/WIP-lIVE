

page 95114 "Assurance Level Criteria"
{
    CardPageID = "Assurance Level Criterion";
    PageType = List;
    SourceTable = "Assurance Level Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
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

