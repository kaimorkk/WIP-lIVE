

page 95143 "Audit Testing Method Details"
{
    CardPageID = "Audit Testing Method Detail";
    PageType = List;
    SourceTable = "Audit Testing Method Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Testing Method ID"; Rec."Audit Testing Method ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Testing Method ID field.';
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

