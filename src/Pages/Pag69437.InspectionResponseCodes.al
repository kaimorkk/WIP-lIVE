

page 69437 "Inspection Response Codes"
{
    CardPageID = "Inspection Response Code";
    PageType = List;
    SourceTable = "Inspection Response Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Response Code"; Rec."Response Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Code field.';
                }
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

