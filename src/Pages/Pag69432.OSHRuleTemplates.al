

page 69432 "OSH Rule Templates"
{
    CardPageID = "OSH Rule Template";
    PageType = List;
    SourceTable = "OSH Rule Template";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

